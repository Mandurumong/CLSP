package com.project.clsp.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data

@Setter
@Getter
public class BoardReplyDto {
	
	private String replyuserId;
	private String replycontent;
	private String replydate;
	private int fb_num;
	private int replynum;
	private int replyparentnum;
	public String getReplyuserId() {
		return replyuserId;
	}
}
