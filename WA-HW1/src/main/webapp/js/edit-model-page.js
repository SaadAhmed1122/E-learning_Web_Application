// self executing function here
document.addEventListener('DOMContentLoaded', function(event) {
    // your page initialization code here
    // the DOM will be available here
    document.getElementById("delete-button").addEventListener('click', deleteModel);
    console.log(document.getElementById("delete-button"));
});


function deleteModel (){
    var url = new URL(contextPath+"/model/delete/");
    url.searchParams.set('original_name', document.getElementById('original_name').value);

    var httpRequest = new XMLHttpRequest();


    if (!httpRequest) {
      alert('Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = function(){deletedModel(httpRequest)};
    httpRequest.open('DELETE', url);
    httpRequest.send();

}

function deletedModel(req){
    if (req.readyState === XMLHttpRequest.DONE) {
        if (req.status == 200) {
             alert("Model deleted correctly.");
             // Simulate a mouse click:
             window.location.href = (contextPath+"/jsp/homepage.jsp");
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}