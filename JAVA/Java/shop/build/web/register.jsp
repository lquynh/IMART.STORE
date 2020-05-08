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
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#email").keyup(function (e) {
                    clearTimeout(x_timer);
                    var email = $(this).val();
                    x_timer = setTimeout(function () {
                        check_email_ajax(email);
                    }, 1000);
                });

                function check_email_ajax(email) {
                    $("#user-result").html('<img src="img/ajax-loader.gif" />');
                    $.post('CheckMailServlet', {'email': email}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <h2 style="text-align: center; margin-top: 10px;">Register</h2>

            <form action="UserServlet" method="post" style="height: 45%">


                <div class="container"><label for="uname"><b>Username</b></label>     
                    <input type="text" style="width:97%" placeholder="" name="username" id="username" required>
                    <label for="psw"><b>Password</b></label>
                    <input type="password" style="width:97%" placeholder="" name="pass" required>
                    <label for="email"><b>Email</b></label>
                    <input type="text" style="width:97%" placeholder="" name="email" id="email" required>
                    <span id="user-result"></span>
                    <label for="address"><b>Address</b></label>
                    <input type="text" style="width:97%" placeholder="" name="address"required>
                    <label for="phone"><b>Phone</b></label>
                    <input type="text" style="width:97%" placeholder="" name="phone"  required>
                    
                    <input type="hidden" value="insert" name="command">
                    <button type="submit">Register</button>

                </div>


            </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
