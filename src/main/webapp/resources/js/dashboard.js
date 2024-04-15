let openform = (e) => {
	document.getElementById('ticketId').value = e;
	$('#updateTicket').removeClass('d-none');
};
let approveTicket=()=>{
	let ticket=document.getElementById('ticketId').value;
	let comment=document.getElementById('ticketComment').value;
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			alert("ticketApproved");
		}
	};
	xhttp.open("GET", `/helpdesk/approve?val=${ticket}&comment=${comment}`, true);
	xhttp.send();
};
let rejectTicket=()=>{
	let ticket=document.getElementById('ticketId').value;
	let comment=document.getElementById('ticketComment').value;
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			alert("ticketRejected");
		}
	};
	xhttp.open("GET", `/helpdesk/reject?val=${ticket}&comment=${comment}`, true);
	xhttp.send();
};

let refresh = () => {
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("approvedCount").innerHTML = this.responseText;
		}
	};
	xhttp.open("POST", "/helpdesk/approvedTicketsCount", true);
	xhttp.send();
	let xhttp1 = new XMLHttpRequest();
	xhttp1.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("pandingCount").innerHTML = this.responseText;
		}
	};
	xhttp1.open("POST", "/helpdesk/pendingTicketsCount", true);
	xhttp1.send();
	let xhttp2 = new XMLHttpRequest();
	xhttp2.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("rejectedCount").innerHTML = this.responseText;
		}
	};
	xhttp2.open("POST", "/helpdesk/rejectedTicketsCount", true);
	xhttp2.send();

	let xhttp3 = new XMLHttpRequest();
	xhttp3.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			let data = JSON.parse(this.responseText);
			console.log(data);

			d1 = "";
			data.forEach((e) => {
				d1 += `<tr><td>${e.ticketId}</td>
						<td>${e.ticketNumber}</td>
						<td>${e.category}</td>
						<th>${e.subcategory}</th>
						<th>${e.description}</th>
						<th>${e.username}</th>
						<th>${e.stat}</th>
						<th>${e.comments}</th>
						<th><a onclick="openform('${e.ticketId}')">view</a></th>
						</tr>
							`;
			});
			$('#ticketData').html(d1);
		}
	};
	xhttp3.open("GET", "/helpdesk/dashboard/displayTickets", true);
	xhttp3.send();
}
$(document).ready(function() {
	refresh();
});