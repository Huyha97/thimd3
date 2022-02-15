package dao;

import model.Category;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoryDao {
    static Connection connection = ConnectMySQL.getConnectMySQL();
    public static ArrayList<Category> getAll() {
        String selectAll = "select * from category";

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(selectAll);
            ArrayList<Category> listClass = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                listClass.add(new Category(id, name));
            }
            return listClass;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}