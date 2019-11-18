package com.ch.podo.film.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.film.model.service.FilmService;
import com.ch.podo.film.model.vo.Film;
import com.ch.podo.film.model.vo.Genre;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService filmService;
	
	@RequestMapping("skFilm.do")
	public ModelAndView searchKeywordFilm(ModelAndView mv, String keyword,
																				@RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		int listCount = filmService.selectKeywordFilmListCount(keyword);
		System.out.println("listCount : " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println("pi : " + pi);
		
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
	public void searchFilterFilm(HttpServletResponse response, Film film) throws JsonIOException, IOException {
		// System.out.println("film : " + film);
		ArrayList<Film> list = filmService.selectFilterFilmList(film);
		// System.out.println("list : " + list);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
	}
}
