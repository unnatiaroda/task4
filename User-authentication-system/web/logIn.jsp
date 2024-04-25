
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@page errorPage="errorPage.jsp" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
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
            margin: 0.8em;
        }
    </style>
    <body>
        <%
            String uname = request.getParameter("uname").toLowerCase();
            String upass = request.getParameter("upass").trim();
                    
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","root");
            PreparedStatement pstmt = con.prepareStatement("select * from usertable where uname=?");
            pstmt.setString(1,uname);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                String userPass = rs.getString("upass");
                out.println(upass);
                out.println(userPass);
                if (BCrypt.checkpw(upass, userPass)){
                %>
                    <jsp:forward page="main.jsp"/>
                <%
                }else{
                %>
                    <div class='container'>
                        <h1>Wrong password, please try again.</h1>
                        <a href='logIn.html'>Go back</a>
                    </div>
                <%
                }
            }else{
            %>
                <div class='container'>
                    <h1>No such user exists. Please register first.</h1>
                    <a href='logIn.html'>Go back</a>
                    <a href='register.html'>Register</a>
                </div>
            <%
            }
        %>
    </body>
</html>
