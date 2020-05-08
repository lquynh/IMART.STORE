package controller;

import dao.BillDao;
import dao.BillDetailDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillDeatail;
import model.Cart;
import model.Item;
import model.User;

public class CheckOutServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    BillDao billDAO = new BillDao();
    private final BillDetailDao billDetailDAO = new BillDetailDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User users = (User) session.getAttribute("users");
        try {
            // Tạo id động theo thời gian
            int ID = (int) new Date().getTime();
            
            Bill bill = new Bill();

            bill.setBillID(ID);
            bill.setUserID(users.getId());
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotal(cart.totalCart());
            bill.setPhone(phone);
            bill.setAddress(address);
            billDAO.insertBill(bill);
            for (Map.Entry<Integer, Item> list : cart.getCartItems().entrySet()) {
                billDetailDAO.insertBillDetail(new BillDeatail(0, ID,
                        list.getValue().getProduct().getId(),
                        list.getValue().getQty(),
                        list.getValue().getProduct().getValue()));

            }

        } catch (Exception e) {
        }

        response.sendRedirect("/shopDT/home.jsp");
    }

}
