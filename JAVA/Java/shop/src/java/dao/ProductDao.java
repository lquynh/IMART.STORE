package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import webservice.webservice;

public class ProductDao {
    private String url = "http://172.20.10.3/api/shop/";

    public ArrayList<Product> getListProductByNew() throws SQLException, JSONException {
        webservice ws = new webservice();
        JSONArray ja = ws.getJSONArrayData(url + "getListProductByNew");
        ArrayList<Product> list = new ArrayList<>();
        for(int i = 0;i<ja.length();i++){
            Product product = new Product();
            
            product.setName((String) ja.getJSONObject(i).get("name"));
            product.setImage((String) ja.getJSONObject(i).get("image"));
            product.setValue((int) ja.getJSONObject(i).get("price"));
            product.setPromotion_price((int) ja.getJSONObject(i).get("promotion_price"));
            product.setId((int) ja.getJSONObject(i).get("id"));
            list.add(product);
        }
        return list;
    }

    public ArrayList<Product> getListProductBySpecial() throws SQLException, JSONException {
        webservice ws = new webservice();
        JSONArray ja = ws.getJSONArrayData(url + "getListProductBySpecial");
        ArrayList<Product> list = new ArrayList<>();
        for(int i = 0;i<ja.length();i++){
            Product product = new Product();
            
            product.setName((String) ja.getJSONObject(i).get("name"));
            product.setImage((String) ja.getJSONObject(i).get("image"));
            product.setValue((int) ja.getJSONObject(i).get("price"));
            product.setPromotion_price((int) ja.getJSONObject(i).get("promotion_price"));
            product.setId((int) ja.getJSONObject(i).get("id"));
            list.add(product);
        }
        return list;
    }

    public ArrayList<Product> getListProductByPromotionPrice() throws SQLException, JSONException {
        webservice ws = new webservice();
        JSONArray ja = ws.getJSONArrayData(url + "getListProductByPromotionPrice");
        ArrayList<Product> list = new ArrayList<>();
        for(int i = 0;i<ja.length();i++){
            Product product = new Product();
            
            product.setName((String) ja.getJSONObject(i).get("name"));
            product.setImage((String) ja.getJSONObject(i).get("image"));
            product.setValue((int) ja.getJSONObject(i).get("price"));
            product.setPromotion_price((int) ja.getJSONObject(i).get("promotion_price"));
            product.setId((int) ja.getJSONObject(i).get("id"));
            list.add(product);
        }
        return list;
    }
    
    public Product getProduct(int productID) throws SQLException, JSONException {
        webservice ws = new webservice();
        JSONObject jo = ws.getJSONObjectData(url + "getProduct?id=" + productID);
        Product product = new Product();
            
        product.setName((String) jo.get("name"));
        product.setImage((String) jo.get("image"));
        product.setValue((int) jo.get("price"));
        product.setPromotion_price((int) jo.get("promotion_price"));
        product.setId((int) jo.get("id"));
        product.setId_type((int) jo.get("id_type"));
        return product;
    }
    
    public ArrayList<Product> getListProductByRelated(int id_type) throws SQLException, JSONException {
        webservice ws = new webservice();
        JSONArray ja = ws.getJSONArrayData(url + "getListProductByRelated?id_type=" + id_type);
        ArrayList<Product> list = new ArrayList<>();
        for(int i = 0;i<ja.length();i++){
            Product product = new Product();
            
            product.setName((String) ja.getJSONObject(i).get("name"));
            product.setImage((String) ja.getJSONObject(i).get("image"));
            product.setValue((int) ja.getJSONObject(i).get("price"));
            product.setPromotion_price((int) ja.getJSONObject(i).get("promotion_price"));
            product.setId((int) ja.getJSONObject(i).get("id"));
            list.add(product);
        }
        return list;
    }

     public ArrayList<Product> getListProductBySearch(String keyword) throws SQLException, JSONException {
        webservice ws = new webservice();
        JSONArray ja = ws.getJSONArrayData(url + "getListProductBySearch?keyword=" + keyword);
        ArrayList<Product> list = new ArrayList<>();
        for(int i = 0;i<ja.length();i++){
            Product product = new Product();
            
            product.setName((String) ja.getJSONObject(i).get("name"));
            product.setImage((String) ja.getJSONObject(i).get("image"));
            product.setValue((int) ja.getJSONObject(i).get("price"));
            product.setPromotion_price((int) ja.getJSONObject(i).get("promotion_price"));
            product.setId((int) ja.getJSONObject(i).get("id"));
            list.add(product);
        }
        return list;
    }
    

}
