package com.fork.kiosk.websocket.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebsocketUserController {

	// 결제용
    @MessageMapping("/send/{kioskNo}") // 클라이언트에서 메시지를 보낼 때 사용할 엔드포인트
    @SendTo("/kiosk") // 클라이언트에게 메시지를 보낼 대상 주제
    public String sendKioskNo(@DestinationVariable("kioskNo") String kioskNo, String message) {
        // kioskNo를 받아서 필요한 작업을 수행합니다.
        return message;
    }
    
    // 직원호출용
    @MessageMapping("/send/dingdong/{kioskNo}") // 클라이언트에서 메시지를 보낼 때 사용할 엔드포인트
    @SendTo("/kiosk/dingdong/{kioskNo}") // 클라이언트에게 메시지를 보낼 대상 주제
    public String sendDingdong(@DestinationVariable("kioskNo") String kioskNo, String message) {
        // kioskNo를 받아서 필요한 작업을 수행합니다.
        return message;
    }
    
    // 클리어 테이블
    @MessageMapping("/send/claerTable/{kioskNo}")
    @SendTo("/kiosk/clearTable/{kioskNo}")
    public String sendClearTable(@DestinationVariable("kioskNo") String kioskNo, String message) {
       return message;
    }
    

}
