package net.msg.em.vo;

import java.io.Serializable;

public class ArticleVO implements Serializable {

	private long art_no;
	private String art_title;
	private String art_content;
	private String art_regdate;
	private long art_readcount;
	private long art_com_cnt;
	private long m_no;
	private int b_no;
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
	public long getArt_no() {
		return art_no;
	}
	public void setArt_no(long art_no) {
		this.art_no = art_no;
	}
	public String getArt_title() {
		return art_title;
	}
	public void setArt_title(String art_title) {
		this.art_title = art_title;
	}
	public String getArt_content() {
		return art_content;
	}
	public void setArt_content(String art_content) {
		this.art_content = art_content;
	}
	public String getArt_regdate() {
		return art_regdate;
	}
	public void setArt_regate(String art_regate) {
		this.art_regdate = art_regdate;
	}
	public long getArt_readcount() {
		return art_readcount;
	}
	public void setArt_readcount(long art_readcount) {
		this.art_readcount = art_readcount;
	}
	public long getArt_com_cnt() {
		return art_com_cnt;
	}
	public void setArt_com_cnt(long art_com_cnt) {
		this.art_com_cnt = art_com_cnt;
	}
	public long getM_no() {
		return m_no;
	}
	public void setM_no(long m_no) {
		this.m_no = m_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	@Override
	public String toString() {
		return "ArticleVO [art_no=" + art_no + ", art_title=" + art_title + ", art_content=" + art_content
				+ ", art_regdate=" + art_regdate + ", art_readcount=" + art_readcount + ", art_com_cnt=" + art_com_cnt
				+ ", m_no=" + m_no + ", b_no=" + b_no + ", m_id=" + m_id + ", m_name=" + m_name + "]";
	}
}
