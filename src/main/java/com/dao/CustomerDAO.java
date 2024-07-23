package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.Customer;
import com.model.Transaction;

public class CustomerDAO {
	
	public boolean registerCustomer(Customer cus) throws ClassNotFoundException, SQLException {
		
		
		try {
		Connection con=Database.getConnection();
		PreparedStatement ps=con.prepareStatement("insert into users values(NULL,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,cus.getName());
		ps.setString(2, cus.getEmail());
		ps.setLong(3,cus.getMobile());
		ps.setString(4, cus.getDOB());
		ps.setString(5, cus.getAddress());
		ps.setString(6, cus.getAccountStatus());
		ps.setLong(7, cus.getAccountNo());
		ps.setInt(8, cus.getPin());
		ps.setLong(9, cus.getBalance());
		ps.setString(10, cus.getAccountType());
		ps.setString(11, cus.getProof());
		
		String na="Acc_"+Long.toString(cus.getAccountNo());
		String query2="create table if not exists "+na+"(`id` INT NOT NULL AUTO_INCREMENT,\r\n"
				+"`date` DATETIME NOT NULL,\r\n"
				+ " `desc` VARCHAR(40) NOT NULL,\r\n"
				+ " `debit` INT(10),\r\n"
				+ "	`credit` INT(10),\r\n"
				+ "	`balance` INT(20),\r\n"
				+ "	PRIMARY KEY (`id`)\r\n"
				+ ")";
		PreparedStatement ps1=con.prepareStatement(query2);
		ps1.executeUpdate();
		ps1.close();
		
		PreparedStatement data=con.prepareStatement("select balance from "+na+" ORDER BY id DESC LIMIT 1");	
		ResultSet set=data.executeQuery();
		long bal=0L;
		if(set.next()) {
			bal=set.getLong(1);
		}
		
		String  query3="insert into "+na+" values(NULL,now(),?,?,?,?)";
		
		PreparedStatement p=con.prepareStatement(query3);
		p.setString(1,"Initial deposit");
		p.setLong(2, 0);
		p.setLong(3, cus.getBalance());
		p.setLong(4, bal+cus.getBalance());
		p.executeUpdate();
		p.close();
		data.close();
		
		ps.executeUpdate();
		ps.close();
		
		return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public List<Customer> getAllCustomers(){
		List<Customer> customers=new ArrayList<>();
		try {
			Connection con=Database.getConnection();
			PreparedStatement ps=con.prepareStatement("select name,email,mobile,dob,addr,accountstatus,accno,acctype,proof from users");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Customer c=new Customer();
				c.setName(rs.getString(1));
				c.setEmail(rs.getString(2));
				c.setMobile(rs.getLong(3));
				c.setDOB(rs.getString(4));
				c.setAddress(rs.getString(5));
				c.setAccountStatus(rs.getString(6));
				c.setAccountNo(rs.getLong(7));
				c.setAccountType(rs.getString(8));
				c.setProof(rs.getString(9));
				customers.add(c);
			}
			rs.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return customers;
	}
	
	public boolean validate(long accountno,int pass) throws SQLException, ClassNotFoundException {
		
		Connection con=Database.getConnection();
		PreparedStatement ps=con.prepareStatement("select pin,accountstatus from users where accno=?");
		ps.setLong(1, accountno);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			if(rs.getInt(1)==pass && !rs.getString(2).equals("closed")) {
				return true;
			}
		}
		return false;
	}
	
	public List<Customer> searchCustomer(long accountno){
		List<Customer> data=new ArrayList<>();
		try {
			Connection con=Database.getConnection();
			PreparedStatement ps=con.prepareStatement("select name,email,mobile,dob,addr,accno,acctype,proof,bal from users where accno=?");
			ps.setLong(1, accountno);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Customer c=new Customer();
				c.setName(rs.getString(1));
				c.setEmail(rs.getString(2));
				c.setMobile(rs.getLong(3));
				c.setDOB(rs.getString(4));
				c.setAddress(rs.getString(5));
				c.setAccountNo(rs.getLong(6));
				c.setAccountType(rs.getString(7));
				c.setProof(rs.getString(8));
				c.setBalance(rs.getLong(9));
				data.add(c);
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return data;
		
	}
	
	public boolean update(Customer c) {
		
		try {
			
		Connection con=Database.getConnection();
		PreparedStatement st=con.prepareStatement("update users set name=? ,email=? ,mobile=? ,dob=? ,addr=? ,acctype=? ,proof=?   where accno=?");
		
		
		st.setString(1, c.getName());
		st.setString(2, c.getEmail());
		st.setLong(3,c.getMobile());
		st.setString(4, c.getDOB());
		st.setString(5, c.getAddress());
		st.setString(6, c.getAccountType());
		st.setString(7, c.getProof());
		st.setLong(8, c.getAccountNo());
		
		st.executeUpdate();
		st.close();
		con.close();
		return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public boolean Updatestatus(Customer c) {
		try {
			Connection con=Database.getConnection();
			PreparedStatement ps=con.prepareStatement("update users set accountstatus = ? where accno=?");
			
			ps.setString(1, c.getAccountStatus());
			ps.setLong(2, c.getAccountNo());
			
			ps.executeUpdate();
			ps.close();
			con.close();
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public long getBalance(long accno){
		
		long bal=0L;
		try {
		Connection con=Database.getConnection();
		PreparedStatement ps=con.prepareStatement("select bal from users where accno=?");
		ps.setLong(1, accno);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			bal=rs.getLong(1);
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bal;
	}
	
	public String withdraw(long accno,Transaction t) {
		
			
		String tname="Acc_"+Long.toString(accno);
		int debit=t.getDebit();
		String query1="select balance from "+tname+" ORDER BY id DESC LIMIT 1";
		String query2="update users set bal=? where accno=?";
		try {
		Connection con=Database.getConnection();
		PreparedStatement ps1,ps2,ps3;
		ps1=con.prepareStatement(query1);
		ResultSet rs1=ps1.executeQuery();
		long prevBalance=0L;
		while(rs1.next()) {
			prevBalance=rs1.getLong(1);
		}
		if(debit>prevBalance) {
			return "high";
		}
		if(prevBalance==0L) {
			return "zero";
		}
		ps2=con.prepareStatement(query2);
		ps2.setLong(1, prevBalance-debit);
		ps2.setLong(2,accno);
		ps2.executeUpdate();
		ps3=con.prepareStatement("insert into "+tname+" values(NULL,now(),?,?,?,?)");
		ps3.setString(1,t.getDescription());
		ps3.setInt(2, t.getDebit());
		ps3.setInt(3, t.getCredit());
		ps3.setLong(4, prevBalance-debit);
		ps3.executeUpdate();
		ps1.close();
		ps2.close();
		ps3.close();
		con.close();
		return "success";
		
		}
		catch(Exception e) {
			e.printStackTrace();
			return "failed";
		}
		
	}
	
	public boolean credit(long accno,Transaction t) {
		
		String tname="Acc_"+Long.toString(accno);
		int credit=t.getCredit();
		String query1="select balance from "+tname+" ORDER BY id DESC LIMIT 1";
		String query2="update users set bal=? where accno=?";
		try {
		Connection con=Database.getConnection();
		PreparedStatement ps1,ps2,ps3;
		ps1=con.prepareStatement(query1);
		ResultSet rs1=ps1.executeQuery();
		long prevBalance=0L;
		while(rs1.next()) {
			prevBalance=rs1.getLong(1);
		}
		ps2=con.prepareStatement(query2);
		ps2.setLong(1, prevBalance+credit);
		ps2.setLong(2,accno);
		ps2.executeUpdate();
		ps3=con.prepareStatement("insert into "+tname+" values(NULL,now(),?,?,?,?)");
		ps3.setString(1,t.getDescription());
		ps3.setInt(2, t.getDebit());
		ps3.setInt(3, t.getCredit());
		ps3.setLong(4, prevBalance+credit);
		ps3.executeUpdate();
		ps1.close();
		ps2.close();
		ps3.close();
		con.close();
		return true;
		
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Transaction> getTransactions(long accno){
		List<Transaction> transactions=new ArrayList<>();
		
		String tname="Acc_"+Long.toString(accno);
		String query1="select * from "+tname+" ORDER BY id DESC LIMIT 10";
		try {
			Connection con=Database.getConnection();
			PreparedStatement ps=con.prepareStatement(query1);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Transaction t=new Transaction();
				t.setId(rs.getInt(1));
				t.setDate(rs.getString(2));
				t.setDescription(rs.getString(3));
				t.setDebit(rs.getInt(4));
				t.setCredit(rs.getInt(5));
				t.setBalance(rs.getLong(6));
				transactions.add(t);
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return transactions;
	}
	
	public String updatePassword(long accno,int oldpass,int newpass,int confpass) {
		
		try {
		Connection con=Database.getConnection();
		PreparedStatement ps=con.prepareStatement("select pin from users where accno=?");
		ps.setLong(1, accno);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			if(newpass==confpass) {
				if(rs.getInt(1)==oldpass) {
					PreparedStatement ps1=con.prepareStatement("update users set pin=? where accno=?");
					ps1.setInt(1, newpass);
					ps1.setLong(2, accno);
					ps1.execute();
				}
				else {
					return "old";
				}
				
			}
			else {
				return "con";
			}
		}
		return "success";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "failed";
		}
		
		
	}

}
