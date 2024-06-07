package com.izo.itaportal.service;

import com.izo.itaportal.model.File;
import com.izo.itaportal.repository.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public class FileService {
    @Autowired
    private FileRepository fileRepository;

    @Transactional
    public void saveFile(MultipartFile multipartFile, Integer idExam, Integer idStudent) throws IOException {
        File file = new File();
        file.setIdExam(idExam);
        file.setIdStudent(idStudent);
        file.setFileName(multipartFile.getOriginalFilename());
        file.setFileSize((int) multipartFile.getSize());
        file.setFileType(multipartFile.getContentType());
        file.setData(multipartFile.getBytes());

        fileRepository.saveFile(file);
    }
    public File getFile(Integer idFile) {
        return fileRepository.getFile(idFile);
    }

    public File getFileByExamAndStudent(Integer idExam, Integer idStudent) {
        return fileRepository.getFileByExamAndStudent(idExam, idStudent);
    }
}
