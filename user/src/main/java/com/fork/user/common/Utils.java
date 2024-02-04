package com.fork.user.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Utils {

	// 변경된 이름을 돌려주면서 원본파일을 변경된 파일이름으로 서버에 저장시키는 메서드
		public static String saveFile(MultipartFile upfile, String savePath) {
			
			String originName = upfile.getOriginalFilename(); // flower.jpg
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //20230807122350
			int random = (int)(Math.random() * 90000 + 10000); // 5자리 랜덤 정수값
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + random + ext;
			
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
			
		}
	
}
