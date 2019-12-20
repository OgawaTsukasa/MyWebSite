package beans;

import java.io.Serializable;

public class ItemDataBeans implements Serializable{
	private int id;
	private int brandId;
	private String material;
	private int price;
	private String color;
	private String remark;
	private int depth;
	private String cloth;
	private String detail;
	private String fileName1;
	private String fileName2;
	// brandDataBeansと結合
	private BrandDataBeans brandDataBeans;




	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}


	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}


	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}


	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}


	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}


	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}


	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}


	public String getCloth() {
		return cloth;
	}
	public void setCloth(String cloth) {
		this.cloth = cloth;
	}


	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}


	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}


	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}


	public BrandDataBeans getBrandDataBeans() {
		return brandDataBeans;
	}
	public void setBrandDataBeans(BrandDataBeans brandDataBeans) {
		this.brandDataBeans = brandDataBeans;
	}

}
