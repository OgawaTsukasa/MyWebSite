package beans;

import java.io.Serializable;

public class OrderPriceBeans implements Serializable{
	private int optionPrice;
	private int subtotal;
	private int total;




	public int getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}


	public int getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}


	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}