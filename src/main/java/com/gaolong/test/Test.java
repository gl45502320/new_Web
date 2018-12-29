package com.gaolong.test;

import com.gaolong.dao.StudentDao;
import com.gaolong.entity.Student;
import com.gaolong.service.StudentService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class Test {

    public static void main(String[] args) {

        ApplicationContext context = new ClassPathXmlApplicationContext("spring.xml");

        StudentDao studentDao = (StudentDao) context.getBean("studentDao");

        StudentService studentService = (StudentService) context.getBean("studentServiceImpl");
        Map map = studentService.pageSelect(null, 2, 5);
        Set set = map.keySet();
        for (Object o : set) {
            System.out.println(o);
        }
        System.out.println(map.get("studentPageInfont"));
        List<Student> lis = (List<Student>) map.get("list");
        for (Student o : lis) {
            System.out.println("o" + o);
        }
        System.out.println(map);
        //Student student=new Student("21","21","女",17,98.0);
        //studentDao.insert(student);

        //System.out.println(studentService.selectAll());
        //System.out.println(studentDao.selectAll());
    }
}
