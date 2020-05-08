package model;

import org.json.JSONArray;
import org.json.JSONObject;

public class Item {
    Product product;
    int qty;

    public Item(Product product, int qty) {
        this.product = product;
        this.qty = qty;
    }

    public Item() {
    }
    
    public Item(JSONObject product, int qty) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
    
}
