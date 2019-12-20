package beans;

import java.io.Serializable;

public class OrderPocketBeans implements Serializable{
	private int poketId;
	private String pocketType;
	private int poketPrice;




	public int getPoketId() {
		return poketId;
	}
	public void setPoketId(int poketId) {
		this.poketId = poketId;
	}


	public String getPocketType() {
		return pocketType;
	}
	public void setPocketType(String pocketType) {
		this.pocketType = pocketType;
	}


	public int getPoketPrice() {
		return poketPrice;
	}
	public void setPoketPrice(int poketPrice) {
		this.poketPrice = poketPrice;
	}
}


