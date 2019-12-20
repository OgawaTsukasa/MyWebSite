package beans;

import java.io.Serializable;

public class OrderNameDesignBeans implements Serializable{
	private int designId;
	private String designType;
	private int designPrice;
	private String designFile;





	public int getDesignId() {
		return designId;
	}
	public void setDesignId(int designId) {
		this.designId = designId;
	}


	public String getDesignType() {
		return designType;
	}
	public void setDesignType(String designType) {
		this.designType = designType;
	}


	public int getDesignPrice() {
		return designPrice;
	}
	public void setDesignPrice(int designPrice) {
		this.designPrice = designPrice;
	}


	public String getDesignFile() {
		return designFile;
	}
	public void setDesignFile(String designFile) {
		this.designFile = designFile;
	}






}