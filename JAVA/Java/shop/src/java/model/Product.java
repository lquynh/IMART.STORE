package model;

public class Product {
    int id;
    int id_type;
    int id_url;
    String name;
    String detail;
    int value;
    int promotion_price;
    String promotion;
    String image;
    boolean status;
    boolean new_product;
    String date;
    boolean update;
    
    public Product() {
    }

    public Product(int id, int id_type, int id_url, String name, String detail, int value, int promotion_price, String promotion, String image, boolean status, boolean new_product, String date, boolean update) {
        this.id = id;
        this.id_type = id_type;
        this.id_url = id_url;
        this.name = name;
        this.detail = detail;
        this.value = value;
        this.promotion_price = promotion_price;
        this.promotion = promotion;
        this.image = image;
        this.status = status;
        this.new_product = new_product;
        this.date = date;
        this.update = update;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_type() {
        return id_type;
    }

    public void setId_type(int id_type) {
        this.id_type = id_type;
    }

    public int getId_url() {
        return id_url;
    }

    public void setId_url(int id_url) {
        this.id_url = id_url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getPromotion_price() {
        return promotion_price;
    }

    public void setPromotion_price(int promotion_price) {
        this.promotion_price = promotion_price;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isNew_product() {
        return new_product;
    }

    public void setNew_product(boolean new_product) {
        this.new_product = new_product;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isUpdate() {
        return update;
    }

    public void setUpdate(boolean update) {
        this.update = update;
    }

   

    

}
