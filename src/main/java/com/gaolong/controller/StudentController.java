package com.gaolong.controller;


import com.gaolong.DTO.StudentDTO;
import com.gaolong.entity.Student;
import com.gaolong.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("/selectAll")
    public String selectAll(Map map) {
        List<Student> list = studentService.selectAll();
        for (Student li : list) {
            System.out.println(li);
        }
        map.put("list", list);
        // return "forward:/main.jsp";
        return "forward:/show.jsp";

    }


    @RequestMapping("/pageStudent")
    public @ResponseBody
    Map pageStudent(String name, int page, int rows) {

        System.out.println("page--->" + page);
        System.out.println("rows--->" + rows);
        return studentService.pageSelect(name, page, rows);

    }


    //添加信息
    @RequestMapping("/insertStudent")
    public @ResponseBody
    boolean insertStudent(Student student) {
        //System.out.println("student....."+student);

        return studentService.insert(student);
    }

    //删除信息
    @RequestMapping("/delete")
    public String delete(int id) {
        studentService.delete(id);
        return "redirect:/select.long";
    }

    //查询一条信息
    @RequestMapping("/selectOne")
    public @ResponseBody
    Map selectOne(String id) {
        Map map = new HashMap();
        Student student = studentService.listOne(id);
        System.out.println("student......" + student);
        map.put("student", student);
        return map;
    }

    //修改信息
    @RequestMapping("/update")
    public @ResponseBody
    boolean update(Student students) {
        Map map = new HashMap();
        System.out.println("students--->" + students);

        return studentService.update(students);
    }

    //批量删除
    @RequestMapping("/deleteAll")
    public String deleteAll(int[] id) {
        studentService.deleteAll(id);
        return "redirect:/select.long";
    }

    //批量添加
    @RequestMapping("/much")
    public String insertMuch(StudentDTO dto) {
        List<Student> list = dto.getLists();
        studentService.insertMuch(list);
        return "redirect:/select.long";
    }


}
