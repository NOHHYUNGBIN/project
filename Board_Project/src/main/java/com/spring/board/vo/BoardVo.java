package com.spring.board.vo;

import java.util.Date;

public class BoardVo {
	private int idx;
	private int menu_id;
	private String title;
	private String cont;
	private String userid;
	private String nickname;
	private Date regdate;
	private int readcount;
	private int replycnt;

	public BoardVo() {
		
	}

	public BoardVo(int idx, int menu_id, String title, String cont, String userid, String nickname, Date regdate, int readcount, int replycnt) {
		
		this.idx = idx;
		this.menu_id = menu_id;
		this.title = title;
		this.cont = cont;
		this.userid = userid;
		this.nickname = nickname;
		this.regdate = regdate;
		this.readcount = readcount;
		this.replycnt = replycnt;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	@Override
	public String toString() {
		return "BoardVo [idx=" + idx + ", menu_id=" + menu_id + ", title=" + title + ", cont=" + cont + ", userid="
				+ userid + ", nickname=" + nickname + ", regdate=" + regdate + ", readcount=" + readcount
				+ ", replycnt=" + replycnt + "]";
	}
	
}
