package com.Boot.serviceimpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import com.Boot.model.StudentInfo;
import com.Boot.repository.StudentRepository;
import com.Boot.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentRepository repository;

	@Override
	public List<StudentInfo> getAllStudent() {
		List<StudentInfo> students = new ArrayList<StudentInfo>();
		repository.findAll().forEach(students1 -> students.add(students1));
		return students;
	}
	/*
	 * @Override public List<StudentInfo> getAllStudent(int pageNumber, int
	 * pageSize) { // int pageSize = 5; //int pageNumber = ; // Pageable paging =
	 * PageRequest.of(pageNumber, pageSize, Sort.by(Sort.Direction.ASC, "id"));
	 * Page<StudentInfo> pageList = this.repository.findAll(paging);
	 * List<StudentInfo> students = pageList.getContent();
	 * 
	 * return students; }
	 */

	@Override
	public StudentInfo getStudentsById(int id) {

		return repository.findById(id).get();
	}

	@Override
	public void Insert(StudentInfo student) {
		repository.saveAndFlush(student);
	}

	@Override
	public String delete(int id) {
		repository.deleteById(id);
		return "Deleted Successfully";
	}

	@Override
	public StudentInfo updateStudent(StudentInfo student, int id) {
		StudentInfo updateById = repository.findById(id).get();
		updateById.setStudentsName(student.getStudentsName());
		updateById.setStudentClass(student.getStudentClass());
		updateById.setStudentAdd(student.getStudentAdd());
		updateById.setStudentMob(student.getStudentMob());
		return repository.saveAndFlush(updateById);
	}

	@Override
	public List<StudentInfo> searchStudent(String name) {

		List<StudentInfo> student = repository.searchStudentSQL(name);
		return student;
	}

	@Override
	public void InsertProp(String name) {
		repository.saveAndFlush(name);

	}

	//public final String UPLOAD_DIR = "C:\\Users\\yoges\\Documents\\workspace-spring-tool-suite-4-4.16.1.RELEASE\\Spring-Boot-Project\\src\\main\\resources\\static\\images";
	public final String UPLOAD_DIR = new ClassPathResource("static/images/").getFile().getAbsolutePath();
	public StudentServiceImpl()throws IOException {
			
	}
	@Override
	public boolean uploadFile(MultipartFile file) {

		boolean flag = false;
		try {
			Files.copy(file.getInputStream(), Paths.get(UPLOAD_DIR + "\\" + file.getOriginalFilename()),
					StandardCopyOption.REPLACE_EXISTING);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	/*
	 * @Override public StudentInfo updateName(StudentInfo student, int id) {
	 * StudentInfo updateById = repository.findById(id).get();
	 * updateById.setStudentsName(student.getStudentsName()); return
	 * repository.saveAndFlush(updateById); }
	 * 
	 * @Override public StudentInfo updateClass(StudentInfo student, int id) {
	 * StudentInfo updateById = repository.findById(id).get();
	 * updateById.setStudentClass(student.getStudentClass()); return
	 * repository.saveAndFlush(updateById); }
	 * 
	 * @Override public StudentInfo updateAdd(StudentInfo student, int id) {
	 * StudentInfo updateById = repository.findById(id).get();
	 * updateById.setStudentAdd(student.getStudentAdd()); return
	 * repository.saveAndFlush(updateById); }
	 * 
	 * @Override public String updateMob(StudentInfo student, int id) { String msg =
	 * "Mobile No Updated"; StudentInfo updateById = repository.findById(id).get();
	 * if (Objects.nonNull(student.getStudentMob()) &&
	 * !"".equalsIgnoreCase(student.getStudentMob())) {
	 * 
	 * updateById.setStudentMob(student.getStudentMob()); //
	 * System.out.println("Mobile no updated"); repository.saveAndFlush(updateById);
	 * return msg; }
	 * 
	 * return "Required "; }
	 */
}