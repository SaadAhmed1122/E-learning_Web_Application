// self executing function here
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here
    getParkNamesSelector();
    getRideIdsSelector();
    getModelNamesSelector();

});




function getParkNamesSelector(){
    var url = new URL(contextPath+'/park/list/');
    genericGETRequest(url, fillParkSelector);
}

function getRideIdsSelector(){
    var url = new URL(contextPath+'/rest/list/ride/');
    genericGETRequest(url, fillRideSelector);
}

function getModelNamesSelector(){
    var url = new URL(contextPath+'/model/list/');
    genericGETRequest(url, fillModelSelector);
}

function fillParkSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             var jsonData = JSON.parse(req.responseText);

             var data = jsonData['data'];
             console.log(data);
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