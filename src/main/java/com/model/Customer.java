package com.model;

public class Customer {
	
	String Name;
	String Email;
	long Mobile;
	String DOB;
	String Address;
	String AccountStatus;
	long AccountNo;
	int pin;
	long Balance;
	String AccountType;
	String proof;
	
	
	
	public Customer(String name, String email, long mobile, String dOB, String address, String accountStatus,
			long accountNo, int pin, long balance, String accountType, String proof) {
		super();
		this.Name = name;
		this.Email = email;
		this.Mobile = mobile;
		this.DOB = dOB;
		this.Address = address;
		this.AccountStatus = accountStatus;
		this.AccountNo = accountNo;
		this.pin = pin;
		this.Balance = balance;
		this.AccountType = accountType;
		this.proof = proof;
	}
	
	public Customer() {}
	
	
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public long getMobile() {
		return Mobile;
	}
	public void setMobile(long mobile) {
		Mobile = mobile;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getAccountStatus() {
		return AccountStatus;
	}
	public void setAccountStatus(String accountStatus) {
		AccountStatus = accountStatus;
	}
	public long getAccountNo() {
		return AccountNo;
	}
	public void setAccountNo(long accountNo) {
		AccountNo = accountNo;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	public long getBalance() {
		return Balance;
	}
	public void setBalance(long balance) {
		Balance = balance;
	}
	public String getAccountType() {
		return AccountType;
	}
	public void setAccountType(String accountType) {
		AccountType = accountType;
	}
	public String getProof() {
		return proof;
	}
	public void setProof(String proof) {
		this.proof = proof;
	}
	
	
	

}
