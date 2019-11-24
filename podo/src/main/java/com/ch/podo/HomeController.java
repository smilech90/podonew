package com.ch.podo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("home.do")
	public ModelAndView home(ModelAndView mv)
			throws Exception {
		
		ArrayList<Film> list = f.selectNewFilms();
		ArrayList<Review> reviewList = rs.selectReviewList();
		
	
		mv.addObject("list", list).addObject("reviewList", reviewList).setViewName("home");

		return mv;
	}
	
}
