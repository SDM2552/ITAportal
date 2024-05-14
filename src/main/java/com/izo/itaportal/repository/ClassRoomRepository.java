package com.izo.itaportal.repository;


import com.izo.itaportal.model.ClassRoom;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClassRoomRepository {
    public List<ClassRoom> selectClassRoom();
    public ClassRoom selectClassRoomById(int idRoom);
    public int insert(ClassRoom classRoom);
    public int update(ClassRoom classRoom);
    public int delete(int idRoom);

}
