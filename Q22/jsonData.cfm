<!DOCTYPE html>
<html>
<head>
    <title>JSON to Table</title>
    <!--<style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>-->
    <link rel="stylesheet" href="./style/page.css">
</head>
<body>

    <h2>JSON to Table</h2>
    <cfinvoke component="component/jsonData" method="jsonToTable" returnVariable="jsonData"></cfinvoke>

    <table>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Location</th>
        </tr>
        <!-- Iterate over the data array and display rows -->
        <cfloop array="#jsonData#" index="record">
            <tr>
                <td><cfoutput>#record.Name#</cfoutput></td>
                <td><cfoutput>#record.Age#</cfoutput></td>
                <td><cfoutput>#record.LOCATION#</cfoutput></td>
            </tr>
        </cfloop>
    </table>
    
</body>
</html>
