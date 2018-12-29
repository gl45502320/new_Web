package com.gaolong.service.impl;

import com.gaolong.dao.StudentDao;
import com.gaolong.entity.Student;
import com.gaolong.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {


    @Autowired
    private StudentDao studentDao;

    @Override
    public List<Student> selectAll() {
        List<Student> list = studentDao.selectAll();
        for (Student student : list) {
            System.out.println(student);
        }
        return list;
    }

    @Override
    public Map pageSelect(String name, int PageNum, int PageSize) {

        Map map = new HashMap();
        PageHelper.startPage(PageNum, PageSize);
        String names = null;
        if (name != null) {
            names = "%" + name + "%";
        }

        List<Student> list = studentDao.pageSelect(names);
        PageInfo<Student> studentPageInfont = new PageInfo<>(list);
        map.put("rows", list);
        map.put("total", studentPageInfont.getTotal());


        //map.put("list",studentDao.pageSelect(names));
        // map.put("studentPageInfont",studentPageInfont);

        return map;
    }


    @Override
    public Student listOne(String id) {

        return studentDao.listOne(id);
    }

    @Override
    public List<Student> studentList() {
        return studentDao.studentList();
    }

    @Override
    public boolean insert(Student stu) {
        try {
            Long date = new Date().getTime();
            stu.setId("" + date);
            studentDao.insert(stu);
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void delete(int id) {
        studentDao.delete(id);
    }

    @Override
    public boolean update(Student stu) {
        try {
            studentDao.update(stu);
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void deleteAll(int[] id) {
        studentDao.deleteAll(id);
    }

    @Override
    public void insertMuch(List<Student> listt) {

        if (listt.size() != 0) {
            for (Student student : listt) {
                Long date = new Date().getTime();
                student.setId("" + date);
            }
        }
        studentDao.insertMuch(listt);
    }
}
