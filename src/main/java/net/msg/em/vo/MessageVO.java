package net.msg.em.vo;

public class MessageVO {

	private String g_no;
	private String g_send_no;
	private String g_content;
	private String g_senddate;
	private String g_check;
	private String g_readdate;
	private String g_delete;
	private String g_regdate;
	private String m_no;
	private String m_id;
	private String m_name;
	public String getG_no() {
		return g_no;
	}
	public void setG_no(String g_no) {
		this.g_no = g_no;
	}
	public String getG_send_no() {
		return g_send_no;
	}
	public void setG_send_no(String g_send_no) {
		this.g_send_no = g_send_no;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public String getG_senddate() {
		return g_senddate;
	}
	public void setG_senddate(String g_senddate) {
		this.g_senddate = g_senddate;
	}
	public String getG_check() {
		return g_check;
	}
	public void setG_check(String g_check) {
		this.g_check = g_check;
	}
	public String getG_readdate() {
		return g_readdate;
	}
	public void setG_readdate(String g_readdate) {
		this.g_readdate = g_readdate;
	}
	public String getG_delete() {
		return g_delete;
	}
	public void setG_delete(String g_delete) {
		this.g_delete = g_delete;
	}
	public String getG_regdate() {
		return g_regdate;
	}
	public void setG_regdate(String g_regdate) {
		this.g_regdate = g_regdate;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
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
	@Override
	public String toString() {
		return "MessageVO [g_no=" + g_no + ", g_send_no=" + g_send_no + ", g_content=" + g_content + ", g_senddate="
				+ g_senddate + ", g_check=" + g_check + ", g_readdate=" + g_readdate + ", g_delete=" + g_delete
				+ ", g_regdate=" + g_regdate + ", m_no=" + m_no + ", m_id=" + m_id + ", m_name=" + m_name + "]";
	}
	
	
}
