package com.ch.podo.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.member.model.service.MemberService;
import com.ch.podo.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// @CookieValue(value="storeIdCookie", required = false) Cookie storeIdCookie
	@RequestMapping("login.do")
	public ModelAndView loginMember(Member mem, HttpSession session, ModelAndView mv,
																	boolean rememberMe, HttpServletResponse response, HttpServletRequest request) {
		
		Member loginUser = memberService.selectLoginMember(mem);
		// System.out.println("loginUser : " + loginUser);
		// System.out.println("rememberMe : " + rememberMe);
		
		if (loginUser != null && bcryptPasswordEncoder.matches(mem.getPwd(), loginUser.getPwd())) {
			if (rememberMe == true) {
				Cookie storeEmailCookie = new Cookie("email", mem.getEmail());
				Cookie storePwdCookie = new Cookie("pwd", mem.getPwd());
				storeEmailCookie.setMaxAge(60 * 60 * 24 * 7);
        storePwdCookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(storeEmailCookie);
        response.addCookie(storePwdCookie);
			} else {
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("email") || cookies[i].getName().equals("pwd")) {
						// System.out.println("cookies[" + i + "].name : " + cookies[i].getName());
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
			}
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:home.do");
		} else {
			mv.addObject("msg", "로그인 실패").setViewName("error/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	
	@RequestMapping("insertFormMember.do")
	public String insertForm() {
		return "member/memberInsertForm";
	}
	
	@RequestMapping("insertMember.do")
	public String insertMember(Member mem, HttpServletRequest request, Model model,
							 @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {	// 프로필 사진 등록하는 경우
			String renameFileName = saveFile(file, request);	// 공통 메소드(saveFile)를 만들어서 파일 수정명 반환(수정할 때 재사용하려고 메소드 뺌)
			
			mem.setImage(renameFileName);
		}else {
			mem.setImage("podoImage.png");
		}
		
		String encPwd = bcryptPasswordEncoder.encode(mem.getPwd());
		mem.setPwd(encPwd);
		
		int result = memberService.insertMember(mem);
		
		if(result > 0) {	// 회원가입 성공
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원가입 실패");
			return "redirect:login.do";
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/memberProfileImage";
		
		File folder = new File(savePath);	// 저장 folder를 한번 알아옴
		
		if(!folder.exists()) {	// savePath 경로가 없으면 폴더 생성하기
			folder.mkdir();
		}
		
		String originFileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);	// .뒷자리부터 뽑아내기 위해 +1
		
		String renamePath = savePath + "/" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));	//수정명으로 파일 업로드
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}	
		
		return renameFileName;
	}
	
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idChechk(String id) {
		int result = memberService.idCheck(id);
		
		if(result > 0) {	// 아이디 존재, 사용불가
			return "fail";
		}else { // 사용가능
			return "success";
		}
	}
	
	@ResponseBody
	@RequestMapping("nickCheck.do")
	public String nickCheck(String nick) {
		int result = memberService.nickCheck(nick);
		
		if(result > 0) {	// 닉네임 존재, 사용불가
			return "fail";
		}else {	// 사용가능
			return "success";
		}
	}
	
	@RequestMapping("myPage.do")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("memberUpdateForm.do")
	public String memberUpdateForm() {
		return "member/memberUpdateForm";
	}
	
	@RequestMapping("updateMember.do")
	public ModelAndView updateMember(Member mem, HttpSession session, ModelAndView mv, HttpServletRequest request,
									@RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {	
			String renameFileName = saveFile(file, request);	
			
			mem.setImage(renameFileName);
		}else {
			mem.setImage("podoImage.png");
		}
		
		String encPwd = "";
		if(!mem.getUpdatePwd().equals("")) {	// 패스워드 변경을 하면 암호화 된 패스워드를 pwd에 대입
			encPwd = bcryptPasswordEncoder.encode(mem.getUpdatePwd());
			mem.setPwd(encPwd);
		}else { // 변경을 하지 않으면 updatePwd에 null대입 (updatePwd로 mapper에서 조건걸거임)
			mem.setUpdatePwd(null);
		}
		
		int result = memberService.updateMember(mem);
		
		if(result > 0) {	// 업데이트 성공
			session.setAttribute("loginUser", mem);
			mv.addObject("msg", "회원정보 수정 성공").setViewName("member/myPage");
		}else {
			mv.addObject("msg", "회원정보 수정 실패").setViewName("member/memberUpdateForm");
		}
		
		return mv;
		
		/*
		 * AOP만들기 위한 !
		if(result > 0) {	// 업데이트 성공 시 수정된 mem객체 select
			Member loginUser = memberService.selectUpdateMember(mem);
			
			if(loginUser != null) {	// select 성공 시 session에 담아주기
				session.setAttribute("loginUser", loginUser);
				mv.addObject("msg", "회원정보 수정 성공").setViewName("member/myPage");
			}else {	// select 실패 시 
				mv.addObject("msg", "회원정보 재 조회 실패").setViewName("member/memberUpdateForm");
			}
		}else {
			mv.addObject("msg", "회원정보 수정 실패").setViewName("member/memberUpdateForm");
		}
		
		*/
	}
	
	
	
	
	
	
}
