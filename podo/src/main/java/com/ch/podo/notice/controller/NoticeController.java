package com.ch.podo.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.notice.model.service.NoticeService;
import com.ch.podo.notice.model.vo.Notice;

@Controller("noticeController")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	public ModelAndView noticeList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = noticeService.getNoticeCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("notice/noticeListView");
		
		return mv;
		
	}
	
	
	@RequestMapping("ninsertForm.do")
	public String NoticeInsertView() {
		return "notice/noticeInsertForm";
	}
	
	
	@RequestMapping("ninsert.do")
	public String insertNotice(Notice n, HttpServletRequest request, Model model) {
		
		int result = noticeService.insertNotice(n);
		
		if(result > 0) {
			return "redirect:nlist.do";
		}else {
			model.addAttribute("");
			return "redirect:nlist.do";
		}
	}
	
	
	@RequestMapping("ndetail.do")
	public ModelAndView noticeDetail(int id, ModelAndView mv) {
		
		Notice n = noticeService.selectNotice(id);
		
		if(n != null) {
			mv.addObject("n", n).setViewName("notice/noticeDetailView");
		}else {
			mv.addObject("msg", "게시글 작성 실패").setViewName("");
		}
		
		return mv;
	}
	
	
	@RequestMapping("ndelete.do")
	public String noticeDelete(int id, HttpServletRequest request) {
		
		Notice n = noticeService.selectUpdateNotice(id);
		
		
		int result = noticeService.deleteNotice(id);
		
		if(result > 0) {
			return "redirect:nlist.do";
		}else {
			return "";
		}
		
	}
	
	
	public ModelAndView noticeUpdateView(int id, ModelAndView mv) {
		
		Notice n = noticeService.selectUpdateNotice(id);
		
		mv.addObject("n", n).setViewName("notice/noticeUpdateForm");
		
		return mv;
	}
	
	
	public ModelAndView noticeUpdate(Notice n, HttpServletRequest request, ModelAndView mv) {
		
		int result = noticeService.updateNotice(n);
		
		if(result > 0) {
			mv.addObject("id", n.getId()).setViewName("redirect:ndetail.do");
		}else {
			mv.addObject("msg", "공지사항 수정 실패").setViewName("");
		}
		
		return mv;
	}
	

}
