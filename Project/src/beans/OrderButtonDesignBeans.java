package beans;

import java.io.Serializable;

public class OrderButtonDesignBeans implements Serializable{
	private int buttonId;
	private String buttonTyupe;
	private int buttonPrice;




	public int getButtonId() {
		return buttonId;
	}
	public void setButtonId(int buttonId) {
		this.buttonId = buttonId;
	}

	public String getButtonTyupe() {
		return buttonTyupe;
	}
	public void setButtonTyupe(String buttonTyupe) {
		this.buttonTyupe = buttonTyupe;
	}


	public int getButtonPrice() {
		return buttonPrice;
	}
	public void setButtonPrice(int buttonPrice) {
		this.buttonPrice = buttonPrice;
	}
}
