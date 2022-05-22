package com.example.cdwgiuaky2.database;

import com.example.cdwgiuaky2.bean.Student;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StudentFakeDB {
    public static List<Student> list = new ArrayList<>();

    public static List<String> listDepartment = new ArrayList<>(Arrays.asList("Anh văn", "Kinh tế", "Hóa học", "Sinh vật học", "Tin học", "Vật lý"));
}
