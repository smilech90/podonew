package com.ch.podo.inquiry.model.vo;

import java.sql.Date;

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
public class Inquiry {
	private int id;
	private int type;
	private String content;
	private Date createDate;
	private String answer;
	private Date answerDate;
}
