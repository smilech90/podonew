package com.ch.podo.film.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Film {
	
	private int id;
	private String titleKor;
	private String titleEng;
	private String director;
	private int releaseYear;
	private String productionCountry;
	private String productionStatus;
	private String genre;
	
}
