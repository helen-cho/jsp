package model;

public class EnrollVO extends CouVO{
	private String scode;
	private int grade;
	private String edata;
	
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getEdata() {
		return edata;
	}
	public void setEdata(String edata) {
		this.edata = edata;
	}
	
	@Override
	public String toString() {
		return "EnrollVO [scode=" + scode + ", grade=" + grade + ", edata=" + edata + ", getLcode()=" + getLcode()
				+ ", getLname()=" + getLname() + ", getHours()=" + getHours() + ", getRoom()=" + getRoom()
				+ ", getCapacity()=" + getCapacity() + ", getPersons()=" + getPersons() + ", getPcode()=" + getPcode()
				+ ", getPname()=" + getPname() + "]";
	}
}
