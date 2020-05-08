package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    HashMap<Integer, Item> cartItems;

    public Cart() { 
        cartItems = new HashMap<>();
    }
    
    public Cart(HashMap<Integer, Item> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Integer, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Integer, Item> cartItems) {
        this.cartItems = cartItems;
    }
    
    public void plusToCart(int key, Item item) {
        boolean check = cartItems.containsKey(key);
        //System.out.println(check);
        if (check) {
            int quantity_old = item.getQty();
            item.setQty(quantity_old + 1);
            cartItems.put(key, item);
           // System.out.println(cartItems.put(key, item));
        } else {
            cartItems.put(key, item);
        }
    }
    
     public void subToCart(int key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQty();
            if (quantity_old <= 1) {
                cartItems.remove(key);
            } else {
                item.setQty(quantity_old - 1);
                cartItems.put(key, item);
            }
        }
    }
     
    public void removeToCart(int key) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            cartItems.remove(key);
        }
    }
    
    public int countItem() {
        return cartItems.size();
    }
    
    public double totalCart() {
        double count = 0;
        // count = price * quantity
        for (Map.Entry<Integer, Item> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getValue() * list.getValue().getQty();
        }
        return count;
    }
    
    public static void main(String[] args) {
        Product p = new Product(1, 2, 3, "a", "b", 4, 5, "d", "c", true, true, "d", true);
        Item i = new Item(p, 2);
       
       Cart c = new Cart();
        c.plusToCart(1, i);
        
    }
}
