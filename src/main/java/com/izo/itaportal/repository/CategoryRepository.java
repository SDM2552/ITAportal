package com.izo.itaportal.repository;


import com.izo.itaportal.model.Category;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryRepository {
    public List<Category> selectCategory();
    public int insert(Category category);
    public int update(int cateId);
    public int delete(int cateId);

}
