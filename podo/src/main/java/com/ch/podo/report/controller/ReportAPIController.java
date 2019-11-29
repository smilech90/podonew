package com.ch.podo.report.controller;
import java.util.Optional;

import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ch.podo.member.model.service.MemberService;
import com.ch.podo.report.model.vo.BlackRequest;

import lombok.extern.slf4j.Slf4j;

public class ReportAPIController {

	@Slf4j
	@RestController // @Controller + @ResponseBody
	@RequestMapping("/v1/reportlist")
	public class ReportAPIController {
		private final MemberService memberService;
		
		public ReportAPIController(MemberService memberService) {
			this.memberService = memberService;
		}

		@PostMapping(value = "/black.do")
		// @ResponseBody
		public boolean black(@RequestBody BlackRequest blackRequest) throws Exception {
			String[] blackUsers = Optional.ofNullable(blackRequest) // 자바8 optional 사용 -> nullpointexception 방지를 막음
										.map(BlackRequest::getBlockIds)
										.orElse(null);
			
			if (blackUsers == null || (blackUsers != null && blackUsers.length == 0)) {
				return false;
			}
			
			log.info("blackUsers : {}", blackUsers);
	 
			int result = memberService.addBlackList(blackUsers);
			
			if(result>0) {
				return true;
				
			}else {
				return false;
			}
			
//			return true;
		}
	}
	

}
