package model;

public class DogKind {
	private String kind;
	private String dogSize;
	private int adultWeight;
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getDogSize() {
		return dogSize;
	}
	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}
	public int getAdultWeight() {
		return adultWeight;
	}
	public void setAdultWeight(int adultWeight) {
		this.adultWeight = adultWeight;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Dog_kind [ kind=" + kind + ", dogSize=" + dogSize +
				", adultWeight=" + adultWeight + "]";
	}
}
