// self executing function here

var deviceTypes ="";
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here

    var url = new URLSearchParams(window.location.search);
    getDeviceTypes();
    getRideInformationAndFillForm(url.get('rideid'));
    document.getElementById('edit-ride-button').addEventListener('click', function(){
        updateRide(url.get('rideid'))
        });
    document.getElementById('delete-ride-button').addEventListener('click', function(){
        deleteRide(url.get('rideid'))
        });

});

function getRideInformationAndFillForm(rideid){
    var url = new URL(contextPath+'/rest/ride/'+rideid+'/');
    genericGETRequest(url, fillFormRide);
}


function updateRide(rideid){
    var url = new URL(contextPath+'/rest/ride/'+rideid+'/');


}

function deleteRide(rideid){
    var url = new URL(contextPath+'/rest/ride/'+rideid+'/');
    var httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = function (){ deletedRide(httpRequest)};

    httpRequest.open('DELETE', url);
    httpRequest.send();
}


function deletedRide(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             alert("ride deleted correctly");
             window.location.href = (contextPath+"/jsp/homepage.jsp");
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function fillFormRide(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
            var jsonData = JSON.parse(req.responseText);
            console.log(jsonData["description"]);
            document.getElementById("description").value = jsonData["description"];
            setPreselectedPark(jsonData['parkid']);
            setPreselectedModel(jsonData['modelid']);
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function setPreselectedPark(parkid){
    var url = new URL(contextPath+'/park/list/');
    var httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = function (){ fillParkSelectorWithPreselected(httpRequest, parkid)};

    httpRequest.open('GET', url);
    httpRequest.send();
}

function setPreselectedModel(modelid){
    var url = new URL(contextPath+'/model/list/');
    var httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = function (){ fillModelSelectorWithPreselected(httpRequest, modelid)};

    httpRequest.open('GET', url);
    httpRequest.send();
}

function fillParkSelectorWithPreselected(req, parkId){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             var jsonData = JSON.parse(req.responseText);

             var data = jsonData['data'];
             console.log(data);
             var parksNames = data['park-names-list']

             for (let i=0; i<parksNames.length; i++) {
                parkName = sanitize(parksNames[i]);
                if (parkid = parkName){
                    document.getElementById("park-selector").innerHTML += "<option value='"+parkName+"' selected='true'>"+parkName+"</option>";
                }else{
                    document.getElementById("park-selector").innerHTML += "<option value='"+parkName+"'>"+parkName+"</option>";
                }
             }

        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function fillModelSelectorWithPreselected(req, modelid){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             var jsonData = JSON.parse(req.responseText);

             var data = jsonData['data'];
             var modelNames = data['model-names-list'];
             for (let i=0; i<modelNames.length; i++) {
                modelName = sanitize(modelNames[i]);
                if (modelName == modelid){
                    document.getElementById("model-selector").innerHTML += "<option value='"+modelName+"' selected='true'>"+modelName+"</option>";
                } else {
                    document.getElementById("model-selector").innerHTML += "<option value='"+modelName+"'>"+modelName+"</option>";
                }
             }
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

