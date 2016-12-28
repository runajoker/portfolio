package net.msg.em.vo;

import java.io.Serializable;

public class BoardVO implements Serializable{

	private int b_no;
	private String b_name;
	private int status;
	private long m_no;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public long getM_no() {
		return m_no;
	}
	public void setM_no(long m_no) {
		this.m_no = m_no;
	}
	@Override
	public String toString() {
		return "BoardVO [b_no=" + b_no + ", b_name=" + b_name + ", status=" + status + ", m_no=" + m_no + "]";
	}
	
}
