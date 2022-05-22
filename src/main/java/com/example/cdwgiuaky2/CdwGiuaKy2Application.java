package com.example.cdwgiuaky2;

import com.example.cdwgiuaky2.bean.Student;
import com.example.cdwgiuaky2.database.StudentFakeDB;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;
import java.util.Calendar;

@SpringBootApplication
public class CdwGiuaKy2Application {

    public static void main(String[] args) {
        SpringApplication.run(CdwGiuaKy2Application.class, args);
    }

    @PostConstruct
    private void init() {
        StudentFakeDB.list.add(new Student("02231034","Cuong",true, Calendar.getInstance(),"HCM","123/456","Anh văn"));
        StudentFakeDB.list.add(new Student("02231035","Cuong1",true, Calendar.getInstance(),"HCM","123/456","Kinh tế"));
        StudentFakeDB.list.add(new Student("02231036","Cuong2",true, Calendar.getInstance(),"HCM","123/456","Hóa học"));
        StudentFakeDB.list.add(new Student("02231037","Cuong3",true, Calendar.getInstance(),"HCM","123/456","Sinh vật học"));
        StudentFakeDB.list.add(new Student("02231038","Cuong4",true, Calendar.getInstance(),"HCM","123/456","Tin học"));
    }

}
