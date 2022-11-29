package com.Boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.Boot.model.StudentInfo;
import com.Boot.serviceimpl.StudentServiceImpl;

public interface StudentService {

	List<StudentInfo> getAllStudent();

	StudentInfo getStudentsById(int id);

	String delete(int id);

	void Insert(StudentInfo student);

	StudentInfo updateStudent(StudentInfo student, int id);

	List<StudentInfo> searchStudent(String name);

	void InsertProp(String name);

	public boolean uploadFile(MultipartFile file);

	// List<StudentInfo> getAllStudent(int pageNumber, int pageSize);

	// void InsertApp(String name);

	/*
	 * StudentInfo updateName(StudentInfo student, int id);
	 * 
	 * StudentInfo updateClass(StudentInfo student, int id);
	 * 
	 * StudentInfo updateAdd(StudentInfo student, int id);
	 * 
	 * String updateMob(StudentInfo student, int id);
	 */
}
