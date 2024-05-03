<cfscript>

variables.uploadFile ='';
if(structKeyExists(form,"btnSubmit")){
    variables.objUpload = createObject("component", "controllers/upload");
    variables.uploadFile = variables.objUpload.validateUploadFile(form.excelFile); 
   writeDump(variables.uploadFile)abort;
}
</cfscript>

