

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
/*            form {border: 3px solid #f1f1f1;}*/

            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            button {
                background-color: #f72c36;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }



            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <h2 style="text-align: center; margin-top: 10px;">Login</h2>

        <form action="UserServlet" method="post" style="height: 45%">
            <%if (request.getParameter("error") != null) {%>
            <div>
                <p style="color:red"><%=request.getParameter("error")%></p>
            </div> 
            <%}%>
            <div class="container">
                <label for="email"><b>Email</b></label>
                <input type="text"  placeholder="" name="email" id="email"  required>
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="" name="password"  required>
                <input type="hidden" value="login" name="command" >
                <button type="submit">Login</button>

            </div>
            <p><a href="register.jsp" style="color: blue">Đăng kí?</a></p>

        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

