package com.to.review;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReviewTO {
	
	int seq;
	String title;
	String content;
	String write_date;
	int writer_seq;
	float star_score;
	float avg_star_score;
	int status;
	int board_seq;
	

}
