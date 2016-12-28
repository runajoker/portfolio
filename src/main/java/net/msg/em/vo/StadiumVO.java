package net.msg.em.vo;

import java.io.Serializable;

public class StadiumVO implements Serializable{
	
	private String SIGUN_NM;
	private String FACLT_NM;//구장 이름
	private String BOTM_MATRL_NM;//구장 성질
	private String REFINE_LOTNO_ADDR;//구장 장소
	
	public String getSIGUN_NM() {
		return SIGUN_NM;
	}
	public void setSIGUN_NM(String sIGUN_NM) {
		SIGUN_NM = sIGUN_NM;
	}
	public String getFACLT_NM() {
		return FACLT_NM;
	}
	public void setFACLT_NM(String fACLT_NM) {
		FACLT_NM = fACLT_NM;
	}
	public String getBOTM_MATRL_NM() {
		return BOTM_MATRL_NM;
	}
	public void setBOTM_MATRL_NM(String bOTM_MATRL_NM) {
		BOTM_MATRL_NM = bOTM_MATRL_NM;
	}
	public String getREFINE_LOTNO_ADDR() {
		return REFINE_LOTNO_ADDR;
	}
	public void setREFINE_LOTNO_ADDR(String rEFINE_LOTNO_ADDR) {
		REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR;
	}
	@Override
	public String toString() {
		return "StadiumVO [SIGUN_NM=" + SIGUN_NM + ", FACLT_NM=" + FACLT_NM + ", BOTM_MATRL_NM=" + BOTM_MATRL_NM
				+ ", REFINE_LOTNO_ADDR=" + REFINE_LOTNO_ADDR + "]";
	}
	
}
