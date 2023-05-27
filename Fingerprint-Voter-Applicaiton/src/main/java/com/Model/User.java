package com.Model;

public class User {
	
	private String voter_card_number;
	private String name;
	private String gender;
	private String dob;
	private String email;
	private String address;
	private String password;
	
	public User() {
		
	}
	public User(String voter_card_number, String name, String gender, String dob, String email, String address, String password) {
		this.voter_card_number = voter_card_number;
		this.name = name;
		this.gender = gender;
		this.dob = dob;
		this.email = email;
		this.address = address;
		this.password = password;
	}
	
	public String getVoter_card_number() {
		return voter_card_number;
	}
	public void setVoter_card_number(String voter_card_number) {
		this.voter_card_number = voter_card_number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "User [voter_card_number=" + voter_card_number + ", name=" + name + ", gender=" + gender + ", dob=" + dob
				+ ", email=" + email + ", address=" + address + ", password=" + password + "]";
	}
	
		

}
