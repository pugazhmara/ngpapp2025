package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDao{
    public static void main(String[] args) {
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
            String sql = "SELECT * FROM usertable";
            ResultSet resultSet = statement.executeQuery(sql);

            // Step 4: Process the result set
            while (resultSet.next()) {
                String name = resultSet.getString("username");
                String pass = resultSet.getString("password");
                System.out.println("name: " + name + ", pass: " + pass);
            }

            // Step 5: Close the connection
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



//https://tinyurl.com/OA-BUILD-NGP
//	
//
//https://tinyurl.com/Wpngp









