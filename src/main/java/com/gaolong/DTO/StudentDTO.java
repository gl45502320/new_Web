package com.gaolong.DTO;


import com.gaolong.entity.Student;

import java.util.List;

public class StudentDTO {

    private List<Student> lists;

    public StudentDTO() {
        super();
    }

    public StudentDTO(List<Student> lists) {
        super();
        this.lists = lists;
    }

    public List<Student> getLists() {
        return lists;
    }

    public void setLists(List<Student> lists) {
        this.lists = lists;
    }

    @Override
    public String toString() {
        return "StudentDTO [lists=" + lists + "]";
    }

}
