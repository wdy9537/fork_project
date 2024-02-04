package com.fork.qna.model.vo;

import java.util.List;


import lombok.Data;

@Data
public class QnaExt extends Qna {

	private List<Reply> replyList;
}
