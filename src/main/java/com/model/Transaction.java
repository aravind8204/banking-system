package com.model;

public class Transaction {

	private String Description;
	private int Debit;
	private int Credit;
	private long Balance;
	private int id;
	private String date;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Transaction() {}
	
	
	
	public Transaction( int id, String date,String description, int debit, int credit, long balance) {
		super();
		this.Description = description;
		this.Debit = debit;
		this.Credit = credit;
		this.Balance = balance;
		this.id = id;
		this.date = date;
	}

	public Transaction(String description, int debit, int credit, long balance) {
		super();
		this.Description = description;
		this.Debit = debit;
		this.Credit = credit;
		this.Balance = balance;
	}
	
	public Transaction(String description, int debit, int credit) {
		super();
		this.Description = description;
		this.Debit = debit;
		this.Credit = credit;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getDebit() {
		return Debit;
	}
	public void setDebit(int debit) {
		Debit = debit;
	}
	public int getCredit() {
		return Credit;
	}
	public void setCredit(int credit) {
		Credit = credit;
	}
	public long getBalance() {
		return Balance;
	}
	public void setBalance(long balance) {
		Balance = balance;
	}
	
	
	
	
}
