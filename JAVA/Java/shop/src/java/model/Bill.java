package model;

import java.sql.Timestamp;

public class Bill {

    int billID;
    int userID;
    double total;
    String phone;
    String address;
    Timestamp date;

    public Bill() {
    }

    public Bill(int billID, int userID, Timestamp date, double total) {
        this.billID = billID;
        this.userID = userID;
        this.date = date;
        this.total = total;
//        this.phone = phone;
//        this.address = address;

    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

}
