<cfinclude  template="header.cfm">
<cfoutput>
    <div class="container">
      <div class="header">
        <h1 class="fontColor">File Upload</h1>
      </div>
      <p>#variables.uploadFile#</p>
      <div class="bodySection">
        <form action="?action=upload" method="post" enctype="multipart/form-data" name="fileUpload">
            <label class="fontColor" >Choose a file to upload</label>
            <input type="file" name="excelFile" id="excelFile"><br><br>
            <input type="submit" value="Upload" id="Submit" name="btnSubmit" class="submitBtn">
        </form>
      </div>
    </div>
    <!---<table border="1">
        #variables.uploadFile#
    <table>--->
  </body>
</html> 
</cfoutput>