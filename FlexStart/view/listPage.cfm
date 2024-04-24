<cfinclude  template="header.cfm">
<cfinclude  template="navbar.cfm">
<cfif NOT session.userLoggedIn>
    <cflocation  url="../view/newLogin.cfm">
</cfif>
<cfset local.qryPageDetails=createObject("component","CFC/pages").getPageDetails()>
<div class="container-lg">
    <div class="table-responsive" id="scrollTable">
        <div class="table-wrapper">
            <cfoutput>
                <div class="table-title">
                    <div class="row" id="addRow">
                       
                        <cfif session.userRole === 'admin' OR session.userRole === 'editor'>
                            <div class="col-sm-4">
                                <button type="button" class="btn btn-info add-new"><a href="editPage.cfm" id="addNewBtn">Add New</a></button>
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
                            <th>PageName</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop query="#local.qryPageDetails#">
                            <tr>
                                <td><a href="viewPage.cfm?pageId=#local.qryPageDetails.pageId#">#local.qryPageDetails.pageName#</a></td>
                            </tr>
                        </cfloop>   
                    </tbody>

                <cfelse>
                        <thead>
                            <tr>
                                <th class="tableHeader">PageName</th>
                                <th class="tableHeader">PageDescription</th>
                                <th colspan="4" class="tableHeader">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfloop query="#local.qryPageDetails#">
                                <tr>
                                    <td>#local.qryPageDetails.pageName#</td>
                                    <td>#local.qryPageDetails.Description#</td>
                                    <td colspan="4">
                                    <a href="../view/editPage.cfm?pageId=#local.qryPageDetails.pageId#"><span class="material-symbols-outlined">edit</span></a>
                                    <a href="" data-pageId="#local.qryPageDetails.pageId#" class="deleteId"><span class="material-symbols-outlined">delete</span></a></td>
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