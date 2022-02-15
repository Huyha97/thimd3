package dao;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductDao {
    static Connection connection = ConnectMySQL.getConnectMySQL();

    public static ArrayList<Product> getAll() {
        String select  = "select product.* , category.name as namecategory from testmodule3.product join category on product.category = category.id";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(select);
            ArrayList<Product> productList = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String nameCategory = resultSet.getString("nameCategory");
                int category = resultSet.getInt("category");
                productList.add(new Product(id,name,price,quantity,color,description ,nameCategory ,category));
            }
            return productList;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public static void saveProduct(Product product){
        String insert = "insert into product (`name`,`price`,`quantity`,`color`,`description`,`category`) value(?,?,?,?,?,?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(insert);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5,product.getDescription());
            preparedStatement.setInt(6,product.getCategory());

            preparedStatement.execute();

        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }
    public static void editProduct(Product product ){
        String insert = "update testmodule3.product set name =? , price =? , quantity =? , color =? , description =? , category =? where id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(insert);
            preparedStatement.setInt(7,product.getId());
            preparedStatement.setString(1,product.getName());
            preparedStatement.setDouble(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setString(4,product.getColor());
            preparedStatement.setString(5,product.getDescription());
            preparedStatement.setInt(6,product.getCategory());

            preparedStatement.execute();

        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }
    public static void deleteProduct(int id){
        String insert = "delete from product where id=?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(insert);
            preparedStatement.setInt(1,id);
            preparedStatement.execute();
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }
    public static ArrayList<Product> findByName(String nameFind) {
        String find = "SELECT product.* , category.name as nameCategory  FROM testmodule3.product join category on product.category = category.id\n" +
                "where product.name like '%"+nameFind+"%\'";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(find);
            ArrayList<Product> productList = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                String nameCategory = resultSet.getString("nameCategory");
                int category = resultSet.getInt("category");
                productList.add(new Product(id,name,price,quantity,color,description ,nameCategory ,category));
            }
            return productList;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}