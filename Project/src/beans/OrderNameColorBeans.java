package beans;

import java.io.Serializable;

public class OrderNameColorBeans implements Serializable{
	private int colorId;
	private String colorType;
	private int colorPrice;




	public int getColorId() {
		return colorId;
	}
	public void setColorId(int colorId) {
		this.colorId = colorId;
	}


	public String getColorType() {
		return colorType;
	}
	public void setColorType(String colorType) {
		this.colorType = colorType;
	}


	public int getColorPrice() {
		return colorPrice;
	}
	public void setColorPrice(int colorPrice) {
		this.colorPrice = colorPrice;
	}
}
