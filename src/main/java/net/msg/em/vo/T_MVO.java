package net.msg.em.vo;

import java.io.Serializable;

public class T_MVO implements Serializable{

	private long t_no;
	private long mat_no;
	
	public long getT_no() {
		return t_no;
	}
	public void setT_no(long t_no) {
		this.t_no = t_no;
	}
	public long getMat_no() {
		return mat_no;
	}
	public void setMat_no(long mat_no) {
		this.mat_no = mat_no;
	}
	@Override
	public String toString() {
		return "T_MVO [t_no=" + t_no + ", mat_no=" + mat_no + "]";
	}
}
