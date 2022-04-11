function getDeviceTypes(){
    var url = new URL(contextPath+'/schema/devicetypes/');
    genericGETRequest(url, saveDeviceTypes);
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
        }
        else {
            console.log(req.responseText);
            alert("problem processing the request");
        }
    }
}