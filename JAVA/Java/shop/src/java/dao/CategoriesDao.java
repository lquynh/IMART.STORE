package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Categories;
import model.Product;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import webservice.webservice;

public class CategoriesDao {
     public ArrayList<Categories> getMenu() throws SQLException, JSONException {
        webservice ws = new webservice();
        JSONArray ja = ws.getJSONArrayData("http://172.20.10.3/api/shop/getMenu");
        ArrayList<Categories> list = new ArrayList<>();
        for(int i = 0;i<ja.length();i++){
            Categories menu = new Categories();  
            menu.setName((String) ja.getJSONObject(i).get("name"));
            
            list.add(menu);
        }
        return list;
    }
     
}
