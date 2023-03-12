package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

//	IDX                  NUMBER        
//	CATEGORY    NOT NULL VARCHAR2(100) 
//	PRODUCTNAME NOT NULL VARCHAR2(100) 
//	PRICE                NUMBER        
//	SCORE                NUMBER(2,1)   
//	THUMBNAIL   NOT NULL VARCHAR2(255) 
//	REVIEWIMAGE NOT NULL VARCHAR2(255) 
//	REGISTDATE           DATE      

public class HomeplusDTO {

	private int idx;
	private String category;
	private String productName;
	private int price;
	private Double score;
	private String thumbNail;
	private MultipartFile thumbNailFile;
	private String reviewImage;
	private MultipartFile reviewFile;
	private Date registDate;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getThumbNail() {
		return thumbNail;
	}
	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}
	public String getReviewImage() {
		return reviewImage;
	}
	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public MultipartFile getThumbNailFile() {
		return thumbNailFile;
	}
	public void setThumbNailFile(MultipartFile thumbNailFile) {
		this.thumbNailFile = thumbNailFile;
	}
	public MultipartFile getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(MultipartFile reviewFile) {
		this.reviewFile = reviewFile;
	}
	
	
	
}
