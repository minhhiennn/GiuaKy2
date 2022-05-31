package com.example.cdwgiuaky2;

import com.example.cdwgiuaky2.model.Student;
import com.example.cdwgiuaky2.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@SpringBootApplication
public class CdwGiuaKy2Application {


    @Autowired
    private StudentRepository studentRepository;

    public static void main(String[] args) {
        SpringApplication.run(CdwGiuaKy2Application.class, args);
    }

    @PostConstruct
    private void init() {
        List<Student> studentList = new ArrayList<>();
        studentList.add(new Student("02231034", "Cuong", true, Calendar.getInstance(), "HCM", "123/456", "Anh văn"));
        studentList.add(new Student("02231035", "Cuong1", true, Calendar.getInstance(), "HCM", "123/456", "Kinh tế"));
        studentList.add(new Student("02231036", "Cuong2", true, Calendar.getInstance(), "HCM", "123/456", "Hóa học"));
        studentList.add(new Student("02231037", "Cuong3", true, Calendar.getInstance(), "HCM", "123/456", "Sinh vật học"));
        studentList.add(new Student("02231038", "Cuong4", true, Calendar.getInstance(), "HCM", "123/456", "Tin học"));
        studentRepository.saveAll(studentList);
    }

}
