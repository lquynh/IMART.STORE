package dao;

import connect.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.BillDeatail;
import org.json.JSONException;
import org.json.JSONObject;
import webservice.webservice;

public class BillDetailDao {
    String url = "http://172.20.10.3/api/shop/";
    
    public boolean insertBillDetail(BillDeatail bd) throws SQLException, JSONException, IOException {
        webservice ws = new webservice();
        int billID = bd.getBillID();
        int productID = bd.getProductID();
        int quantity = bd.getQuantity();
        double price = bd.getPrice();
        
        JSONObject jo = new JSONObject();
        jo.put("id_bill", billID);
        jo.put("id_product", productID);
        jo.put("quanlity", quantity);
        jo.put("price", price);
        

        return ws.sendToServer(jo, url + "saveBillDetail?Json=" + jo);
    }
    
     
}
