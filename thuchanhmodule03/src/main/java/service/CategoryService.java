package service;

import dao.CategoryDao;
import model.Category;

import java.util.ArrayList;

public class CategoryService {
    public ArrayList<Category> getAll(){
        return CategoryDao.getAll();
    }
}
