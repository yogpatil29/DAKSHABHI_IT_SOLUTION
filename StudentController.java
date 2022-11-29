package com.Boot.controller;

import java.util.List;

import javax.servlet.Servlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.Boot.model.StudentInfo;
import com.Boot.service.StudentService;

@RestController
@RequestMapping("/college")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class StudentController {
	@Autowired
	StudentService studService;
	@Value("${cust.data.employee.name}")
	private String id;

	@PostMapping("/uploadfile")
	public ResponseEntity<String> uploadFile(@RequestParam("profile") MultipartFile image) {

		/*
		 * System.out.println(image.getOriginalFilename());
		 * System.out.println(image.getSize()); System.out.println(image.getName());
		 * System.out.println(image.getContentType());
		 */
		try {

			if (image.isEmpty()) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("must contain file");
			}
			/*
			 * if (!image.getContentType().equals("image/png")||
			 * !image.getContentType().equals("image/jpeg")) { return
			 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
			 * body("Only png files are allowed"); }
			 */

			// file upload code
			boolean result = studService.uploadFile(image);
			if (result) {
				return ResponseEntity.ok(ServletUriComponentsBuilder.fromCurrentContextPath().path("/images/").path(image.getOriginalFilename()).toUriString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("something went wrong");
	}
	/*
	 * @PostMapping("/uploadfile") public ResponseEntity<String>
	 * uploadFile(@RequestParam("profile") MultipartFile image) {
	 * 
	 * 
	 * System.out.println(image.getOriginalFilename());
	 * System.out.println(image.getSize()); System.out.println(image.getName());
	 * System.out.println(image.getContentType());
	 * 
	 * try {
	 * 
	 * if (image.isEmpty()) { return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
	 * body("must contain file"); } if (!image.getContentType().equals("image/png"))
	 * { return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
	 * body("Only png files are allowed"); }
	 * 
	 * // file upload code boolean result = studService.uploadFile(image); if
	 * (result) { return ResponseEntity.ok("png files uploaded...!"); } } catch
	 * (Exception e) { e.printStackTrace(); }
	 * 
	 * return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
	 * body("something went wrong"); }
	 */

	@GetMapping("/value")
	public String getValue() {
		return id;
	}

	// ----Get All Students data------//

	@GetMapping("/getAllData")
	public List<StudentInfo> getAllStudent() {
		return studService.getAllStudent();
	}

	/*
	 * @GetMapping("/getAllData") public List<StudentInfo> getAllStudent(
	 * 
	 * @RequestParam(value = "pageNumber", defaultValue = "0", required = false) int
	 * pageNumber,
	 * 
	 * @RequestParam(value = "pageSize", defaultValue = "5", required = false) int
	 * pageSize) { return studService.getAllStudent(pageNumber, pageSize); }
	 */
//--------get data of specific student-----------------
	@GetMapping("/getstudent/{id}")
	private StudentInfo getStudents(@PathVariable("id") int id) {
		return studService.getStudentsById(id);
	}

	@PostMapping("/newAdmission")
	private String insertDetails(@RequestBody StudentInfo student) {
		studService.Insert(student);
		return "success";
	}

	@DeleteMapping("/studentDelete/{id}")
	public String deleteStudent(@PathVariable("id") int id) {
		return studService.delete(id);
	}

	@PutMapping("/updateStudent/{id}")
	public StudentInfo updateStudent(@RequestBody StudentInfo student, @PathVariable("id") int id) {
		return studService.updateStudent(student, id);
	}

	@GetMapping("/search")
	private List<StudentInfo> getStudent(@RequestParam("query") String query) {
		return studService.searchStudent(query);
	}

	/*
	 * @PutMapping("/updateName/{id}") public StudentInfo UpdateName(@RequestBody
	 * StudentInfo student, @PathVariable("id") int id) { return
	 * studService.updateName(student, id); }
	 * 
	 * @PutMapping("/updateClass/{id}") public StudentInfo UpdateClass(@RequestBody
	 * StudentInfo student, @PathVariable("id") int id) { return
	 * studService.updateClass(student, id); }
	 * 
	 * @PutMapping("/updateAdd/{id}") public StudentInfo UpdateAdd(@RequestBody
	 * StudentInfo student, @PathVariable("id") int id) { return
	 * studService.updateAdd(student, id); }
	 * 
	 * @PutMapping("/updateMob/{id}") public String UpdateMob(@RequestBody
	 * StudentInfo student, @PathVariable("id") int id) { return
	 * studService.updateMob(student, id); }
	 */

}
