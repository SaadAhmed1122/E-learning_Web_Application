// self executing function here
var deviceTypes ="";
var deviceNumber = 0;
var devicesList = [];
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here
    getParkNamesSelector();
    getModelNamesSelector();
    getDeviceTypes();
    document.getElementById("add-device").addEventListener("click", addDeviceForm);
    document.getElementById("insert").addEventListener("click", function(){insertRideAndDevices(devicesList)});
});




function getParkNamesSelector(){
    var url = new URL(contextPath+'/park/list/');
    genericGETRequest(url, fillParkSelector);
}

function getRideIdsSelector(){
    var url = new URL(contextPath+'rest/ride/list/');
    genericGETRequest(url, fillRideSelector);
}

function getModelNamesSelector(){
    var url = new URL(contextPath+'/model/list/');
    genericGETRequest(url, fillModelSelector);
}

function getDeviceTypes(){
    var url = new URL(contextPath+'/schema/devicetypes/');
    genericGETRequest(url, saveDeviceTypes);
}

function fillParkSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             var jsonData = JSON.parse(req.responseText);

             var data = jsonData['data'];
             var parksNames = data['park-names-list']

             for (let i=0; i<parksNames.length; i++) {
                parkName = sanitize(parksNames[i]);
                document.getElementById("park-selector").innerHTML += "<option value='"+parkName+"'>"+parkName+"</option>";

             }

        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}


function fillRideSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             var jsonData = JSON.parse(req.responseText);

             var data = jsonData['data'];
             var rideIds = data['ride-ids-list']
             for (let i=0; i<rideIds.length; i++) {
                rideId = sanitize(rideIds[i]);
                document.getElementById("ride-selector").innerHTML += "<option value='"+rideId+"'>"+rideId+"</option>";
             }
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function fillModelSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             var jsonData = JSON.parse(req.responseText);

             var data = jsonData['data'];
             var modelNames = data['model-names-list'];
             for (let i=0; i<modelNames.length; i++) {
                modelName = sanitize(modelNames[i]);
                document.getElementById("model-selector").innerHTML += "<option value='"+modelName+"'>"+modelName+"</option>";
             }
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function saveDeviceTypes(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
            var jsonData = JSON.parse(req.responseText);
            var devicetypesreceived = jsonData['data'];
            for (let i=0; i<devicetypesreceived.length; i++) {
                devicetypereceived = sanitize(devicetypesreceived[i]);
                deviceTypes += "<option value='"+devicetypereceived+"'>"+devicetypereceived+"</option>";
            }
            console.log(deviceTypes);
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function addDeviceForm(){
    devicesArea = document.getElementById("device-list");
    g = document.createElement('div');
    g.setAttribute("id", "device"+deviceNumber);
    g.innerHTML = "<input type='hidden' name='deviceFieldNumber' value='"+deviceNumber+"'/>"+
    "<label for='name"+deviceNumber+"'>Name:</label>" +
    "<input type='text' id='name"+deviceNumber+"'></input>" +
    "<label for='description"+deviceNumber+"'> Description: </label>"+
    "<textarea name='description"+deviceNumber+"' id='description"+deviceNumber+"'></textarea>"+
    " Type: <select name='type"+deviceNumber+"' id='type-selector-"+deviceNumber+"'>"+deviceTypes+"</select> "+
    "<button type='button' id='remove"+deviceNumber+"'>Remove</button>";
    devicesArea.appendChild(g);
    devicesList.push(deviceNumber);
    document.getElementById("remove"+deviceNumber).addEventListener("click", function(event){removeDeviceForm(event)});
    deviceNumber += 1;
}

function removeDeviceForm(e){
    e = e || window.event;
    var target = e.target || e.srcElement;
    var deviceFieldNumber = target.parentElement.querySelector('input[name="deviceFieldNumber"]');
    var toBeRemoved = deviceFieldNumber.value;
    console.log(toBeRemoved);
    for( var i = 0; i < devicesList.length; i++){

        if ( devicesList[i] == toBeRemoved) {
            devicesList.splice(i, 1);
        }
    }

    target.parentElement.remove();
}


function insertRideAndDevices(devicesList){

    //get ride attributes in a JSON
    var ride = new Object();
    ride.description = document.getElementById("description").value;
    ride.parkid = document.getElementById("park-selector").value;
    ride.modelid = document.getElementById("model-selector").value;
    var devices = [];
    var device;
    for(let i=0; i<devicesList.length; i++){
        device = new Object();
        console.log("name"+devicesList[i]);
        device.name = document.getElementById("name"+devicesList[i]).value;
        device.description = document.getElementById("description"+devicesList[i]).value;
        device.type = document.getElementById("type-selector-"+devicesList[i]).value;
        devices.push(device);
    }
    devicesList = new Object()["devices-list"] = devices;


    var url = new URL(contextPath+"/rest/ride/")

    var httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = function (){ rideInsertionResult(httpRequest, devicesList)};

    httpRequest.open('POST', url);
    httpRequest.send(JSON.stringify(ride));
}

function rideInsertionResult(req, devicesList){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status === 200) {
            var jsonData = JSON.parse(req.responseText);
            var data = jsonData['data'];
            var newRideId = data['rideid'];
            insertDevices(devicesList, newRideId);
        }
        else {
            console.log(req.status);
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function insertDevices(devicesList,newRideId){
    var url = new URL(contextPath+"/rest/device/ride/"+newRideId+"/")

    var httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = function (){ insertionDone(httpRequest)};
    for(let i=0; i<devicesList['devices-list'].length; i++){
        devicesList['devices-list'][i].rideid=newRideId;
    }

    httpRequest.open('POST', url);
    console.log(JSON.stringify(devicesList));
    httpRequest.send(JSON.stringify(devicesList));
}

function insertionDone(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
            alert("ride and devices inserted correctly");
            window.location.href = (contextPath+"/jsp/homepage.jsp");
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}