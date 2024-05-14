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
        List<ClassRoom> classRoom = classRoomRepository.selectClassRoom();
        return classRoom;
    }

    public ClassRoom getClassRoomById(int idRoom) {
        return classRoomRepository.selectClassRoomById(idRoom);

    }

    public int insertClassRoom(ClassRoom classRoom) {
        int insertClassRoom = classRoomRepository.insert(classRoom);
        return insertClassRoom;
    }

    public int updateClassRoom(ClassRoom classRoom) {
        int updateClassRoom = classRoomRepository.update(classRoom);
        return updateClassRoom;
    }

    public int deleteClassRoom(int idRoom) {
        int deleteClassRoom = classRoomRepository.delete(idRoom);
        return deleteClassRoom;
    }


}
