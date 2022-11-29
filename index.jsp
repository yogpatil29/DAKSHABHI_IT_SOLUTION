<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src=" /javascript/index.js"></script>

</head>
<body>


	<h2 align="center">Students Data</h2>

	<section>
		<div>
			<form class="form-inline" id="serching">


				<input class="form-control mr-sm-2" type="text" id="search_box"
					placeholder="Search here">
				<button class="btn btn-success" onclick="search();">Search</button>
			</form>
			<!-- <div>
		 		<a href="/view/Register.jsp" type="button"><button
				class="btn btn-success" id="sbtn" >New Registration</button></a>
				</div> -->
			<button class="btn btn-success" id="sbtn"
				onclick="document.getElementById('registerForm').style.display = 'block';">New
				Registration</button>

		</div>
	</section>
	<div class="container-fluid">
		<!-- <div class="table-wrapper-scroll-y my-custom-scrollbar "> -->
		<table class="table table-hover">
			<thead class="table-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">NAME</th>
					<th scope="col">Class</th>
					<th scope="col">Address</th>
					<th scope="col">Mobile No</th>
					<!-- <th scope="col">Photo</th> -->
					<th scope="col" class=column colspan="2">Actions</th>
				</tr>
			</thead>
			<tbody id="Details">
			</tbody>
		</table>
		<!-- 	 <div>
				<ul class="pagination justify-content-end">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<li value="0" id="page1" class="page-item"><a
						class="page-link" href="pagination()">1</a></li>
					<li value="1" id="page2" class="page-item"><button class="page-item"
							onclick="pagination();">2</button></li>
					<li value="2" id="page3" class="page-item"><button class="page-item"
							onclick="pagination();">3</button></li>
					<li value="3" id="page4" class="page-item"><a
						class="page-link" href="pagination()">Next</a></li>
				</ul>
			</div> -->
		<!-- </div> -->



		<!-- <div class="pages">
			<span class="badge rounded-pill badge-dark">1</span> <span
				class="badge rounded-pill badge-dark">2</span> <span
				class="badge rounded-pill badge-dark">3</span> <span
				class="badge rounded-pill badge-dark">4</span> <span
				class="badge rounded-pill badge-dark">5</span> <span
				class="badge rounded-pill badge-dark">6</span>
		</div> -->
	</div>
	<div class="prenext">
		
		<div id="pagination" class="pagenumbers">
		
		</div>
		<!-- <button id="prev">prev</button>
		<button id="next">next</button> -->
	</div>
	<!-- The Modal for the Delete Data -->
	<div id="deletePop" class="modal">
		<span
			onclick="document.getElementById('deletePop').style.display='none'"
			class="close" title="Close Modal">×</span>
		<div class="modal-dialog">
			<div class="border-box">
				<div class="modal-content">
					<div class="container">
						<div class="dpara">
							<h1>Delete Account</h1>
							<p>Are you sure you want to delete your account?</p>

							<div class="clearfix">
								<button type="button"
									onclick="document.getElementById('deletePop').style.display='none'"
									class="btn btn-primary">Cancel</button>
								<button type="button" id="deleteBtn"
									onclick="deleteStudent(window.value);" class="btn btn-danger">Delete</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- The Modal for the Edit Data -->
	<div class="modal" id="updateModel">
		<div class="modal-dialog">
			<div class="border-box">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h3 class="modal-title">Update Details</h3>
						<span
							onclick="document.getElementById('updateModel').style.display='none'"
							class="close" title="Close Modal">×</span>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<form class="box" method="post">
							<div class="form-row">
								<strong>ID*</strong> <input type="text" class="form-control"
									id="studentId" readonly="readonly">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6" class="">
									<strong>Full Name*</strong> <input type="text" name="fname"
										class="form-control" id="nameId"
										onkeyup="return lettersOnly(event);"
										onchange=" updateValidation();"> <span
										id="fullNameErrorId" style="color: red; display: none;">Please
										Enter the full Name.</span>
								</div>

								<div class="form-group col-md-6">
									<strong>Class*</strong> <input type="text" name="department"
										class="form-control" onchange=" updateValidation();"
										id="classId" required> <span id="classError"
										style="color: red; display: none;">Please Enter the
										class.</span>
								</div>

							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<strong>Address*</strong> <input type="text" name="add"
										class="form-control" onchange=" updateValidation();"
										id="addresId"> <span id="addError"
										style="color: red; display: none;">Please Enter the
										Address.</span>
								</div>
								<div class="form-group col-md-6">
									<strong>Mobile NO*</strong> <input type="number" name="mob"
										class="form-control" onchange=" updateValidation();"
										id="mobileId"> <span id="mobError"
										style="color: red; display: none;">Please Enter the
										Mobile No.</span> <span id="mobNoMissMatch"
										style="color: red; display: none;">Mobile No Must Start
										with 7-9.</span>
								</div>
							</div>
							<div class="model-footer" align="center">
								<button type="submit" onclick="updateData(window.value);"
									id="submitbtn" class="btn btn-success">Submit</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal"
									onclick="document.getElementById('updateModel').style.display='none'">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- The Modal for the Register Form -->
	<div class="modal" id="registerForm">
		<div class="modal-dialog">
			<div class="border-box">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h3 class="modal-title">Student Registration</h3>
						<span
							onclick="document.getElementById('registerForm').style.display='none'"
							class="close" title="Close Modal">×</span>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<div class="container">
							<form class="box" method="post" name="registerValidate">
								<div class="form-row">
									<div class="form-group col-md-6" class="">
										<strong>Full Name*</strong> <input type="text" name="fname"
											class="form-control" id="registerName"
											onkeypress="return lettersOnly(event);"
											placeholder="Enter Full name" onchange="validation();">
										<!-- onkeypress="return lettersOnly(event);" -->
										<span id="fnameErrorId" style="color: red; display: none;">Please
											Enter the full Name.</span>
									</div>
									<div class="form-group col-md-6">
										<strong>Class*</strong> <input type="text" name="department"
											class="form-control" id="registerClass"
											placeholder="Enter class" onchange="validation();" required>
										<span id="classErrorId" style="color: red; display: none;">Please
											Enter the class.</span>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<strong>Address*</strong> <input type="text" name="add"
											class="form-control" id="registerAddress"
											placeholder="Enter Address" onchange="validation();">
										<span id="addErrorId" style="color: red; display: none;">Please
											Enter the Address.</span>
									</div>
									<div class="form-group col-md-6">
										<strong>Mobile NO*</strong> <input type="number" name="mob"
											class="form-control" id="registerMobile"
											placeholder="Enter mobile no"
											onchange=" return validation();"> <span
											id="mobErrorId" style="color: red; display: none;">Please
											Enter the Mobile No.</span> <span id="mobErrorMissMatch"
											style="color: red; display: none;">Mobile No Must
											Start with 7-9.</span>
									</div>
								</div>

								<div class="form-row">
									<div class="form-group ">
										<input type="file" id="document" onchange="readURL(this);"
											accept="image/png, image/jpeg "> <span
											id="filesuccess" style="color: red; display: none;">image
											uploaded...!</span>
									</div>
									<div class="form-group ">
										<!-- <a <p class=image></p>></a> -->
										<img id="profile" alt="profile photo" src="#	"
											style="display: none;">
									</div>
								</div>
								<input type="button" class="btn btn-primary" value="Upload"
									onclick="uploadfile();">
								<div align="center">
									<button type="submit" onclick="insert();" id="submitrebtn"
										class="btn btn-success" >Submit</button>
									<button type="reset" class="btn btn-primary">Reset</button>
								</div>
							</form>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							onclick="document.getElementById('registerForm').style.display='none'">Close</button>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- The Modal for the Successful registration  -->
	<div class="modal" id="successful">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						onclick="document.getElementById('successful').style.display='none'">×</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">Registered Successfully..!</div>
				<div>
					<img alt="tickGif" src="/view/photos/tickmarkright.gif">
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="document.getElementById('successful').style.display='none'">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>