package com.izo.itaportal.repository;


import com.izo.itaportal.model.Category;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryRepository {

    public int insert(Category category);
    public int update(int cateId);
    public int delete(int cateId);

}
