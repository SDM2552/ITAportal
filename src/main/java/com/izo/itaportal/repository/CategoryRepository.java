package com.izo.itaportal.repository;


import com.izo.itaportal.model.Category;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryRepository {
    public List<Category> selectCategory();
    public Category selectCategoryById(int idCate);
    public int insert(Category category);
    public int update(Category category);
    public int delete(int idCate);

}
