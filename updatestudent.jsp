<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
#head{
align-items: center;
margin-left: 400px;
margin-top: 40px;
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">

	<form class="box"  name="registerValidate">
		<h2 id="head">Update Details</h2>

		<div class="form-row">
			<label>ID*</label> <input type="text" class="form-control"
				id="studentId" readonly="readonly">
			<div class="form-group col-md-6" class="">
				<label>Full Name*</label> <input type="text" name="fname"
					class="form-control" id="nameId" > <span
					id="fnameErrorId" style="color: red; display: none;">Please
					Enter the full Name.</span>
			</div>
			<div class="form-group col-md-6">
				<label>Class*</label> <input type="text" name="department"
					class="form-control" id="classId" onchange="validation();" required>
				<span id="classErrorId" style="color: red; display: none;">Please
					Enter the class.</span>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label>Address*</label> <input type="text" name="add"
					class="form-control" id="addresId" onchange="validation();">
				<span id="addErrorId" style="color: red; display: none;">Please
					Enter the Address.</span>
			</div>
			<div class="form-group col-md-6">
				<label>Mobile NO*</label> <input type="text" name="mob"
					class="form-control" id="mobileId" onchange="validation();">
				<span id="mobErrorId" style="color: red; display: none;">Please
					Enter the Mobile No.</span> <span id="mobErrorMissMatch"
					style="color: red; display: none;">Mobile No Must Start with
					7-9.</span><span id="mobError" style="color: yellow; display: none;"></span>
			</div>
		</div>


		<div align="center">
			<button type="submit"
				onclick="updateData();"
				id="submitbtn" class="btn btn-success">Submit</button>
			<button type="reset" class="btn btn-primary">Reset</button>
		</div>
	</form>
</div>
	<script>
		$(document).ready(
				function() {
					var params = new window.URLSearchParams(
							window.location.search);
					var id = (params.get('up'));
					$.ajax({
						url : "/college/getstudent/" + id,
						method : "GET",
						contentType : "application/json",
						dataType : 'json',
						cache : false,
						success : function(data) {
							$('#studentId').val(data.id), $('#nameId').val(data.studentsName), $('#classId').val(
							data.studentClass), $('#addresId').val(data.studentAdd), $('#mobileId').val(data.studentMob)
						},
					});
				});

		function updateData() {
			var params = new window.URLSearchParams(
					window.location.search);
			var id = (params.get('up'));
			var settings = {
					  "url": "/college/updateStudent/"+id,
					  "method": "PUT",
					  "timeout": 0,
					  "headers": {
					    "Content-Type": "application/json",
					    "Cookie": "JSESSIONID=C9DA426B66D12D104C4391C388A8BDDF"
					  },
					  "data": JSON.stringify({
					    "studentsName": $("#nameId").val(),
					    "studentClass": $("#classId").val(),
					    "studentAdd": $("#addresId").val(),
					    "studentMob": $("#mobileId").val(),
					  }),
					};

					$.ajax(settings).done(function (response) {
						window.location.href= "/view/index.jsp";
					  
					});
			
			
			/* var Student = {};
			var Student = new Object();
			Student.studentClass = $("#classId").val();
			Student.studentsName = $("#nameId").val();
			Student.studentAdd = $("#addresId").val();
			Student.studentMob = $("#mobileId").val();
			var studentJSON = JSON.stringify(Student); 
			 $.ajax({
				url: "/college/updateStudent/"+id,
				  method: "PUT",
				  ContentType: "application/json",
				  data : studentJSON,
				success : function(){
					 alert("Update successfully..."); 
					window.location.href = '/view/index.jsp';
				}	
				
			});  */

		}
	</script>

</body>
</html>