package Dto;

import java.util.Date;

public class LogDto {
	private String code;
	private Date modiDatetime;
	private String modiState;
	private String modiUser;
	private String modiLocation;
	
	public LogDto(String code, Date modiDatetime, String modiState, String modiUser, String modiLocation) {
		super();
		this.code = code;
		this.modiDatetime = modiDatetime;
		this.modiState = modiState;
		this.modiUser = modiUser;
		this.modiLocation = modiLocation;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getModiDatetime() {
		return modiDatetime;
	}
	public void setModiDatetime(Date modiDatetime) {
		this.modiDatetime = modiDatetime;
	}
	public String getModiState() {
		return modiState;
	}
	public void setModiState(String modiState) {
		this.modiState = modiState;
	}
	public String getModiUser() {
		return modiUser;
	}
	public void setModiUser(String modiUser) {
		this.modiUser = modiUser;
	}
	public String getModiLocation() {
		return modiLocation;
	}
	public void setModiLocation(String modiLocation) {
		this.modiLocation = modiLocation;
	}

}
