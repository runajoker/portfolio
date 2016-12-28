package net.msg.em.vo;

import java.io.Serializable;

public class TeamVO implements Serializable{

	private long t_no;
	private String t_name;
	private String t_captain;
	private String t_place;
	private String t_intro;
	private int t_record_win;
	private int t_record_draw;
	private int t_record_lose;
	private long t_captain_no;
	
	private MemberVO memberVO;

	public long getT_no() {
		return t_no;
	}

	public void setT_no(long t_no) {
		this.t_no = t_no;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getT_captain() {
		return t_captain;
	}

	public void setT_captain(String t_captain) {
		this.t_captain = t_captain;
	}

	public String getT_place() {
		return t_place;
	}

	public void setT_place(String t_place) {
		this.t_place = t_place;
	}

	public String getT_intro() {
		return t_intro;
	}

	public void setT_intro(String t_intro) {
		this.t_intro = t_intro;
	}

	public int getT_record_win() {
		return t_record_win;
	}

	public void setT_record_win(int t_record_win) {
		this.t_record_win = t_record_win;
	}

	public int getT_record_draw() {
		return t_record_draw;
	}

	public void setT_record_draw(int t_record_draw) {
		this.t_record_draw = t_record_draw;
	}

	public int getT_record_lose() {
		return t_record_lose;
	}

	public void setT_record_lose(int t_record_lose) {
		this.t_record_lose = t_record_lose;
	}

	public long getT_captain_no() {
		return t_captain_no;
	}

	public void setT_captain_no(long t_captain_no) {
		this.t_captain_no = t_captain_no;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "TeamVO [t_no=" + t_no + ", t_name=" + t_name + ", t_captain=" + t_captain + ", t_place=" + t_place
				+ ", t_intro=" + t_intro + ", t_record_win=" + t_record_win + ", t_record_draw=" + t_record_draw
				+ ", t_record_lose=" + t_record_lose + ", t_captain_no=" + t_captain_no + ", memberVO=" + memberVO
				+ "]";
	}
}
