package com.yxq.action;

import java.util.List;

import com.yxq.actionform.VoteForm;

public class VoteAction {

	int totalSelNum;
	List<VoteForm> votes;
	
	public VoteAction() {
	}

	public int getTotalSelNum() {
		return totalSelNum;
	}

	public void setTotalSelNum(int totalSelNum) {
		this.totalSelNum = totalSelNum;
	}

	public List<VoteForm> getVotes() {
		return votes;
	}

	public void setVotes(List<VoteForm> votes) {
		this.votes = votes;
	}
	
}
