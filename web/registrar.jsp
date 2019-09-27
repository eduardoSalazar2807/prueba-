<%-- 
    Document   : registrar
    Created on : 06-09-2019, 11:27:05
    Author     : Eliana Gonzalez
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
 String nombre = request.getParameter("nombre");
    String apellido_paterno = request.getParameter("apellido_paterno");
    String apellido_materno = request.getParameter("apellido_materno");
    String email = request.getParameter("email");
    String descripcion= request.getParameter("message");
    String check1= request.getParameter("gender1");
    String check2= request.getParameter("gender2");
    String box= request.getParameter("ciudades");;
    ResultSet rs;
    String city[] = new String[2];
    int sex = 0;
    if(check1.equals("femenino")){
        sex=1;
    }else{
        if(check2.equals("masculino")){
            sex=2;
        }
    }
  int x = 0;  
   if(box.equals("1")){
       city[0]="Santiago";
       x=0;
    }else{
        if(box.equals("2")){
             city[0]="La Serena";
             x=1;
        }else{
         if(box.equals("3")){
              city[0]="Rancagua";
              x=2;
         }
        }
    }
 try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/taller","root","");
        Statement st = conexion.createStatement();
        
        String SQL1=("INSERT INTO persona(id_sexo,nombre,apellido_paterno,apellido_materno,email) "
                + "VALUES ('"+sex+"','"+nombre+"','"+apellido_paterno+"','"+apellido_materno+"','"+email+"')");
         int i = st.executeUpdate(SQL1);
         
        String SQLSEL=("SELECT id_persona FROM persona WHERE email='"+email+"'");
        rs = st.executeQuery(SQLSEL);
        String id = rs.getString(1);
        rs.close();
        
        String SQL3 =("INSERT INTO direccion(id_persona,descripcion,ciudad) VALUES('"+id+"','"+descripcion+"','"+city[x]+"')");
        int a = st.executeUpdate(SQL3);
        

    }catch(ClassNotFoundException | SQLException e){
        System.out.println("E R R O R ");
        System.out.println(e);
        e.printStackTrace();
    } 
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
         <center>
          <h1><font face="San Francisco">Guardado Correctamente</font></h1>
          
         <script>
            function goBack() {
             window.history.back()
            }
        </script>
        <button id="buttonback" onclick="goBack()"><font face="San Francisco" size="3">Volver</font></button>
      </center>    
    </body>
</html>
