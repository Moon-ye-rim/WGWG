package com.min.edu.ctrl.chatting;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController2 {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/chatOpen.do", method = RequestMethod.GET)
	public String chatOpen() {
		logger.info("@@@@@@ ChatController ChatOpen()시작 @@@@@@");
		return "/chatting/chat2";
	}

}
