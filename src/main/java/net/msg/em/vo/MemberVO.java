package net.msg.em.vo;

import java.io.Serializable;

public class MemberVO implements Serializable{

	private long m_no;
	private String m_pw;
	private String m_id;
	private String m_name;
	private int m_admin;//DEFAULT 1
	private String m_phone;
	private String m_position;
	private int m_score; //DEFAULT 0
	private long t_no; //DEFAULT 1
	
	private TeamVO teamVO;

	public long getM_no() {
		return m_no;
	}

	public void setM_no(long m_no) {
		this.m_no = m_no;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
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

	public int getM_admin() {
		return m_admin;
	}

	public void setM_admin(int m_admin) {
		this.m_admin = m_admin;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_position() {
		return m_position;
	}

	public void setM_position(String m_position) {
		this.m_position = m_position;
	}

	public int getM_score() {
		return m_score;
	}

	public void setM_score(int m_score) {
		this.m_score = m_score;
	}

	public long getT_no() {
		return t_no;
	}

	public void setT_no(long t_no) {
		this.t_no = t_no;
	}

	public TeamVO getTeamVO() {
		return teamVO;
	}

	public void setTeamVO(TeamVO teamVO) {
		this.teamVO = teamVO;
	}

	@Override
	public String toString() {
		return "MemberVO [m_no=" + m_no + ", m_pw=" + m_pw + ", m_id=" + m_id + ", m_name=" + m_name + ", m_admin="
				+ m_admin + ", m_phone=" + m_phone + ", m_position=" + m_position + ", m_score=" + m_score + ", t_no="
				+ t_no + ", teamVO=" + teamVO + "]";
	}
	
}
