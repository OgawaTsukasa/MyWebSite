package beans;

import java.io.Serializable;

public class OrderRequestBeans implements Serializable{
	private String collarRequest;
	private String cuffsRequest;
	private String pocketRequest;
	private String otherRequest;



	public String getCollarRequest() {
		return collarRequest;
	}
	public void setCollarRequest(String collarRequest) {
		this.collarRequest = collarRequest;
	}


	public String getCuffsRequest() {
		return cuffsRequest;
	}
	public void setCuffsRequest(String cuffsRequest) {
		this.cuffsRequest = cuffsRequest;
	}


	public String getPocketRequest() {
		return pocketRequest;
	}
	public void setPocketRequest(String pocketRequest) {
		this.pocketRequest = pocketRequest;
	}


	public String getOtherRequest() {
		return otherRequest;
	}
	public void setOtherRequest(String otherRequest) {
		this.otherRequest = otherRequest;
	}



}
