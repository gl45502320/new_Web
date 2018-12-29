package com.gaolong.dao;

import com.gaolong.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentDao {

    //调用jar工具分页查询
    public List<Student> pageSelect(@Param("name") String name);

    public List<Student> selectAll();


    //查一条
    public Student listOne(String id);

    //查全部
    public List<Student> studentList();

    public List<Student> stuPage(@Param("name") String name, @Param("page") int page, @Param("rows") int rows);

    public int countStudent(@Param("name") String name);

    //增
    public void insert(Student stu);

    //删
    public void delete(int id);

    //改
    public void update(Student stu);

    //多选删除
    public void deleteAll(int[] id);

    //批量添加
    public void insertMuch(List<Student> listt);


}
