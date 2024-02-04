package com.fork.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Utils {
	
	// 변경된 이름을 돌려주면서, 원본파일을 변경된 파일이름으로 서버에 저장시키는 메소드
    public static String saveFile(MultipartFile upfile, String savePath) {
        String originName = upfile.getOriginalFilename();
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int random = (int) (Math.random() * 90000 + 10000);
        String ext = "";

        int lastIndex = originName.lastIndexOf(".");
        if (lastIndex >= 0) {
            ext = originName.substring(lastIndex);
        }

        String changeName = currentTime + random + ext;

        try {
            upfile.transferTo(new File(savePath + changeName));
        } catch (IllegalStateException e) {
            log.error("파일 저장 오류 - IllegalStateException: {}", e.getMessage());
        } catch (IOException e) {
            log.error("파일 저장 오류 - IOException: {}", e.getMessage());
        }

        return changeName;
    }
	
	
    // 파일 삭제 메서드
    public static boolean deleteFile(String filePath) {
        File file = new File(filePath);
        if (file.exists()) {
            return file.delete();
        }
        return false;
    }
	
	
	
	// 크로스 사이트 스크립트 공격을 방지하기 위한 메소드
	public static String XSShandling(String content) {
		if(content != null) {
			content = content.replaceAll("&","&amp;");
			content = content.replaceAll("<","&lt;");
			content = content.replaceAll(">","&gt;");
			content = content.replaceAll("\"","&quot;");
		}
		return content;
	}
	
	// 개행문자 처리
	public static String newLineHandling(String content) {
		return content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
		
	}
	
	// 개행문자 해제
	public static String newLineClear(String content) {
			return content.replaceAll("<br>", "\n");
	}
	
	
	
	
	
	
}
