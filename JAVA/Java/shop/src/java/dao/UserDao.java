package dao;

import connect.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;
import org.json.JSONException;
import org.json.JSONObject;
import webservice.webservice;

public class UserDao {
    String url = "http://172.20.10.3/api/shop/";
    public boolean checkMailExist(String email) throws SQLException{
        webservice ws = new webservice();
        String data = ws.getData(url + "checkMailExist?email=" + email);
        if(data.equals("true")){
            return true;
        }
        return false;
    }
    
    public boolean insertUser(User u) throws SQLException, JSONException, IOException{
        webservice ws = new webservice();
        String username = u.getUsername();
        String pass = u.getPassword();
        String email = u.getEmail();
        String phone = u.getPhone();
        String add = u.getAddress();
        
        JSONObject jo = new JSONObject();
        
        jo.put("username",username);
        jo.put("password", pass);
        jo.put("email", email);
        jo.put("phone", phone);
        jo.put("address", add);
        
        return ws.sendToServer(jo, url + "saveCustomer?Json="+jo);
        
    }
    
     public User login(String email, String password) throws SQLException, JSONException{
        webservice ws = new webservice();
        JSONObject jo = ws.getJSONObjectData(url + "login?email=" + email + "&password=" + password);
        if((int)jo.get("id")!=0){
            User u = new User();
            u.setId((int) jo.get("id"));
            u.setUsername((String) jo.get("username"));
            u.setPassword((String) jo.get("password"));
            u.setEmail((String) jo.get("email"));
            u.setAddress((String)jo.get("address"));
            u.setPhone((String) jo.get("phone"));
            return u;
        }    
        
        return null;
    }
    
}


