<%-- 
    Document   : ObtenerDatos
    Created on : 06-09-2019, 12:37:42
    Author     : Eliana Gonzalez
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios","root","");
    Statement st = conexion.createStatement();
    
    ResultSet rs = st.executeQuery("SELECT id, nombre, apellido_paterno, apellido_materno, email FROM persona");
%>
<html>
    <head>
        <title>Formulario</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <center>
        <font size="3" face="San Francisco">
        <table class="tablas" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                    <th>Email</th>
                </tr>
            </thead>
            <form action="eliminar.jsp" method="POST">
            <% while(rs.next()){%>
            
                <tr>
                    <td><% out.print(rs.getString("id")); %></td>
                    <td><% out.print(rs.getString("nombre")); %></td>
                    <td><% out.print(rs.getString("apellido_paterno")); %></td>
                    <td><% out.print(rs.getString("apellido_materno")); %></td>
                    <td><% out.print(rs.getString("email")); %></td>        
                </tr>
            <%} %>
            </form>
        </table>
         </font>
      </center>
    </body>
</html>