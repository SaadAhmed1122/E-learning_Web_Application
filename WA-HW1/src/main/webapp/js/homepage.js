


// self executing function here
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here

    getHomepageContent();
});


function getHomepageContent() {
    var url = new URL(contextPath+'/park/overview/');
    genericGETRequest(url, createOverviewPage);
}

function createOverviewPage(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
            var jsonData = JSON.parse(req.responseText);
            var parks = jsonData['data'];


            var hpcontent = "";
            for(let i=0; i<parks.length; i++){
                hpcontent += "<h1>"+sanitize(parks[i]['name'])+"</h1>";
                hpcontent += "<p>email: "+sanitize(parks[i]['email'])+"</p>";
                hpcontent += "<p>address: "+sanitize(parks[i]['address'])+"</p>";
                for(let j=0; j<parks[i]['rides'].length; j++){
                    hpcontent += "<h3> Ride "+(j+1)+"</h3>";
                    hpcontent += "<p>ride description: "+sanitize(parks[i]['rides'][j]['description'])+"</p>";
                    hpcontent += "<p>model description: "+sanitize(parks[i]['rides'][j]['model_desc'])+"</p>";
                }

            }
            document.getElementById("homepage-content").innerHTML = hpcontent;
        }
        else {
            console.log(httpRequest.responseText);
            alert("problem processing the request");
        }
    }
}
