package poet.ex01;

import java.sql.Date;

public class ReviewVO {
	private String id;
	private String review;
	private Date writeDate;
	private String poetTitle;
	public String getPoetTitle() {
		return poetTitle;
	}
	public void setPoetTitle(String poetTitle) {
		this.poetTitle = poetTitle;
	}
	public ReviewVO() {
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
