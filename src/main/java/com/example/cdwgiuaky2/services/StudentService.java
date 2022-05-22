package com.example.cdwgiuaky2.services;

import com.example.cdwgiuaky2.bean.Student;
import com.example.cdwgiuaky2.database.StudentFakeDB;
import org.springframework.stereotype.Service;

@Service
public class StudentService {
    public Student getStudentById(String idStudent) {
        for (Student s : StudentFakeDB.list) {
            if (s.getId().equals(idStudent)) {
                return s;
            }
        }
        return null;
    }

    public boolean checkStudentExist(Student student) {
        for (Student s : StudentFakeDB.list) {
            if (s.getId().equals(student.getId())) {
                return true;
            }
        }
        return false;
    }

    public boolean checkStudentExistWithOutCurrentStudent(Student student, String currentStudentId) {
        for (Student s : StudentFakeDB.list) {
            if (s.getId().equals(student.getId()) && !s.getId().equals(currentStudentId)) {
                return true;
            }
        }
        return false;
    }
}
