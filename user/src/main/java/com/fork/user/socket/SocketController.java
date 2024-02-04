package com.fork.user.socket;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SocketController {

	@MessageMapping("/TTT")
	@SendTo("/kiosk/1")
	public String ttt(String message) throws Exception {
		log.info("TTT>>" + message);
		return message;
	}
	
}
