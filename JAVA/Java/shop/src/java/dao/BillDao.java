package dao;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import model.Bill;
import org.json.JSONException;
import org.json.JSONObject;
import webservice.webservice;

public class BillDao {
    String url = "http://172.20.10.3/api/shop/";
    
     public boolean insertBill(Bill bill) throws JSONException, IOException {
        
        webservice ws = new webservice();
        int billID = bill.getBillID();
        int userID = bill.getUserID();
        Timestamp date = bill.getDate();
        double total = bill.getTotal();
        
        JSONObject jo = new JSONObject();
        jo.put("id", billID);
        jo.put("id_customers", userID);
        jo.put("date_order", date);
        jo.put("total", total);
        
        return ws.sendToServer(jo, url + "saveBill?Json=" + jo);
    }
    
     
}
