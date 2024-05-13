package com.izo.itaportal.repository;


import com.izo.itaportal.model.ClassRoom;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClassRoomRepository {

    public int insert(ClassRoom classRoom);
    public int update(int roomId);
    public int delete(int roomId);

}
