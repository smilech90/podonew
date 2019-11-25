package com.ch.podo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.service.BoardService;
import com.ch.podo.board.model.vo.Board;
import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.film.model.service.FilmService;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.review.model.dto.Review;
import com.ch.podo.review.model.service.ReviewService;

@Controller
public class HomeController {
	
	@Autowired
	private FilmService f;
	
	@Autowired
	private ReviewService rs;
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping("home.do")
	public ModelAndView home(ModelAndView mv,PageInfo pi,@RequestParam(value="currentPage", defaultValue="1") int currentPage)
			throws Exception {
		
		ArrayList<Film> list = f.selectNewFilms();
		
		
		int listReviewCount = rs.getReviewListCount();
		ArrayList<Review> reviewList = rs.selectReviewList(pi);
		
		
		ArrayList<Board> boardList = bs.selectBoardList(pi);
		int listCount = bs.getBoardCount();
		mv.addObject("list", list).addObject("reviewList", reviewList).addObject("pi", pi).addObject("boardList", boardList).setViewName("home");

		return mv;
	}
	
}
