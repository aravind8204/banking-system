package com.dao;

import java.sql.*;

import com.model.Customer;

public class AdminDAO {
	
	public boolean validate(String username,String pass) throws ClassNotFoundException, SQLException {
		
		Connection con=Database.getConnection();
		PreparedStatement ps=con.prepareStatement("select pass from admin where userid=?");
		ps.setString(1, username);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			if(rs.getString(1).equals(pass)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean deleteCustomer(Customer c) {
		
		try {
			long accountno=c.getAccountNo();
			String NA="Acc_"+Long.toString(accountno);
			Connection con=Database.getConnection();
			PreparedStatement ps=con.prepareStatement("delete from users where accno=?");
			ps.setLong(1, accountno);
			ps.executeUpdate();
			PreparedStatement ps2=con.prepareStatement("drop table "+NA);
			ps2.execute();
			ps2.close();
			ps.close();
			con.close();
			
			return true;
			
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
		
	}

}
