package com.izo.itaportal.repository;

import com.izo.itaportal.model.File;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileRepository {
    void saveFile(File file);

    File getFile(Integer idFile);

    File getFileByExamAndStudent(Integer idExam, Integer idStudent);
}
