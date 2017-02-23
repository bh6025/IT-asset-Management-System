package Dto;

public class UserDto {
	private String id;
	private String pw;
	private int grade;
	private String name;
	
	public UserDto(String id, String pw, int grade, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.grade = grade;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
