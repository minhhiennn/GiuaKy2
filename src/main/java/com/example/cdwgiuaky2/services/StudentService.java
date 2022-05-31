package com.example.cdwgiuaky2.services;

import com.example.cdwgiuaky2.model.Student;
import com.example.cdwgiuaky2.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    public Student getStudentById(String idStudent) {
        if (studentRepository.findById(idStudent).isPresent()) {
            return studentRepository.findById(idStudent).get();
        }
        return null;
    }

    public boolean checkStudentExist(Student student) {
        return studentRepository.findById(student.getId()).isPresent();
    }

    public void addNewStudent(Student student) {
        studentRepository.save(student);
    }

    public void addNewStudents(List<Student> studentList) {
        studentRepository.saveAll(studentList);
    }
}
