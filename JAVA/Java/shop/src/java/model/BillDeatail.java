package model;

public class BillDeatail {

    int billDetailID;
    int billID;
    int productID;
    double price;
    int quantity;

    public BillDeatail() {
    }

    public BillDeatail(int billDetailID, int billID, int productID, int quantity, double price) {
        this.billDetailID = billDetailID;
        this.billID = billID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;

    }

    public int getBillDetailID() {
        return billDetailID;
    }

    public void setBillDetailID(int billDetailID) {
        this.billDetailID = billDetailID;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
