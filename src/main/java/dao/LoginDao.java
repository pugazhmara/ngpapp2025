package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import model.LoginModel;

public class LoginDao{
    public boolean login(LoginModel lm) {
    	String uname=lm.getUsername();
    	String pass=lm.getPassword();
    	// Database URL, username, and password
        String jdbcURL = "jdbc:mysql://localhost:3306/ngpdb";
        String username = "root";
        String password = "";

        try {
            // Step 1: Establish the connection
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);
            System.out.println("Connected to the database!");

            // Step 2: Create a statement
            Statement statement = connection.createStatement();

            // Step 3: Execute a query
            String sql = "SELECT * FROM usertable where username='"+uname+"'and password='"+pass+"'";
            ResultSet resultSet = statement.executeQuery(sql);
            if(resultSet.next()) {
            	connection.close();
            	return true;
            }else {
            	connection.close();
            	return false;
            }
            // Step 4: Process the result set
            

            // Step 5: Close the connection
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}



//https://tinyurl.com/OA-BUILD-NGP
//	
//
//https://tinyurl.com/Wpngp









