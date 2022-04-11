

// self executing function here
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here

    getUsersList();
    document.getElementById("select_user").addEventListener("click", showSelectedUser);
});


function getUsersList() {

    var url = new URL(contextPath+'/user/protected/userlist/');
    genericGETRequest(url, createListSelector);
}

function createListSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status === 200) {
             var jsonData = JSON.parse(req.responseText);
             var emails = jsonData['emails_list'];

             for (let i=0; i<emails.length; i++) {
                email = sanitize(emails[i]);
                currHtml =  document.getElementById("user_selector").innerHTML;
                document.getElementById("user_selector").innerHTML = currHtml+"<option value='"+email+"'>"+email+"</option>"
             }

        }
        else {
            alert("problem processing the request");
        }
    }
}




function showSelectedUser(){

    var url = new URL(contextPath+'/user/protected/email/');

    var sel = document.getElementById("user_selector");
    var selected_user = sel.options[sel.selectedIndex].value;
    url.searchParams.set('email', selected_user);

    genericGETRequest(url, fillUserData);

}

function fillUserData(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status === 200) {
             var jsonData = JSON.parse(req.responseText);
             var user = jsonData['data'];


             var email = sanitize(user['email']);
             var first_name = sanitize(user['first_name']);
             var last_name = sanitize(user['last_name']);
             var role = sanitize(user['role']);

            var userTable = "<table>";
             userTable = userTable + "<tr><th>Email</th><td>"+email+"</td></tr>";
             userTable = userTable + "<tr><th>First name</th><td>"+first_name+"</td></tr>";
             userTable = userTable + "<tr><th>Last name</th><td>"+last_name+"</td></tr>";
             userTable = userTable + "<tr><th>Role</th><td>"+role+"</td></tr>";
             userTable = userTable + "</table>";
             document.getElementById("user-info").innerHTML = userTable;


             updateForm = "<form>";
             updateForm = updateForm + "<label for='first_name'>first name: </label>";
             updateForm = updateForm + "<input type='hidden' id='email' value='"+email+"'/>";
             updateForm = updateForm + "<input name='first_name' id='first_name' value='"+first_name+"' type='text'/><br/><br/>";
             updateForm = updateForm + "<label for='last_name'>last name: </label>";
             updateForm = updateForm + "<input name='last_name' id='last_name' value='"+last_name+"' type='text'/><br/><br/>";
             updateForm = updateForm + "role: <select name='role' id='role_selector'></select><br/>";
             updateForm = updateForm + "<button type='button' id='update'>Update</button>";
             updateForm = updateForm + "<button type='button' id='delete'>Delete</button><br/>";
             document.getElementById("user-update").innerHTML = updateForm;

             document.getElementById("update").addEventListener("click", updateUser);
             document.getElementById("delete").addEventListener("click", deleteUser);

             getRoles();

        }
        else {
            console.log(JSON.parse(req.responseText));
            alert("Problem processing the request");
        }
    }
}


function getRoles(){

    var url = new URL(contextPath+'/schema/roles/');
    genericGETRequest(url, fillRolesSelector);

}

function fillRolesSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status === 200) {
             var jsonData = JSON.parse(req.responseText);
             var roles = jsonData['data'];
             for (let i=0; i<roles.length; i++) {
                role = sanitize(roles[i]);
                document.getElementById("role_selector").innerHTML += "<option value='"+role+"'>"+role+"</option>";

             }

        }
        else {
            console.log(JSON.parse(req.responseText));
            alert("problem processing the request");
        }
    }
}


function deleteUser(){

    var url = new URL(contextPath+'/user/protected/email/');

    url.searchParams.set('email', document.getElementById('email').value);


    httpRequest = new XMLHttpRequest();


    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = deletedUser;
    httpRequest.open('DELETE', url);
    httpRequest.send();
}

function updateUser(){

    console.log("updating user");


    var url = new URL(contextPath+"/user/protected/update/");

    var role_selector = document.getElementById("role_selector");
    var role = role_selector.options[role_selector.selectedIndex].value;

    url.searchParams.set('operation', 'update');
    url.searchParams.set('email', document.getElementById('email').value);
    url.searchParams.set('first_name', document.getElementById('first_name').value);
    url.searchParams.set('last_name', document.getElementById('last_name').value);
    url.searchParams.set('role', role);

    httpRequest = new XMLHttpRequest();


    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = updatedUser;
    httpRequest.open('POST', url);
    httpRequest.send();

}


function updatedUser(){
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
        if (httpRequest.status === 200) {
             alert("user updated correctly");
             location.reload();
        }
        else {
            console.log(JSON.parse(httpRequest.responseText));
            alert("problem processing the request");
        }
    }
}


function deletedUser(){
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
        if (httpRequest.status === 200) {
             alert("user deleted correctly");
             location.reload();
        }
        else {
            console.log(JSON.parse(httpRequest.responseText));
            alert("problem processing the request");
        }
    }
}