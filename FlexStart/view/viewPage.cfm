
<cfinclude  template="header.cfm">

  <cfinclude  template="navbar.cfm">

  <main id="main">
    <section id="pricing" class="pricing">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
        </header>

        <div class="row gy-4" data-aos="fade-left">

        <cfoutput>
        <cfset local.pageId=url.pageId>
        
        <cfset local.demo=createObject("component","CFC/pages")>
        <cfset local.display=#local.demo.getPageDetails(local.pageId)#>
        <table class="table mb-5 pb-5">
            <thead>
                <tr>
                    <th class="col-2" scope="col" >Page Name</th>
                    <th scope="col" >Description</th>
                </tr>
            </thead>
            <tbody >
                <cfloop query="#local.display#">
                    <tr>
                        <td class="col-2">#pageName#</td>
                        <td>#Description#</td>
                    </tr>
                </cfloop> 
            </tbody>
        </table>
    </div>
    </cfoutput>
    </div>

    </section>
    <cfinclude  template="footer.cfm">
    <cfinclude  template="jsStyle.cfm">