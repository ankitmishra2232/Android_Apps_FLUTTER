var wbook = SpreadsheetApp.openByUrl('https://docs.google.com/spreadsheets/d/1ShJpYShjL0AwSwgaxjg-IdWAFYm4D53sMOABPMYqmz0/edit#gid=0');

var sheet =wbook.getSheetByName("Sheet1")

function doPost(e){
  var action = e.parameter.action;

  if(action == "addUser"){
    return addUser(e);
  }

}

function addUser(e){
  var user = JSON.parse(e.postData.contents);
  sheet.appendRow([user.name,user.email,user.mobile,user.date,user.address,user.pin,user.genders]);

  return ContentService.createTextOutput("Success").setMimeType(ContentService.MimeType.TEXT);
}


function doGet(e){
  var action = e.parameter.action;
  if(action == "getUsers"){
    return getUsers(e);
  }
}

function getUsers(e){
  var rows = sheet.getRange(2,1,sheet.getLastRow()-1,sheet.getLastColumn()-1).getValues();

  var data =[];

  for(var i=0;i<rows.length;i++){
    var row = rows[i];
    var record = {};

    record["Name"]= row[0];
    record["email"]=row[1];
    record["mobile"]=row[2];
    record["date"]=row[3];
    record["address"]=row[4];
    record["pin"]=row[5];
    record["genders"]=row[6];
    data.push(record);
  }

  var result = JSON.stringify(data);
  return ContentService.createTextOutput(result).setMimeType(ContentService.MimeType.JSON);

}

























