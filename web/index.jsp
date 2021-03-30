<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Persona"%>
<%
    if (session.getAttribute("listaper")== null)
    {
        ArrayList<Persona> la =new ArrayList<Persona>();
        session.setAttribute("listaper", la);   
    }
    ArrayList<Persona> lista = (ArrayList<Persona>)session.getAttribute("listaper");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-10">
                    <h1 class="text-center">Listado de personas</h1>
                    <a class="btn btn-info" href="MainServlet?op=nuevo">Nuevo registro</a>
                    <table class="table">
                        <tr>
                            <th>Id</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Edad</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                        <%
                            if(lista !=null)
                            {
                                for(Persona item : lista)
                                {

                        %>
                        <tr>
                            <td><%= item.getId() %></td>
                            <td><%= item.getNombres() %></td>
                            <td><%= item.getApellidos() %></td>
                            <td><%= item.getEdad() %></td>
                            <td><a class="btn btn-success" href="MainServlet?op=editar&id=<%=item.getId() %>">Editar</a></td>
                            <td><a class="btn btn-danger" href="MainServlet?op=eliminar&id=<%=item.getId() %>" onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a></td>
                        </tr>

                        <%
                                }
                            }
                        %>
                    </table>
                </div>
            </div> 
        </div>        
    </body>
</html>
