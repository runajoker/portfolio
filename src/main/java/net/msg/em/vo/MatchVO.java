package net.msg.em.vo;

import java.io.Serializable;

public class MatchVO implements Serializable{

	private long mat_no;
	private String mat_time;
	private String mat_place;
	private long mat_home;
	private long mat_away;
	private String mat_memo;
	private int mat_play_time;
	private String mat_home_name;
	private String mat_away_name;
	
	private TeamVO team_homeVO;
	private TeamVO team_awayVO;
	
	private String mat_time_date;
	private String mat_time_time_start;
	private String mat_time_time_end;
	
	private int cnt;
	
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getMat_home_name() {
		return mat_home_name;
	}
	public void setMat_home_name(String mat_home_name) {
		this.mat_home_name = mat_home_name;
	}
	public String getMat_away_name() {
		return mat_away_name;
	}
	public void setMat_away_name(String mat_away_name) {
		this.mat_away_name = mat_away_name;
	}
	public int getMat_play_time() {
		return mat_play_time;
	}
	public void setMat_play_time(int mat_play_time) {
		this.mat_play_time = mat_play_time;
	}
	public long getMat_no() {
		return mat_no;
	}
	public void setMat_no(long mat_no) {
		this.mat_no = mat_no;
	}
	public String getMat_time() {
		return mat_time;
	}
	public void setMat_time(String mat_time) {
		this.mat_time = mat_time;
	}
	public String getMat_place() {
		return mat_place;
	}
	public void setMat_place(String mat_place) {
		this.mat_place = mat_place;
	}
	public long getMat_home() {
		return mat_home;
	}
	public void setMat_home(long mat_home) {
		this.mat_home = mat_home;
	}
	public long getMat_away() {
		return mat_away;
	}
	public void setMat_away(long mat_away) {
		this.mat_away = mat_away;
	}
	public String getMat_memo() {
		return mat_memo;
	}
	public void setMat_memo(String mat_memo) {
		this.mat_memo = mat_memo;
	}
	public TeamVO getTeam_homeVO() {
		return team_homeVO;
	}
	public void setTeam_homeVO(TeamVO team_homeVO) {
		this.team_homeVO = team_homeVO;
	}
	public TeamVO getTeam_awayVO() {
		return team_awayVO;
	}
	public void setTeam_awayVO(TeamVO team_awayVO) {
		this.team_awayVO = team_awayVO;
	}
	
	public String getMat_time_date() {
		return mat_time_date;
	}
	public void setMat_time_date(String mat_time_date) {
		this.mat_time_date = mat_time_date;
	}
	public String getMat_time_time_start() {
		return mat_time_time_start;
	}
	public void setMat_time_time_start(String mat_time_time_start) {
		this.mat_time_time_start = mat_time_time_start;
	}
	public String getMat_time_time_end() {
		return mat_time_time_end;
	}
	public void setMat_time_time_end(String mat_time_time_end) {
		this.mat_time_time_end = mat_time_time_end;
	}
	@Override
	public String toString() {
		return "MatchVO [mat_no=" + mat_no + ", mat_time=" + mat_time + ", mat_place=" + mat_place + ", mat_home="
				+ mat_home + ", mat_away=" + mat_away + ", mat_memo=" + mat_memo + ", mat_play_time=" + mat_play_time
				+ ", mat_home_name=" + mat_home_name + ", mat_away_name=" + mat_away_name + ", team_homeVO="
				+ team_homeVO + ", team_awayVO=" + team_awayVO + ", mat_time_date=" + mat_time_date
				+ ", mat_time_time_start=" + mat_time_time_start + ", mat_time_time_end=" + mat_time_time_end + ", cnt="
				+ cnt + "]";
	}
	
}
