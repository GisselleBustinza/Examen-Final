<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Rol"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Rol</title>
        <link href="../CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Listado de Roles</h1>
            <a class="btn btn-success"  href="Controladora?f_accion=agregarrol01">Agregar Rol</a>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">N</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        RolDAO rolDAO = new RolDAO();
                        List<Rol> roles = rolDAO.listarol();
                        Iterator<Rol> iterator = roles.iterator();
                        Rol rol = null;
                        while (iterator.hasNext()) {
                            rol = iterator.next();

                    %>
                    <tr>
                        <td class="text-center"><% out.print(rol.getIdrol()); %></td>
                        <td><% out.print(rol.getNombre()); %></td>
                        <td class="text-center"><% out.print(rol.getEstado()); %></td>                        
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controladora?f_accion=editarrol01&f_idrol=<% out.print(rol.getIdrol()); %>">Editar</a>
                            <a class="btn btn-danger" href="Controladora?f_accion=eliminarrol&f_idrol=<% out.print(rol.getIdrol()); %>">Eliminar</a>
                        </td>
                    </tr>
                    
                    <% 
                        }
                    %>
                </tbody>
                <tr align ='center' >
                            <td class="btn-info" colspan="9" ><a href="index.html"><input type="button" value="SALIR" name="f_salir" /></a></td>   
                        </tr>
            </table>

        </div>
    </body>
</html>

