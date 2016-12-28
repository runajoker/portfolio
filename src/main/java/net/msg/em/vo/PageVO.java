package net.msg.em.vo;

import java.io.Serializable;

public class PageVO implements Serializable {
	
	private int b_no;
	private long startnum;
	private long endnum;
	
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public long getStartnum() {
		return startnum;
	}
	public void setStartnum(long startnum) {
		this.startnum = startnum;
	}
	public long getEndnum() {
		return endnum;
	}
	public void setEndnum(long endnum) {
		this.endnum = endnum;
	}
	@Override
	public String toString() {
		return "PageVO [b_no=" + b_no + ", startnum=" + startnum + ", endnum=" + endnum + "]";
	}
	

}
