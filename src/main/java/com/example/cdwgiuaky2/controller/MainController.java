package com.example.cdwgiuaky2.controller;

import com.example.cdwgiuaky2.bean.Student;
import com.example.cdwgiuaky2.database.StudentFakeDB;
import com.example.cdwgiuaky2.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.ParseException;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private StudentService studentService;

    @GetMapping({"", "/studentManager"})
    public String studentManagerPage(Model model) {
        List<Student> list = StudentFakeDB.list;
        model.addAttribute("listStudent", list);
        model.addAttribute("countListStudent", list.size());
        return "studentManager";
    }

    @GetMapping("/newStudent")
    public String newStudentPage(Model model) {
        model.addAttribute("student", new Student());
        return "newStudent";
    }

    @PostMapping("/newStudentSubmit")
    public String submitNewStudent(@ModelAttribute("student") Student student, Model model) {
        if (studentService.checkStudentExist(student)) {
            model.addAttribute("errorStudentExist", "Đã có student sử dụng id này");
            return "newStudent";
        }
        StudentFakeDB.list.add(student);
        return "redirect:/studentManager";
    }

    @GetMapping("/404")
    public String page404() {
        return "404";
    }

    @GetMapping("/editStudent/{idStudent}")
    public String editStudentPage(@PathVariable(value = "idStudent") String idStudent, Model model) {
        if (idStudent != null) {
            Student student = studentService.getStudentById(idStudent);
            model.addAttribute("newStudent", new Student());
            model.addAttribute("student", student);
            model.addAttribute("listDeparment", StudentFakeDB.listDepartment);
            return "editStudent";
        }
        return "redirect:/404";
    }

    @PostMapping("/editStudent/{idStudent}")
    public String submitUpdateStudent(@ModelAttribute("newStudent") Student newStudent, @PathVariable(value = "idStudent") String idStudent, Model model) throws ParseException {
        if (!studentService.checkStudentExistWithOutCurrentStudent(newStudent, idStudent)) {
            Student student = studentService.getStudentById(idStudent);
            student.setId(newStudent.getId());
            student.setName(newStudent.getName());
            student.setMale(newStudent.isMale());
            student.setBirthday(newStudent.getBirthday());
            student.setPlaceOfBirth(newStudent.getPlaceOfBirth());
            student.setAddress(newStudent.getAddress());
            student.setDepName(newStudent.getDepName());
            return "redirect:/studentManager";
        }
        model.addAttribute("error", "id bị trùng");
        return "editStudent";
    }

    @GetMapping("/studentDetail/{idStudent}")
    public String studentDetailPage(@PathVariable(value = "idStudent") String idStudent, Model model) {
        Student s = studentService.getStudentById(idStudent);
        model.addAttribute("student", s);
        return "studentDetail";
    }
}
