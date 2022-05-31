package com.example.cdwgiuaky2.repository;

import com.example.cdwgiuaky2.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface StudentRepository extends JpaRepository<Student, String> {

    @Override
    List<Student> findAll();

    Optional<Student> findById(String id);
}