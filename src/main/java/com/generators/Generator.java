package com.generators;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.dao.Database;

public class Generator {
	
public long Acc_generator() throws SQLException, ClassNotFoundException {
		
		Random random=new Random();
		long ac=0;
		for(int i=0;i<15;i++) {
			int digit=random.nextInt(10);
			ac=ac*10+digit;
		}
		List<Long> arr=new ArrayList<>();
		Connection con=Database.getConnection();
		PreparedStatement st=con.prepareStatement("select accno from users");
		ResultSet rs=st.executeQuery();
		while(rs.next()) {
			arr.add(rs.getLong(1));
		}
		if(!arr.contains(ac)) {
			return ac;
		}
		else {
			return Acc_generator();
		}
		
	}
	public int Pass_generator() {
		
		Random random=new Random();
		int pass=0;
		for(int i=0;i<4;i++) {
			int digit=random.nextInt(10);
			pass=pass*10+digit;
		}
		return pass;
	}

}
