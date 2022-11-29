package com.Boot.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.lang.NonNull;

@Entity
@Table(name = "StudentInfo")
public class StudentInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String studentsName;
	private String studentClass;
	private String studentAdd;
	private String studentMob;
	private Blob studentProfile;
	public StudentInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudentInfo(int id, String studentsName, String studentClass, String studentAdd, String studentMob,
			Blob studentProfile) {
		super();
		this.id = id;
		this.studentsName = studentsName;
		this.studentClass = studentClass;
		this.studentAdd = studentAdd;
		this.studentMob = studentMob;
		this.studentProfile = studentProfile;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudentsName() {
		return studentsName;
	}
	public void setStudentsName(String studentsName) {
		this.studentsName = studentsName;
	}
	public String getStudentClass() {
		return studentClass;
	}
	public void setStudentClass(String studentClass) {
		this.studentClass = studentClass;
	}
	public String getStudentAdd() {
		return studentAdd;
	}
	public void setStudentAdd(String studentAdd) {
		this.studentAdd = studentAdd;
	}
	public String getStudentMob() {
		return studentMob;
	}
	public void setStudentMob(String studentMob) {
		this.studentMob = studentMob;
	}
	public Blob getStudentProfile() {
		return studentProfile;
	}
	public void setStudentProfile(Blob studentProfile) {
		this.studentProfile = studentProfile;
	}
	@Override
	public String toString() {
		return "StudentInfo [id=" + id + ", studentsName=" + studentsName + ", studentClass=" + studentClass
				+ ", studentAdd=" + studentAdd + ", studentMob=" + studentMob + ", studentProfile=" + studentProfile
				+ "]";
	}
	
}
