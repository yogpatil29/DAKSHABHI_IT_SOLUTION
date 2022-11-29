<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function insert() {
		var Student = {};		
		var Student = new Object();
		Student.studentClass = $("#classId").val();
		Student.studentsName = $("#NameId").val();
		Student.studentAdd = $("#addresId").val();
		Student.studentMob = $("#mobileId").val();
		var studentJSON = JSON.stringify(Student);
		$.ajax({
			url : '/college/newAdmission',
			method : 'POST',
			contentType : 'application/json',
			data : studentJSON,
			success : function() {
				 document.getElementById("myModal").style.display="block";
				 window.location.href="/";
			},
			error : function(error) {
				alert(error);
			}
			  
		});
	}
</script>
<style type="text/css">
img{
height: 200px;
margin-left: 270px;
}

</style>
</head>
<body>
	<form class="box"  method="" name="registerValidate" >
		<h2 class="head">Student Registration</h2>
		<div class="form-row">
			<div class="form-group col-md-6" class="">
				<label>Full Name*</label> <input type="text" name="fname"
					class="form-control" id="NameId" placeholder="Enter Full name"
					onchange="validation();" onkeypress="return lettersOnly(event);">
				<span id="fnameErrorId" style="color: red; display: none;">Please
					Enter the full Name.</span>
			</div>
			<div class="form-group col-md-6">
				<label>Class*</label> <input type="text" name="department"
					class="form-control" id="classId" placeholder="Enter class"
					onchange="validation();" required> <span id="classErrorId"
					style="color: red; display: none;">Please Enter the class.</span>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label>Address*</label> <input type="text" name="add"
					class="form-control" id="addresId" placeholder="Enter Address"
					onchange="validation();"> <span id="addErrorId"
					style="color: red; display: none;">Please Enter the Address.</span>
			</div>
			<div class="form-group col-md-6">
				<label>Mobile NO*</label> <input type="text" name="mob"
					class="form-control" id="mobileId" placeholder="Enter mobile no"
					onchange="validation();"> <span id="mobErrorId"
					style="color: red; display: none;">Please Enter the Mobile
					No.</span> <span id="mobErrorMissMatch" style="color: red; display: none;">Mobile
					No Must Start with 7-9.</span><span id="mobError"
					style="color: yellow; display: none;"></span>
			</div>
		</div>


		<div align="center">
			<button type="submit" onclick="insert();" id="submitbtn" class="btn btn-success">Submit</button>
			<button type="reset" class="btn btn-primary">Reset</button>
		</div>
	</form>
 <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>  -->

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Alert</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Registered Successfully..!
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div><br>
<footer id = "footerId"><img src="/static/img4.jpg" alt="footerImg"></footer>
</body>
</html>