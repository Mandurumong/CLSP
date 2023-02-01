package com.project.clsp.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data

@Setter
@Getter
public class FreeBoardDto {
	private int fbNum;
	private String fbTitle;
	private String fbContent;
	private String fbCategory;
	private String fbUserId;
	private int fbCount;
	private String fbDate;
	private int fbGroup;
	private int fbStep;
	private int fbIndent;
}
