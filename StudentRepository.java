package com.Boot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Boot.model.StudentInfo;

public interface StudentRepository extends JpaRepository<StudentInfo, Integer> {

	@Query(nativeQuery = true, value = "SELECT * FROM student_info AS s WHERE " + "s.students_name LIKE CONCAT('',:query, '%')"
			+ "Or s.student_class LIKE CONCAT('', :query, '%')" + "Or s.student_add LIKE CONCAT('', :query, '%')")
	List<StudentInfo> searchStudentSQL(String query);

	void saveAndFlush(String name);
}
