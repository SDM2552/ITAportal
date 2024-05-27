package com.izo.itaportal.dto;

import lombok.Data;

@Data
public class StudentInfoDto {

        private int idUser;
        private int idStudent;
        private String name;
        private String tel;
        private String address;
        private String birth;
        private String gender;
        private String email;

}
