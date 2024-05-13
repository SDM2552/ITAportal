package com.izo.itaportal.service;


import com.izo.itaportal.model.Category;
import com.izo.itaportal.model.ClassRoom;
import com.izo.itaportal.repository.ClassRoomRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClassRoomService {
    @Autowired
    private ClassRoomRepository classRoomRepository;

    public List<ClassRoom> getAllClassRoom() {
        List<ClassRoom> classRoom = new ArrayList<>();
        return classRoom;
    }

    public int insertClassRoom(ClassRoom classRoom) {
        int insertClassRoom = classRoomRepository.insert(classRoom);
        return insertClassRoom;
    }

    public int updateClassRoom(int roomId) {
        int updateClassRoom = classRoomRepository.update(roomId);
        return updateClassRoom;
    }

    public int deleteClassRoom(int roomId) {
        int deleteClassRoom = classRoomRepository.delete(roomId);
        return deleteClassRoom;
    }

}
