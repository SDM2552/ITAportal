package com.izo.itaportal.service;



import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.ClassRoom;
import com.izo.itaportal.repository.CategoryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    public List<Category> getAllCategory() {
        List<Category> category = categoryRepository.selectCategory();
        return category;
    }
    public Category getCategoryById(int idCate) {
        return categoryRepository.selectCategoryById(idCate);

    }

    public int insertCategory(Category category) {
        int insertCategory = categoryRepository.insert(category);
        return insertCategory;
    }

    public int updateCategory(Category category) {
        int updateCategory = categoryRepository.update(category);
        return updateCategory;
    }

    public int deleteCategory(int idCate) {
        int deleteCategory = categoryRepository.delete(idCate);
        return deleteCategory;
    }

}
