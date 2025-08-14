package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import model.RegisterModel;

public class RegisterDao {
     public boolean register(RegisterModel rg) {
    	  String name=rg.getName();
    	  String pass=rg.getPass();
    	  String email=rg.getEmail();
    	  String pin=rg.getPin();
    	  String mobile=rg.getMobile();
    	  String jdbcURL = "jdbc:mysql://localhost:3306/ngpdb";
          String dbUser = "root"; // Change if needed
          String dbPassword = ""; // Change if needed

          try {
              // Load JDBC driver
              Class.forName("com.mysql.cj.jdbc.Driver");

              // Establish connection
              Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

              // SQL Insert query
              String sql = "INSERT INTO usertable (username, password, email, mobile, pin) VALUES (?, ?, ?, ?, ?)";

              // Prepare statement
              PreparedStatement ps = con.prepareStatement(sql);
              ps.setString(1, name);
              ps.setString(2, pass);
              ps.setString(3, email);
              ps.setString(4, mobile);
              ps.setString(5, pin);

              // Execute update
              int rowsInserted = ps.executeUpdate();
              if (rowsInserted > 0) {
                  System.out.println("✅ Data inserted successfully!");
                  ps.close();
                  con.close();
                  return true;
              }else {
            	  ps.close();
                  con.close();
            	  return false;
              }

              // Close connection
              
          } catch (Exception e) {
              e.printStackTrace();
              return false;
          }
    	  
     }
}
