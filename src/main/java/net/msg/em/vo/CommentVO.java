package net.msg.em.vo;

import java.io.IOException;
import java.io.Serializable;
import java.io.Writer;
import java.util.LinkedHashMap;

public class CommentVO implements Serializable{
	
	private long com_no;
	private String com_comment;
	private String com_regdate; 
	private long m_no;
	private long art_no;
	private String m_id;
	private String m_name;
	
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public long getCom_no() {
		return com_no;
	}
	public void setCom_no(long com_no) {
		this.com_no = com_no;
	}
	public String getCom_comment() {
		return com_comment;
	}
	public void setCom_comment(String com_comment) {
		this.com_comment = com_comment;
	}
	public String getCom_regdate() {
		return com_regdate;
	}
	public void setCom_regdate(String com_regdate) {
		this.com_regdate = com_regdate;
	}
	public long getM_no() {
		return m_no;
	}
	public void setM_no(long m_no) {
		this.m_no = m_no;
	}
	public long getArt_no() {
		return art_no;
	}
	public void setArt_no(long art_no) {
		this.art_no = art_no;
	}
	@Override
	public String toString() {
		return "CommentVO [com_no=" + com_no + ", com_comment=" + com_comment + ", com_regdate=" + com_regdate
				+ ", m_no=" + m_no + ", art_no=" + art_no + ", m_id=" + m_id + ", m_name=" + m_name + "]";
	} 		
	
}
