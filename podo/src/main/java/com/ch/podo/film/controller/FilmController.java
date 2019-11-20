package com.ch.podo.film.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.film.model.service.FilmService;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.film.model.vo.Genre;
import com.ch.podo.like.model.service.LikeService;
import com.ch.podo.like.model.vo.Like;
import com.ch.podo.member.model.vo.Member;
import com.ch.podo.ratingFilm.model.service.RatingFilmService;
import com.ch.podo.ratingFilm.model.vo.RatingFilm;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService filmService;

	@Autowired
	private LikeService likeService;

	@Autowired
	private RatingFilmService ratingFilmService;
	
	@RequestMapping("skFilm.do")
	public ModelAndView searchKeywordFilm(ModelAndView mv, String keyword,
																				@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		int listCount = filmService.selectKeywordFilmListCount(keyword);
		// System.out.println("listCount : " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		// System.out.println("pi : " + pi);
		
		ArrayList<Film> list = filmService.selectKeywordFilmList(keyword, pi);
		mv.addObject("listCount", listCount)
			.addObject("pi", pi)
			.addObject("list", list)
			.setViewName("search/searchAll");
		
		return mv;
	}
	
	@RequestMapping("film.do")
	public String filmPage(Model model) {
		ArrayList<Genre> genre = filmService.selectAllGenreList();
		model.addAttribute("genre", genre);
		return "film/filmPage";
	}
	
	@RequestMapping("sfFilm.do")
	public void searchFilterFilm(HttpServletResponse response, HttpSession session, Film film)
			throws JsonIOException, IOException {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Film> filmList = filmService.selectFilterFilmList(film);
		map.put("film", filmList);

		HashMap<Integer, Film> likeMap = new HashMap<>();
		if (loginUser != null) {
			likeMap = (HashMap<Integer, Film>)likeService.selectLikedFilmMap(loginUser.getId());
		}
		map.put("like", likeMap);
		
		HashMap<Integer, RatingFilm> ratingMap = new HashMap<>();
		if (loginUser != null) {
			ratingMap = (HashMap<Integer, RatingFilm>)ratingFilmService.selectRatedFilm(loginUser.getId());
		}
		map.put("rate", ratingMap);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(map, response.getWriter());
	}
	
	@RequestMapping("likeFilm.do")
	public void likeFilm(HttpServletResponse response, HttpSession session, String fid, int flag)
			throws JsonIOException, IOException {
		Member mem = (Member)session.getAttribute("loginUser");
		
		Like like = new Like();
		like.setTargetId(Integer.parseInt(fid));
		like.setUserId(mem.getId());
		
		int result = 0;
		if (flag > 0) {
			result = likeService.insertLikeFilm(like);
		} else {
			result = likeService.deleteLikeFilm(like);
		}
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
	}
	
	@RequestMapping("rateFilm.do")
	public void rateFilm(HttpServletResponse response, HttpSession session, String fid, String star)
			throws JsonIOException, IOException {
		Member mem = (Member)session.getAttribute("loginUser");
		
		RatingFilm rate = new RatingFilm();
		rate.setStar(Integer.parseInt(star));
		rate.setUserId(mem.getId());
		rate.setFilmId(Integer.parseInt(fid));

		RatingFilm flag = ratingFilmService.selectRatingFilm(rate);
		int result = 0;

		// 이미 기존에 있는 별점을 다시 눌렀을 경우 취소되면서 삭제
		if (flag != null && Integer.parseInt(star) == flag.getStar()) {
			result = ratingFilmService.deleteRateFilm(rate);
			System.out.println("delete 실행");
		} else {
			// 기존에 별점이 없다면 삽입
			if (flag == null) {
				result = ratingFilmService.insertRateFilm(rate);
				System.out.println("insert 실행");
			// 이미 기존에 별점이 있다면 수정
			} else {
				result = ratingFilmService.updateLikeFilm(rate);
				System.out.println("update실행");
			}
		}
		
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 관리자 영화 리스트
	@RequestMapping("flist.ad")
	public ModelAndView filmList(ModelAndView mv, 
								  @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = filmService.getFilmListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Film> list = filmService.selectFilmList(pi);
		
		mv.addObject("pi", pi).addObject("list", list)
		  .setViewName("admin/flimListView");
		
		return mv;
	}
	
	/*
	
	// 관리자 영화 등록
	@RequestMapping("finsertForm.ad")
	public String filmInsertView() {
		return "admin/filmInsertForm";
	}
	
	@RequestMapping("finsert.ad")
	public String insertFilm(Film f, HttpServletRequest request, Model model,
							  @RequestParam(value="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어오는 경우
			String renameFileName = saveFile(file, request);
			
			f.setOriginalFileName(file.getOriginalFilename());
			f.setRenameFileName(renameFileName);
		}
		
		int result = filmService.insertFilm(f);
		
		if(result > 0) {
			return "redirect:flist.ad";
		}	
	}
	
	
	
	
	// 파일 업로드 하고 업로드한 파일명(수정명) 반환하는 메소드 --> 재사용하기 위해 따로 빼둠
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/fuploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs(); // savePath까지의 경로가 존재하지 않다면 폴더 생성
		}
		
		String originFileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		// 201911051717.PNG
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." 
								+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		// ~~~/resources/buploadFiles/201911051717.PNG
		String renamePath = savePath + "/" + renameFileName;
		
		
		try {
			file.transferTo(new File(renamePath)); // 수정명으로 파일 업로드

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		
		
		return renameFileName;
	}
	
	// 관리자 영화 정보 상세보기
	@RequestMapping("fdetail.ad")
	public ModelAndView filmDetail(int id, ModelAndView mv) {
		Film f = filmService.selectFilm(id);
		
		if(f != null) {
			mv.addObject("f", f).setViewName("admin/filmDetailView");
		}
		
		return mv;
	}
	
	// 관리자 영화 삭제
	@RequestMapping("fdelete.ad")
	public String filmDelete(int id, HttpServletRequest request) {
		Film f = filmService.selectUpdateFilm(id);
		
		// 첨부파일이 존재할 경우 
		if(f.getOriginalFileName() != null) {
			// 서버에 업로드되어있는 파일도 삭제
			deleteFile(f.getRenameFileName(), request); // 삭제하고자 하는 파일명과 request 전달
		}
		
		int result = filmService.deleteFilm(id);
		
		if(result > 0) {
			return "redirect:flist.ad";
		}
	}
	
	// 업로드 되어있는 파일 삭제용 메소드
	public void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/fuploadFiles";
		
		
		File f = new File(savePath + "/" + renameFileName);
		
		if(f.exists()) {
			f.delete();
		}
	
	}
	
	@RequestMapping("fupdateView.ad")
	public ModelAndView filmUpdateView(int id, ModelAndView mv) {
		Film f = filmService.selectUpdateFilm(id);
		
		mv.addObject("f", f).setViewName("admin/filmUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("fupdate.ad")
	public ModelAndView filmUpdate(Film f, HttpServletRequest request, ModelAndView mv,
							  @RequestParam(value="reloadFile", required=false) MultipartFile file) {
		
		// 새로운 첨부파일이 넘어왔을 경우
		if(!file.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일이 있을 경우 
			if(f.getOriginalFileName() != null) {
				// 기존의 첨부파일 삭제
				deleteFile(f.getRenameFileName(), request);
			}
			
			// 새로운 첨부파일이 넘어왔을 때
			// 기존에 첨부파일이 있던 없던 간에 서버에 업로드
			String renameFileName = saveFile(file, request);
			
			f.setRenameFileName(renameFileName);
			f.setOriginalFileName(file.getOriginalFilename());
		}
		
		int result = filmService.updateFilm(f);
		
		if(result > 0) {
			mv.addObject("id", f.getId()).setViewName("redirect:fdetail.ad");
		}
		
		return mv;		
	}
	
	*/
	
}
