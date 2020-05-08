package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;
import org.json.JSONArray;
import org.json.JSONObject;

public class CartServlet extends HttpServlet {

   private final ProductDao productDao = new ProductDao();

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Lấy giá trị command
        String command = request.getParameter("command");
        // Lấy ID sản phẩm
        String productID = request.getParameter("productID");
        
        Cart cart = (Cart) session.getAttribute("cart");

        try {
            int idProduct = Integer.parseInt(productID);
            Product product = productDao.getProduct(idProduct);
            switch (command) {
                case "plus":
                    if (cart.getCartItems().containsKey(idProduct)) {
                        cart.plusToCart(idProduct, new Item(product,
                                cart.getCartItems().get(idProduct).getQty()));
                    } else {
                        cart.plusToCart(idProduct, new Item(product, 1));
                    }
                    break;
                case "remove":
                    cart.removeToCart(idProduct);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/shopDT/home.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("/shopDT/home.jsp");
    }
}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
