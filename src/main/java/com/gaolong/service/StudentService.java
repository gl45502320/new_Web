package com.gaolong.service;

import com.gaolong.entity.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {

    public List<Student> selectAll();

    public Map pageSelect(String name, int PageNum, int PageSize);

    //查一条
    public Student listOne(String id);

    //查全部
    public List<Student> studentList();


    //增
    public boolean insert(Student stu);

    //删
    public void delete(int id);

    //改
    public boolean update(Student stu);

    //多选删除
    public void deleteAll(int[] id);

    //批量添加
    public void insertMuch(List<Student> listt);
}
