package com.spring.board.vo;

import java.util.Date;

public class ReplyVo {
	private int idx;
	private int rno;
	private String userid;
	private String nickname;
	private String cont;
	private int bnum;
	private int lvl;
	private int step;
	private int nref;
	private int delnum;
	private Date regdate;
	
	public ReplyVo() {
		
	}

	public ReplyVo(int idx, int rno, String userid, String nickname, String cont, int bnum, int lvl, int step, int nref, int delnum, Date regdate) {
		
		this.idx = idx;
		this.rno = rno;
		this.userid = userid;
		this.nickname = nickname;
		this.cont = cont;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.delnum = delnum;
		this.regdate = regdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getNref() {
		return nref;
	}

	public void setNref(int nref) {
		this.nref = nref;
	}

	public int getDelnum() {
		return delnum;
	}

	public void setDelnum(int delnum) {
		this.delnum = delnum;
	}
	
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyVo [idx=" + idx + ", rno=" + rno + ", userid=" + userid + ", nickname=" + nickname + ", cont="
				+ cont + ", bnum=" + bnum + ", lvl=" + lvl + ", step=" + step + ", nref=" + nref + ", delnum=" + delnum
				+ ", regdate=" + regdate + "]";
	}

}
