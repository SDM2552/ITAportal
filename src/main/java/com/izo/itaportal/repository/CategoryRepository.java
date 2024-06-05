package com.izo.itaportal.repository;


import com.izo.itaportal.model.Category;

import com.izo.itaportal.model.Program;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryRepository {
    public List<Category> selectCategory();
    public Category selectCategoryById(int idCate);
    public int insert(Category category);
    public int update(Category category);
    public int delete(int idCate);
    public int deletePrg(int idCate);
    public int countAllCategories();
    List<Category> searchCategoryByName(String keyword);

    public List<Category> getCategoriesPerPage(int offset, int pageSize);

}
