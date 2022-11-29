//---------validation for character input--------- 
function lettersOnly() {
	var charCode = event.keyCode;
	if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)
		|| charCode == 8)
		return true;
	else {
		//alert("Enter only albhabets...!")
		return false;
	}
}
//--------validation for registration form ----------
function validation() {
	var pattern = /^[7-9]{1}[0-9]{9}$/;
	var mobi = $('#registerMobile').val()
	var result = pattern.test(mobi);

	if ($('#registerName').val() == '' && $('#registerName').val().length == 0) {
		$('#fnameErrorId').css('display', 'block');
		return false;
	} else {
		$('#fnameErrorId').css('display', 'none');
	}
	if ($('#registerClass').val() == '' && $('#registerClass').val().length == 0) {

		$('#classErrorId').css('display', 'block');
		return false;
	} else {
		$('#classErrorId').css('display', 'none');
	}
	if ($('#registerAddress').val() == '' && $('#registerAddress').val().length == 0) {

		$('#addErrorId').css('display', 'block');
		return false;
	} else {
		$('#addErrorId').css('display', 'none');
	}
	if ($('#registerMobile').val() == '' && $('#registerMobile').val().length == 0) {

		$('#mobErrorId').css('display', 'block');
		return false;
	} else if (result == false) {
		$('#mobErrorId').css('display', 'none');
		$('#mobErrorMissMatch').css('display', 'block');
		return false;
	}
	else {
		$('#mobErrorId').css('display', 'none');
		$('#mobErrorMissMatch').css('display', 'none');
		return true;
	}
}
//--------validation for update form ---------------
function updateValidation() {
	var pattern = /^[7-9]{1}[0-9]{9}$/;
	var mobi = $('#mobileId').val()
	var result = pattern.test(mobi);

	if ($('#nameId').val() == '' && $('#nameId').val().length == 0) {
		$('#fullNameErrorId').css('display', 'block');
		return false;
	} else {
		$('#fullNameErrorId').css('display', 'none');
	}
	if ($('#classId').val() == '' && $('#classId').val().length == 0) {

		$('#classError').css('display', 'block');
		return false;
	} else {
		$('#classError').css('display', 'none');
	}
	if ($('#addresId').val() == '' && $('#addresId').val().length == 0) {

		$('#addError').css('display', 'block');
		return false;
	} else {
		$('#addError').css('display', 'none');
	}
	if ($('#mobileId').val() == '' && $('#mobileId').val().length == 0) {

		$('#mobError').css('display', 'block');
		return false;
	} else if (result == false) {
		$('#mobNoMissMatch').css('display', 'none');
		$('#mobNoMissMatch').css('display', 'block');
		return false;
	}
	else {
		$('#mobError').css('display', 'none');
		$('#mobNoMissMatch').css('display', 'none');
	}
	return true;
}
//function toAlert() {
//alert(" Registered Successfully...!")
//}

//----------Get All Data on pageload--------
$(document).ready(function() {

	getData();

});

function getData() {
	$.ajax({

		url: "/college/getAllData",
		type: "GET",
		contentType: "application/json",
		dataType: 'json',
		cache: false,
		success: function(data) {
			var responce = data;

			const listElements = document.getElementById('Details');
			const paginationElement = document.getElementById('pagination');

			let currentPage = 2;
			let rows = 5;

			function DisplayList(items, wrapper, rows_per_page, page) {
				wrapper.innerHTML = "";
				page--;

				let Start = rows_per_page * page;
				let end = Start + rows_per_page;
				let paginaedItems = items.slice(Start, end);
				//	var data = JSON.stringify(paginaedItems);
				console.log(paginaedItems);

				$.each(paginaedItems, function(k, v) {
					var row = $('<tr><td>' + paginaedItems[k].id + '</td><td>'
						+ paginaedItems[k].studentsName + '</td><td>'
						+ paginaedItems[k].studentClass + '</td><td>'
						+ paginaedItems[k].studentAdd + '</td><td>'
						+ paginaedItems[k].studentMob + '</td><td>'/*<iframe src="/images/Screenshot (82).png"> </iframe</td><td>'
				 +  '<a  class="btn btn-info" href="/view/updatestudent.jsp?up='
				+ data[k].id+ '">Edit</a>' */
						+ '<a onclick="updatePop(' + data[k].id
						+ ')" class="btn btn-info " >Edit</a>' + '</td><td>'
						+ '<a  class="btn btn-danger " onclick="deletePop('
						+ data[k].id + ')">Delete</a>'
						/* + '<a  class="btn btn-danger" onclick="deleteStudent('
						+ data[k].id
						+ ');">Delete</a>' */
						+ '</td></tr>');
					$('#Details').append(row);

				});
				/*for (let i = 0; i < data.length; i++) {
					
					let item = data[i];
					let itemElement = document.createElement('div');
					itemElement.classList.add('item');
					itemElement.innerText = item;
					wrapper.appendChild(itemElement);
		
				}*/
			}

			function setupPagination(items, wrapper, rows_per_page) {
				wrapper.innerHTML = "";

				let page_count = Math.ceil(items.length / rows_per_page);
				for (let i = 1; i < page_count + 1; i++) {
					let btn = PaginationButton(i, items);
					wrapper.appendChild(btn);
				}
			}

			function PaginationButton(page, items) {
				let button = document.createElement('button');
				button.innerText = page;
				if (currentPage == page) button.classList.add('active');
				button.addEventListener('click', function() {
					currentPage = page;
					DisplayList(items, listElements, rows, currentPage);
					let current_btn = document.querySelector('.pagenumbers button.active');
					current_btn.classList.remove('active');
					button.classList.add('active');
				});
				return button;
			}

			DisplayList(responce, listElements, rows, currentPage);
			setupPagination(responce, paginationElement, rows);
		}
	});
}
/*
		$("#pagination button").each(function(e) {
			if (e != 0)
				$(this).hide();
		});
		
		$("#next").click(function() {
			if ($("#pagination button:visible").next().length != 0)
				$("#pagination button:visible").next().show().prev().hide();
			else {
				$("#pagination button:visible").hide();
				$("#pagination button:first").show();
			}
			return false;
		});

		$("#prev").click(function() {
			if ($("#pagination button:visible").prev().length != 0)
				$("#pagination button:visible").prev().show().next().hide();
			else {
				$("#pagination button:visible").hide();
				$("#pagination button:last").show();
			}
			return false;
		});
	}*/



//----------pagination ajax-----------
/*
function pagination() {
	//var pageSize = $("#searchField").val();
	var pageNumber = $("#page2").val();
	var pageNumber = $("#page3").val();
	$.ajax({
		url: "/college/getAllData?pageNumber=" + pageNumber,
		type: "GET",
		contentType: "application/json",
		dataType: 'json',
		cache: false,
		success: function(data) {
			$('#Details').html("");
			$.each(data, function(k, v) {
				var row = $('<tr><td>' + data[k].id + '</td><td>'
					+ data[k].studentsName + '</td><td>'
					+ data[k].studentClass + '</td><td>'
					+ data[k].studentAdd + '</td><td>'
					+ data[k].studentMob + '</td><td>'
					+ '<a onclick="updatePop(' + data[k].id
					+ ')" class="btn btn-info " >Edit</a>' + '</td><td>'
					+ '<a  class="btn btn-danger " onclick="deletePop('
					+ data[k].id + ')">Delete</a>'
					+ '</td></tr>');
				$('#Details').append(row);
			});
		}
	});
}*/
//--------Delete directly row -------------
function deleteStudent(id) {
	$.ajax({
		url: "/college/studentDelete/" + id,
		method: "DELETE",
		timeout: 0,
		contentType: "application/json",
		success: (function(response) {
			location.reload(true);
		})
	});
}
//---------Delete using Popup----------
function deletePop(id) {
	window.value = id;
	$("#deletePop").animate({
		height: 'toggle'
	}, "slow");
	document.getElementById('deletePop').style.display = 'block';
}

//---------- for search and get data----------
function search() {
	var input = $("#search_box").val();

	var settings = {
		"url": "/college/search?query=" + input,
		"method": "GET",
		"timeout": 0,
	};

	$
		.ajax(settings)
		.done(
			function(data) {
				$("#Details").html("");
				$
					.each(
						data,
						function(k, v) {
							var row = $('<tr><td>' + data[k].id + '</td><td>'
								+ data[k].studentsName + '</td><td>'
								+ data[k].studentClass + '</td><td>'
								+ data[k].studentAdd + '</td><td>'
								+ data[k].studentMob + '</td><td>'
								/* +  '<a  class="btn btn-info" href="/view/updatestudent.jsp?up='
								+ data[k].id+ '">Edit</a>' */
								+ '<a onclick="updatePop(' + data[k].id
								+ ')" class="btn btn-info" >Edit</a>' + '</td><td>'
								+ '<a  class="btn btn-danger" onclick="deletePop('
								+ data[k].id + ')">Delete</a>'
								/* + '<a  class="btn btn-danger" onclick="deleteStudent('
								+ data[k].id
								+ ');">Delete</a>' */
								+ '</td></tr>');
							$('#Details').append(row);
						});
				window.stop();
			});

}
//----------Get Data for Edit---------------
function updatePop(id) {
	window.value = id;
	$.ajax({
		url: "/college/getstudent/" + id,
		method: "GET",
		contentType: "application/json",
		dataType: 'json',
		cache: false,
		success: function(data) {
			document.getElementById("updateModel").style.display = "block";
			$('#studentId').val(data.id), $('#nameId').val(
				data.studentsName), $('#classId').val(
					data.studentClass), $('#addresId').val(
						data.studentAdd), $('#mobileId').val(
							data.studentMob)
		},
	});
}
//---------------- update Edit data---------------
function updateData(id) {
	if (updateValidation()) {
		var settings = {
			"url": "/college/updateStudent/" + id,
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

		$.ajax(settings).done(function(response) {
			document.getElementById("successful").style.display = "block";
			window.location.href = "/view/index.jsp";
		});
	} else {
		updateValidation();
	}
}
//---------------for Insert New Registration------------
function insert() {

	if (validation()) {
		var Student = {};
		var Student = new Object();
		Student.studentsName = $("#registerName").val();
		Student.studentClass = $("#registerClass").val();
		Student.studentAdd = $("#registerAddress").val();
		Student.studentMob = $("#registerMobile").val();
		var studentJSON = JSON.stringify(Student);
		//var form = new FormData();
		//form.append("profile", $('#document')[0].files[0]);
		$.ajax({
			url: '/college/newAdmission',
			method: 'POST',
			contentType: 'application/json',
			data: studentJSON,
			success: function(responce) {
document.getElementById('registerForm').style.display = 'none';
				//window.stop();
				if (responce == "success") {
					
					document.getElementById('successful').style.display = 'block';
					setTimeout("#successful", 2000);
					window.location.href = "/view/index.jsp";
				} else {
					document.getElementById('registerForm').style.display = 'block';
				}
			},
			error: function(error) {
				alert(error);
			}
		});

	} else {
		validation();
	}
}
function success() {

	document.getElementById("successful").style.display = "block";
}
//---------------- for upload image in project folder--------
function uploadfile() {

	var form = new FormData();
	form.append("profile", $('#document')[0].files[0]);
	var settings = {
		"url": "/college/uploadfile",
		"method": "POST",
		"timeout": 0,
		"processData": false,
		"mimeType": "multipart/form-data",
		"contentType": false,
		"data": form
	};

	$.ajax(settings).done(function(response) {
		$('#filesuccess').css('display', 'block');
		//$("#image").attr('src', 'data:image/png;base64,' + base64Encode(response));	
		console.log(response);
	});
}
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#profile').attr('src', e.target.result).width(80).height(100);
			$('#profile').css('display', 'block');
		};
		reader.readAsDataURL(input.files[0]);
	}
}
/*
function upload() {

	var form = new FormData();
	form.append("profile", $('#document')[0].files[0]);
	var settings = {
		"url": "/college/uploadfile",
		"method": "POST",
		"timeout": 0,
		"processData": false,
		"mimeType": "multipart/form-data",
		"contentType": false,
		"data": form
	};

	$.ajax(settings).done(function(response) {
		$('#filesuccess').css('display', 'block');
		console.log(response);
	});
}*/