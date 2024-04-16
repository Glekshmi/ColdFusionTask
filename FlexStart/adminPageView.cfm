<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>FlexStart Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/icon.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    color: #404E67;
    background: #F5F7FA;
    font-family: 'Open Sans', sans-serif;
}
#addRow{
    position: relative;
    left: 70%;
}
.table-wrapper {
    width: 700px;
    margin: 30px auto;
    background: #fff;
    padding: 20px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
    background:#007bff;
}
.tableHeader{
    color:#007bff;
}
.table-title .add-new i {
    margin-right: 4px;
}
table.table {
    table-layout: fixed;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 100px;
}
#scrollTable{
    overflow-x:hidden;
    margin-top: 86px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #f50000;
}
table.table td .add {
    display: none;
}
</style>

</head>
<body>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/32IpIkbEsT3uW.png!f305cw" alt="">
        <span>Wisdom Web</span>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="adminHome.cfm">Home</a></li>
          <!---<li><a class="nav-link scrollto" href="adminHome.cfm">Back</a></li>--->
          <li><a class="nav-link scrollto" href="controls/pages.cfc?method=logout">Logout</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
<div class="container-lg">
    <div class="table-responsive" id="scrollTable">
        <div class="table-wrapper">
            <cfoutput>
                <cfset local.demo=createObject("component","controls/pages")>
                <cfset local.display=#local.demo.displayPage()#> 
                
                <div class="table-title">
                    <div class="row" id="addRow">
                        <!---<h1>#userRole# page</h1>--->
                        <cfif session.userRole === 'admin' OR session.userRole === 'editor'>
                            <div class="col-sm-4">
                                <form action="addPage.cfm?" method="post">
                                    <input type="submit" value="Add" name="submit" class="btn add-new">
                                </form>
                                <!---<button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>--->
                            </div>
                        </cfif>
                    </div>
                </div>

                <table class="table table-bordered">
                <cfif session.userRole === 'user'>
                <thead>
                    <tr>
                        <!---<th>PageID</th>--->
                        <th>PageName</th>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="#local.display#">
                        <tr>
                            <!---<td>#pageId#</td>--->
                            <td><a href="userViewPage.cfm?idPage=#pageId#">#pageName#</a></td>
                            
                        </tr>
                    </cfloop>   
                </tbody>

            <cfelse>
                    <thead>
                        <tr>
                            <!---<th class="tableHeader">PageID</th>--->
                            <th class="tableHeader">PageName</th>
                            <th class="tableHeader">PageDescription</th>
                            <th colspan="4" class="tableHeader">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="#local.display#">
                            <tr>
                                <!---<td>#pageId#</td>--->
                                <td>#pageName#</td>
                                <td>#Description#</td>
                                <td colspan="4">
                                <a href="addPage.cfm?idPage=#pageId#"><span class="material-symbols-outlined">edit</span></a>
                                <a href="controls/pages.cfc?method=deleteRow&idPage=#pageId#"><span class="material-symbols-outlined">delete</span></a></td>
                            </tr>
                        </cfloop>   
                    </tbody>                

            </cfif>
            </table>
        </cfoutput>


        </div>
    </div>
</div>   

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>