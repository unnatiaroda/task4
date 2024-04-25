
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: cambria;
        }
        body{
            background-image: linear-gradient(to top, #30cfd0 0%, #330867 100%);
            width: 100%;
            height: 100%;
            min-height: 100vh;
        }
        .container{
            width: fit-content;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: auto;
        }
        h1{
            text-align: center;
            color: white;
            margin: 0.8em;
        }
        a{
            text-decoration: none;
            background-color: #330867eb;
            color: white;
            padding: 0.7em;
            border-radius: 8px;
            font-size: larger;
            width: fit-content;
            font-weight: bold;
        }
    </style>
    <body>
        <div class="container">
            <h1>Oops! An error occured.</h1>
            <p><%=exception%></p>
            <a href='index.html'>Go back</a>
        </div>
    </body>
</html>
