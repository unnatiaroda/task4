
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@page errorPage="errorPage.jsp" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
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
        h1,h2{
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
        <%
            String uname = request.getParameter("uname").toLowerCase();
            String upass = request.getParameter("upass");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","root");
            PreparedStatement pstmt=con.prepareStatement("select * from usertable where uname=?");
            pstmt.setString(1,uname);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
            %>
                <div class='container'>
                    <h1>User with this username already exists.</h1>
                    <h2>Try again with different username.</h2>
                    <a href='index.html'>Go back</a>
                </div>
            <%
            }
            else{
                String hashedupass = BCrypt.hashpw(upass, BCrypt.gensalt());
                PreparedStatement stmt = con.prepareStatement("insert into usertable values (?,?)");
                stmt.setString(1,uname);
                stmt.setString(2,hashedupass);
                int i = stmt.executeUpdate();
                if(i == 0){
                %>
                    <h1>Registration failed</h1>
                <%
                }else{
                    %>
                        <div class="container">
                            <h1>User registered successfully.</h1>
                            <a href="logIn.html">Log In</a>
                        </div>
                    <%
                }
            }
        %>
    </body>
</html>
