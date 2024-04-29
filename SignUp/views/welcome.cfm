<cfoutput>
    <style>
        body{font-family:monospace;}
        .greyBg{background:lightgray;padding:20px;border-radius:7px;}
        .content{width:100%;text-align:left;font-size:30px;}
        .content td{text-align:left;font-size:30px;}
        .row{margin-bottom:20px;}
        .text{font-size:20px;}
    </style>
    <h1>Basic MVC</h1>
    <h5>version 1.0</h5>

    <div>
        <div align="" class="text" >
          <pre>  This is a view page. </pre>
        </div>
    </div>

    <div class="greyBg row">
        <div class="content" align="">
            <pre>
            This custom MVC framework is designed simply to understand the concept of
            Model-View-Controller.
            </pre>
        </div>
    </div>

    <div class="greyBg row" align="">
        <div class="text" align="">
            <pre>
            You can access pages via ?action={actionname}
            
            Adding new action
            -----------------
                Creating a new action or view page. 
                Lets say 'contacts'.
                So our url will be http://127.0.0.1:8500/project/index.cfm?action=contacts
                Register new action 'contacts' in index.cfm. See below:

                <i>case "contacts":
                    include "/controllers/contactsAction.cfm";
                    include "/views/contacts.cfm";
                break;</i>
           </pre>
        </div>
    </div>
</cfoutput>