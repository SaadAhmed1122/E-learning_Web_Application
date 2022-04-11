// self executing function here
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here

    getRideIdsSelector();
    document.getElementById("search-button").addEventListener("click", searchMaintenances);
});
function getRideIdsSelector(){
    var url = new URL(contextPath+'/rest/list/ride/');
    genericGETRequest(url, fillMaintenanceRideSelector);
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
            console.log(JSON.parse(req.responseText));
            alert("problem processing the request");
        }
    }
}

function searchMaintenances(){
    var url = new URL(contextPath+'/maintenance/search/');
    url.searchParams.set("rideid", document.getElementById("rideid-selector").value);
    url.searchParams.set("planned", document.getElementById("planned").checked);
    url.searchParams.set("notPlanned", document.getElementById("notPlanned").checked);
    url.searchParams.set("start_date", document.getElementById("start_date").value);
    url.searchParams.set("end_date", document.getElementById("end_date").value);
    genericGETRequest(url, fillSearchArea);

}

function fillSearchArea(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
            var jsonData = JSON.parse(req.responseText);
            var data = jsonData['data'];
            var events = data['events-list']
            if (events.length==0){
                document.getElementById("selected-events").innerHTML = "No maintenance event with found.";
            } else {
                content = "<table>";
                content += "<tr><th>ride id</th><th>date</th><th>type</th><th>description</th><th>inserted by</th><th>planned</th></tr>";
                for (let i=0; i<events.length; i++){
                    content += "<tr><td>"+sanitize(events[i]["rideid"])+"</td>";
                    content += "<td>"+sanitize(events[i]["date_performed"])+"</td>";
                    content += "<td>"+sanitize(events[i]["type"])+"</td>";
                    content += "<td>"+sanitize(events[i]["description"])+"</td>";
                    content += "<td>"+sanitize(events[i]["userid"])+"</td>";
                    content += "<td>"+sanitize(events[i]["planned"])+"</td></tr>";
                }
                content += "</table>";
                document.getElementById("selected-events").innerHTML = content;

            }
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}




