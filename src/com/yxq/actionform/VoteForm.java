package com.yxq.actionform;

public class VoteForm {

	String content;
	int voteNum;

	public VoteForm(String voteStr) {
		this.content = voteStr.substring(0, voteStr.indexOf(","));
		this.voteNum = Integer.parseInt(voteStr.substring(voteStr.indexOf(",") + 1, voteStr.length()));
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getVoteNum() {
		return voteNum;
	}

	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}

	
}
