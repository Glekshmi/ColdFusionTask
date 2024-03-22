<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="./style/page.css">
</head>
<body>
    <div class="container">
        <div>
            <h1>Description Page</h1>

            <cfoutput>
                <p><h3 class="pageName">#url.pageName#</h3></p>
                <p class="desc"><b>#url.desc#</b></p>
            </cfoutput>
        </div>
        <div>
            <button><a href="login.cfm">Home</a></button>
        </div>
    </div>
</body>
</html>