
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Secured Page</title>
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
        }
        .container{
            width: 100%;
            height: 100%;
            min-height: 100vh;
            width: fit-content;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.8em;
            margin: auto;
        }
        .container img{
            height: auto;
            max-width: 100%;
        }
    </style>
    <body>
        <div class="container">
            <h1>Welcome to our page!</h1>
            <img src="1.jfif" alt="Hello User"/>
        </div>
    </body>
</html>
