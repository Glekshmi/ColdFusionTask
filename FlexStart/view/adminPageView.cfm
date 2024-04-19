<cfinclude  template="header.cfm">


  <cfinclude  template="navbar.cfm">

<div class="container-lg">
    <div class="table-responsive" id="scrollTable">
        <div class="table-wrapper">
            <cfoutput>
                <cfset local.demo=createObject("component","CFC/pages")>
                <cfset local.display=#local.demo.displayPage()#> 
                
                <div class="table-title">
                    <div class="row" id="addRow">
                        <!---<h1>#userRole# page</h1>--->
                        <cfif session.userRole === 'admin' OR session.userRole === 'editor'>
                            <div class="col-sm-4">
                                <!---<form action="addPage.cfm" method="post">
                                    <input type="submit" value="Add" name="submit" class="btn add-new">
                                </form>--->
                                <button type="button" class="btn btn-info add-new"><a href="addPage.cfm">Add New</a></button>
                            </div>
                        </cfif>
                    </div>
                </div>

                <p id="pageSuccess" style="color:green;"></p>
                <p id="pageFailed" style="color:red;"></p>

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
                                <a href="../view/addPage.cfm?idPage=#pageId#"><span class="material-symbols-outlined">edit</span></a>
                                <a href="" data-pageId="#pageId#" class="deleteId"><span class="material-symbols-outlined">delete</span></a></td>
                            </tr>
                        </cfloop>   
                    </tbody>                

            </cfif>
            </table>
        </cfoutput>


        </div>
    </div>
</div>   
 <cfinclude  template="footer.cfm">

<cfinclude  template="jsStyle.cfm">