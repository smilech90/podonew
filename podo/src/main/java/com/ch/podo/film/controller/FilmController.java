package com.ch.podo.film.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.ch.podo.like.model.vo.Like;
import com.ch.podo.member.model.vo.Member;
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
	public void searchFilterFilm(HttpServletResponse response, HttpSession session, Film film)
			throws JsonIOException, IOException {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Film> filmList = filmService.selectFilterFilmList(film);
		map.put("film", filmList);

		HashMap<Integer, Film> likeMap = (HashMap<Integer, Film>)filmService.selectLikedFilmMap(loginUser.getId());
		map.put("like", likeMap);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(map, response.getWriter());
	}
	
	@RequestMapping("filmLike.do")
	public void filmLike(HttpServletResponse response, HttpSession session, String fid, int flag)
			throws JsonIOException, IOException {
		Member mem = (Member)session.getAttribute("loginUser");
		
		Like like = new Like();
		like.setType(1);
		like.setTargetId(Integer.parseInt(fid));
		like.setUserId(mem.getId());
		
		int result = 0;
		if (flag > 0) {
			result = filmService.insertLikeFilm(like);
		} else {
			result = filmService.deleteLikeFilm(like);
		}
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
	}
	
	
}
