package com.izo.itaportal.service;



import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.ClassRoom;
import com.izo.itaportal.model.Program;
import com.izo.itaportal.repository.CategoryRepository;

import com.izo.itaportal.repository.ProgramRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProgramRepository programRepository;

    public List<Category> getAllCategory() {
        List<Category> category = categoryRepository.selectCategory();
        return category;
    }
    public Category getCategoryById(int idCate) {
        return categoryRepository.selectCategoryById(idCate);

    }

    public int countAllCategories(){
        return categoryRepository.countAllCategories();
    }

    public List<Category> getCategoriesPerPage(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return categoryRepository.getCategoriesPerPage(offset, pageSize);
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

    public int deleteProgram(int idCate) {
        int deleteProgram = categoryRepository.deletePrg(idCate);
        return deleteProgram;
    }

    public List<Category> searchCategoryByName(String keyword) {
        return categoryRepository.searchCategoryByName(keyword);
    }

}
