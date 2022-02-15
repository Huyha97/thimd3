package controller;

import model.Product;
import service.CategoryService;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/home")
public class homeServlet extends HttpServlet {
    CategoryService categoryService = new CategoryService();
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        RequestDispatcher requestDispatcher;
        switch (action) {
            case "create":
                req.setAttribute("listClass", categoryService.getAll());
                requestDispatcher = req.getRequestDispatcher("/views/createProduct.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("listClass", categoryService.getAll());
                req.setAttribute("product", productService.productList.get(productService.findIndexById(idEdit)));
                requestDispatcher = req.getRequestDispatcher("/views/editProduct.jsp");
                requestDispatcher.forward(req, resp);
                break;

            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                productService.delete(idDelete);
                resp.sendRedirect("/home");
                break;

            default:
                req.setAttribute("listProduct", productService.productList);
                requestDispatcher = req.getRequestDispatcher("/views/showProduct.jsp");
                requestDispatcher.forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        RequestDispatcher requestDispatcher;

        switch (action) {
            case "create":
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                String color = req.getParameter("color");
                String description = req.getParameter("description");
                int category = Integer.parseInt(req.getParameter("category"));
                Product product = new Product(name, price, quantity, color, description, category);
                productService.save(product);

            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                String nameEdit = req.getParameter("name");
                double priceEdit = Double.parseDouble(req.getParameter("price"));
                int quantityEdit = Integer.parseInt(req.getParameter("quantity"));
                String colorEdit = req.getParameter("color");
                String descriptionEdit = req.getParameter("description");
                int categoryEdit = Integer.parseInt(req.getParameter("category"));
                Product productEdit = new Product(idEdit, nameEdit, priceEdit, quantityEdit, colorEdit, descriptionEdit, categoryEdit);
                productService.edit(productEdit);
                resp.sendRedirect("/home");
                break;
            case "search":
                String nameSearch = req.getParameter("search");
                req.setAttribute("listProduct", productService.findByName(nameSearch));
                requestDispatcher = req.getRequestDispatcher("/views/showProduct.jsp");
                requestDispatcher.forward(req, resp);
                break;


        }
    }
}
