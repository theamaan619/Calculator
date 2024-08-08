<%-- 
    Document   : index
    Created on : 26-Jul-2024, 8:19:31 am
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Hello, world!</title>
    </head>
    <body>
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="text-center">Pookie</h4>
                            <h1 class="text-center">Calculator</h1>
                        </div>
                        <div class="card-body">
                            <form >
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter the first Number</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="num1" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Enter the second Number</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="num2">
                                </div>
                                Operation:
                                <select class="form-select mt-2" aria-label="Default select example" name="operation">
                                    <option selected>Select the Operation you want to Perform</option>
                                    <option value="+">Addition (+)</option>
                                    <option value="-">Subtraction (-)</option>
                                    <option value="*">Multiplication (*)</option>
                                    <option value="/">Division (/)</option>
                                </select>

                                <div class="row mt-3">

                                    <button type="submit" class="btn btn-success col-md-5">Submit</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="submit" class="btn btn-danger col-md-5 ml-3">Reset</button> 
                                </div>
                            </form>
                            <%!
                                Double result = 0.0;
                                String num1Str = "00";
                                String num2Str = "00";
                                String operation = "0";
                            %>
                            <%
                                // Retrieve parameters
                                num1Str = request.getParameter("num1");
                                num2Str = request.getParameter("num2");
                                operation = request.getParameter("operation");

                                if (num1Str != null && num2Str != null && operation != null) {
                                    try {
                                        // Convert strings to integers
                                        Double num1 = Double.parseDouble(num1Str);
                                        Double num2 = Double.parseDouble(num2Str);

                                        String message = "";

                                        // Perform the selected operation
                                        switch (operation) {
                                            case "+":
                                                result = num1 + num2;

                                                break;
                                            case "-":
                                                result = num1 - num2;

                                                break;
                                            case "*":
                                                result = num1 * num2;

                                                break;
                                            case "/":
                                                if (num2 != 0) {
                                                    result = num1 / num2;

                                                } else {
                                                    message = "Error: Division by zero";
                                                    out.println(message);
                                                }
                                                break;
                                            default:
                                                message = "Invalid operation";
                                                break;
                                        }

                                    } catch (NumberFormatException e) {
                                        out.print("<h2>Error: Invalid number format</h2>");
                                    }
                                }

                            %>

                        </div>
                        <div class="card-footer"> <h1 class="text-center"><%=num1Str + " " + operation + " " + num2Str + " = " + result%></h1> </div>
                    </div>
                </div>
            </div>
        </div>














        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>
</html>
