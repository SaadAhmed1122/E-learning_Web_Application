// self executing function here
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here

    getEventTypes();
    getRideIdsSelector();
    document.getElementById("insert-new-maintenance").addEventListener("click", insertMaintenance);
});

function insertMaintenance(){

    var url = new URL(contextPath+'/maintenance/insert/');

    url.searchParams.set('type', document.getElementById("event_category-selector").value);
    url.searchParams.set('description', document.getElementById('description').value);
    url.searchParams.set('rideid', document.getElementById('rideid-selector').value);
    url.searchParams.set('date_performed', document.getElementById('date_performed').value);
    url.searchParams.set('planned', document.getElementById('planned').checked);


    var httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = function (){ insertionResult(httpRequest)};

    httpRequest.open('POST', url);
    httpRequest.send();

}


function insertionResult(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
            alert("maintenance inserted correctly");
            window.location.href = (contextPath+"/html/maintainer-area/maintainer-page.html");
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}

function getEventTypes(){
    var url = new URL(contextPath+'/schema/eventcategories/');
    genericGETRequest(url, fillEventTypeSelector);
}

function getRideIdsSelector(){
    var url = new URL(contextPath+'/rest/list/ride/');
    genericGETRequest(url, fillMaintenanceRideSelector);
}


function fillEventTypeSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             var jsonData = JSON.parse(req.responseText);
             var eventcategories = jsonData['data'];
             for (let i=0; i<eventcategories.length; i++) {
                eventcategory = sanitize(eventcategories[i]);
                document.getElementById("event_category-selector").innerHTML += "<option value='"+eventcategory+"'>"+eventcategory+"</option>";

             }
        }
        else {
            console.log(JSON.parse(httpRequest.responseText));
            alert("problem processing the request");
        }
    }
}


function fillMaintenanceRideSelector(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
            var jsonData = JSON.parse(req.responseText);
            var data = jsonData['data'];
            var rideIds = data['ride-ids-list'];
            for (let i=0; i<rideIds.length; i++) {
                rideId = sanitize(rideIds[i]);
                document.getElementById("rideid-selector").innerHTML += "<option value='"+rideId+"'>"+rideId+"</option>";
            }
        }
        else {
            console.log(JSON.parse(httpRequest.responseText));
            alert("problem processing the request");
        }
    }
}


