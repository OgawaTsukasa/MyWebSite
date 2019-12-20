

package beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BuyBeans implements Serializable{
	private int buyId;
	private int totalNum;
	private String silhouetteType;
	private String collarType;
	private String cuffsDesignType;
	private String cuffsButtonType;
	private String cuffsWatchType;
	private String nameMessage;
	private String nameSpelling;
	private String namePosition;
	private String buttonThread1;
	private String buttonThread2;
	private Date buyDate;
	//OderSizeBeanseと結合
	private SizeBeanse sizeBeanse;
	//OderRequestBeansと結合
	private OrderRequestBeans requestBeans;
	// OderPocketBeansと結合
	private OrderPocketBeans pocketBeans;
	//OderNameDesingBeansと結合
	private OrderNameDesignBeans nameDesignBeans;
	//OderNameColorBeans
	private OrderNameColorBeans nameColorBeans1;
	//OderNameColorBeans
	private OrderNameColorBeans nameColorBeans2;
	//OderButtonDesingと結合
	private OrderButtonDesignBeans buttonDesignBeans;
	//OderPriceBeansと結合
	private OrderPriceBeans price;
	//PersonalInfoBeansと結合
	private PersonalInfoBeans personalInfo;





	public int getBuyId() {
		return buyId;
	}
	public void setBuyId(int buyId) {
		this.buyId = buyId;
	}


	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}


	public String getSilhouetteType() {
		return silhouetteType;
	}
	public void setSilhouetteType(String silhouetteType) {
		this.silhouetteType = silhouetteType;
	}


	public String getCollarType() {
		return collarType;
	}
	public void setCollarType(String collarType) {
		this.collarType = collarType;
	}


	public String getCuffsDesignType() {
		return cuffsDesignType;
	}
	public void setCuffsDesignType(String cuffsDesignType) {
		this.cuffsDesignType = cuffsDesignType;
	}


	public String getCuffsButtonType() {
		return cuffsButtonType;
	}
	public void setCuffsButtonType(String cuffsButtonType) {
		this.cuffsButtonType = cuffsButtonType;
	}


	public String getCuffsWatchType() {
		return cuffsWatchType;
	}
	public void setCuffsWatchType(String cuffsWatchType) {
		this.cuffsWatchType = cuffsWatchType;
	}


	public String getNameMessage() {
		return nameMessage;
	}
	public void setNameMessage(String nameMessage) {
		this.nameMessage = nameMessage;
	}


	public String getNameSpelling() {
		return nameSpelling;
	}
	public void setNameSpelling(String nameSpelling) {
		this.nameSpelling = nameSpelling;
	}


	public String getNamePosition() {
		return namePosition;
	}
	public void setNamePosition(String namePosition) {
		this.namePosition = namePosition;
	}


	public String getButtonThread1() {
		return buttonThread1;
	}
	public void setButtonThread1(String buttonThread1) {
		this.buttonThread1 = buttonThread1;
	}


	public String getButtonThread2() {
		return buttonThread2;
	}
	public void setButtonThread2(String buttonThread2) {
		this.buttonThread2 = buttonThread2;
	}


	public SizeBeanse getSizeBeanse() {
		return sizeBeanse;
	}
	public void setSizeBeanse(SizeBeanse sizeBeanse) {
		this.sizeBeanse = sizeBeanse;
	}


	public OrderRequestBeans getRequestBeans() {
		return requestBeans;
	}
	public void setRequestBeans(OrderRequestBeans requestBeans) {
		this.requestBeans = requestBeans;
	}


	public OrderPocketBeans getPocketBeans() {
		return pocketBeans;
	}
	public void setPocketBeans(OrderPocketBeans pocketBeans) {
		this.pocketBeans = pocketBeans;
	}


	public OrderNameDesignBeans getNameDesignBeans() {
		return nameDesignBeans;
	}
	public void setNameDesignBeans(OrderNameDesignBeans nameDesignBeans) {
		this.nameDesignBeans = nameDesignBeans;
	}


	public OrderNameColorBeans getNameColorBeans1() {
		return nameColorBeans1;
	}
	public void setNameColorBeans1(OrderNameColorBeans nameColorBeans1) {
		this.nameColorBeans1 = nameColorBeans1;
	}


	public OrderNameColorBeans getNameColorBeans2() {
		return nameColorBeans2;
	}
	public void setNameColorBeans2(OrderNameColorBeans nameColorBeans2) {
		this.nameColorBeans2 = nameColorBeans2;
	}


	public OrderButtonDesignBeans getButtonDesignBeans() {
		return buttonDesignBeans;
	}
	public void setButtonDesignBeans(OrderButtonDesignBeans buttonDesignBeans) {
		this.buttonDesignBeans = buttonDesignBeans;
	}


	public OrderPriceBeans getPrice() {
		return price;
	}
	public void setPrice(OrderPriceBeans price) {
		this.price = price;
	}


	public PersonalInfoBeans getPersonalInfo() {
		return personalInfo;
	}
	public void setPersonalInfo(PersonalInfoBeans personalInfo) {
		this.personalInfo = personalInfo;
	}


	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}


	public String getFormatDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分");
		return sdf.format(buyDate);
	}
}
