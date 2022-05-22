package com.example.cdwgiuaky2.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Student {
    private String id;
    private String name;
    private boolean male;
    private Calendar birthday;
    private String placeOfBirth;
    private String address;
    private String depName;

    public Student(String id, String name, boolean male, Calendar birthday, String placeOfBirth, String address, String depName) {
        this.id = id;
        this.name = name;
        this.male = male;
        this.birthday = birthday;
        this.placeOfBirth = placeOfBirth;
        this.address = address;
        this.depName = depName;
    }

    public Student() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isMale() {
        return male;
    }

    public void setMale(boolean male) {
        this.male = male;
    }

    public String getBirthday() {
        SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
        return this.birthday != null ? format1.format(this.birthday.getTime()) : "";
    }

    public void setBirthday(String birthday) throws ParseException {
        if (birthday != null && !birthday.equals("")) {
            SimpleDateFormat curFormater = new SimpleDateFormat("dd/MM/yyyy");
            Date dateObj = curFormater.parse(birthday);
            this.birthday = Calendar.getInstance();
            this.birthday.setTime(dateObj);
        }
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

//    @Override
//    public String toString() {
//        SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
//        return "Student{" +
//                "id='" + id + '\'' +
//                ", name='" + name + '\'' +
//                ", male=" + male +
//                ", birthday=" + format1.format(birthday.getTime()) +
//                ", placeOfBirth='" + placeOfBirth + '\'' +
//                ", address='" + address + '\'' +
//                ", depName='" + depName + '\'' +
//                '}';
//    }
}
