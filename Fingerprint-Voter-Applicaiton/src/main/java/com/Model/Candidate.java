package com.Model;

public class Candidate {
	private int candidateId;
	private String candidateName;
	private String candidateAddress;
	private String candidatePhoto;
	private int voteCount;
	
	public Candidate(int candidateId, String candidateName, String candidateAddress, String candidatePhoto) {
		this.candidateId = candidateId;
		this.candidateName = candidateName;
		this.candidateAddress = candidateAddress;
		this.candidatePhoto = candidatePhoto;
	}


	public Candidate(int candidateId, String candidateName, String candidateAddress) {
	
		this.candidateId = candidateId;
		this.candidateName = candidateName;
		this.candidateAddress = candidateAddress;
	}


	public Candidate(int candidateId, String candidateName, String candidatePhoto, int voteCount) {
		this.candidateId = candidateId;
		this.candidateName = candidateName;
		this.candidatePhoto = candidatePhoto;
		this.voteCount = voteCount;
	}


	public int getCandidateId() {
		return candidateId;
	}
	public void setCandidateId(int candidateId) {
		this.candidateId = candidateId;
	}
	public String getCandidateName() {
		return candidateName;
	}
	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}
	public String getCandidateAddress() {
		return candidateAddress;
	}
	public void setCandidateAddress(String candidateAddress) {
		this.candidateAddress = candidateAddress;
	}
	public String getCandidatePhoto() {
		return candidatePhoto;
	}
	public void setCandidatePhoto(String candidatePhoto) {
		this.candidatePhoto = candidatePhoto;
	}
	public int getVoteCount() {
		return voteCount;
	}
	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}
	
	
}
