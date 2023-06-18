package com.Model;

public class User {

	private String voter_card_number;
	private String firstName;
	private String middleName;
	private String lastName;
	private String gender;
	private String aadhar;
	private String dob;
	private String email;
	private String address;
	private String password;

	public User() {

	}

	public User(String voter_card_number, String firstName, String middleName, String lastName, String gender, String aadhar,
			String dob, String email, String address, String password) {
		super();
		this.voter_card_number = voter_card_number;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.gender = gender;
		this.aadhar = aadhar;
		this.dob = dob;
		this.email = email;
		this.address = address;
		this.password = password;
	}

	
	public String getAadhar() {
		return aadhar;
	}

	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}

	public String getVoter_card_number() {
		return voter_card_number;
	}

	public void setVoter_card_number(String voter_card_number) {
		this.voter_card_number = voter_card_number;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

}
