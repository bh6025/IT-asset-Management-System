package Dto;

import java.util.Date;

public class AssetDto {
	private String code;
	private String category;
	private Date regiDatetime;
	private String assetName;
	private String productName;
	private String regiUser;
	private String regiState;
	private String location;
	
	public AssetDto(String code, String category, Date regiDatetime, String assetName, String productName,
			String regiUser, String regiState, String location) {
		super();
		this.code = code;
		this.category = category;
		this.regiDatetime = regiDatetime;
		this.assetName = assetName;
		this.productName = productName;
		this.regiUser = regiUser;
		this.regiState = regiState;
		this.location = location;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getRegiDatetime() {
		return regiDatetime;
	}

	public void setRegiDatetime(Date regiDatetime) {
		this.regiDatetime = regiDatetime;
	}

	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getRegiUser() {
		return regiUser;
	}

	public void setRegiUser(String regiUser) {
		this.regiUser = regiUser;
	}

	public String getRegiState() {
		return regiState;
	}

	public void setRegiState(String regiState) {
		this.regiState = regiState;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
