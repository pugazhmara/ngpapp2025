package dao;

import model.RegisterModel;

public class RegisterDao {
     public void register(RegisterModel rg) {
    	 System.out.println(rg.getName());
    	 System.out.println(rg.getEmail());
     }
}
