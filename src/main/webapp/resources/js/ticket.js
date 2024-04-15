$(document).ready(function() {
	let selectedCategory = document.getElementById('department').value;

	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("subcategory").innerHTML = this.responseText;
		}
	};
	xhttp.open("POST", "/helpdesk/loadSubCat", true);
	xhttp.setRequestHeader("Content-Type", "application/json");
	let requestBody = {
		category: selectedCategory
	};
	xhttp.send(JSON.stringify(requestBody));
	$('#department').on('change', () => {
		let selectedCategory = document.getElementById('department').value;
		let xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				
				document.getElementById("subcategory").innerHTML = this.responseText;
			
			}
		};
		xhttp.open("POST", "/helpdesk/loadSubCat", true);
		xhttp.setRequestHeader("Content-Type", "application/json");
		let requestBody = {
			category: selectedCategory
		};
		xhttp.send(JSON.stringify(requestBody));
	})
});