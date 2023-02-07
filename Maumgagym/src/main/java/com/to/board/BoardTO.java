package com.to.board;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardTO {
	
	int seq;				// 게시판SEQ
	int category_seq;		// 카테고리번
	String category;		// 카테고리
	String title;			// 제목
	String topic;			//토픽
	String nickname;  		//닉네임
	String name;  		//닉네임
	String content;			//내용
	String writer;			//글쓴이
	int write_seq;			//글번호
	String write_date;		//글쓴날짜
	String status;
	String tag;
	int view_count;
	int like_count;
	String image_name;
	double image_size;
	String membership_name;
	int membership_price;
	int membership_period;

}
