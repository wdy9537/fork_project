package com.fork.kiosk.websocket.model.websocket;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocket
@EnableWebSocketMessageBroker
public class WebsocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/kiosk"); // 메시지 브로커 설정
        //enableSimpleBroker 라는 메소드는 스프링에서 제공하는 내장 브로커를 사용하겠다는 설정입니다. 
        //파라미터로 가지고 있는 값의 의미는 해당값이 prefix로 부터 붙은 메시지가 송신되었을때 그 메시지를 메시지브로커가 처리하겠다는 의미입니다.
        
        //참고로 일종의 관습으로, queue라는 prefix 는 메시지가 1:1로 송신될 때, 
        //그리고 topic 이라는 prefix는 메시지가 1:다 로 여러명에게 송신될 때 주로 사용한다고 합니다.
        
        config.setApplicationDestinationPrefixes("/user"); // 클라이언트로부터 메시지를 수신할 엔드포인트를 설정 이걸로 url주소 끝나야함
        // 메시지는 상황에따라 필요한 경우 바로 브로커로 가는 것이 아니라, 메시지의 어떤 처리나 가공이 필요할 때 핸들러를 타게 할 수 있습니다. 
        // 바로 그 핸들러로 메시지가 라우팅되도록 하는 설정입니다.
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/user").setAllowedOriginPatterns("*").setAllowedOrigins("http://localhost:8082").withSockJS(); // WebSocket 연결을 위한 엔드포인트를 설정합니다.
    }
    
}
