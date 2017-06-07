package model;

import java.util.Date;

public class MedicalManagement {

	private int petIdx;
	private int vaccineCode;
	private String vaccineType;
	private int degree;
	private Date realShotDate;
	public int getPetIdx() {
		return petIdx;
	}
	public void setPetIdx(int petIdx) {
		this.petIdx = petIdx;
	}
	public int getVaccineCode() {
		return vaccineCode;
	}
	public void setVaccineCode(int vaccineCode) {
		this.vaccineCode = vaccineCode;
	}
	public String getVaccineType() {
		return vaccineType;
	}
	public void setVaccineType(String vaccineType) {
		this.vaccineType = vaccineType;
	}
	public int getDegree() {
		return degree;
	}
	public void setDegree(int degree) {
		this.degree = degree;
	}
	public Date getRealShotDate() {
		return realShotDate;
	}
	public void setRealShotDate(Date realShotDate) {
		this.realShotDate = realShotDate;
	}
	@Override
	public String toString() {
		return "MedicalManagement [petIdx=" + petIdx + ", vaccineCode=" + vaccineCode + ", vaccineType=" + vaccineType
				+ ", degree=" + degree + ", realShotDate=" + realShotDate + "]";
	}
	
	
}
