package service;

import dao.ProductDao;
import model.Product;

import java.util.ArrayList;

public class ProductService {
    public static ArrayList<Product> productList = ProductDao.getAll();
    public  ProductService() {
        productList = ProductDao.getAll();

    }

    public void save(Product product) {
        ProductDao.saveProduct(product);
        productList = ProductDao.getAll();
    }

    public void edit(Product product ) {
        ProductDao.editProduct( product );
        productList = ProductDao.getAll();

    }
    public void delete(int id){
        ProductDao.deleteProduct(id);
        productList = ProductDao.getAll();
    }
    public  int findIndexById(int id){
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId()==id){
                return i;
            }
        }
        return -1;
    }
    public ArrayList<Product> findByName(String name) {

        return ProductDao.findByName(name);
    }


}
