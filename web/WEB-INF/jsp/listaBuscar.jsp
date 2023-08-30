<%-- 
    Document   : listaBuscar
    Created on : 12/03/2022, 01:09:45 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Lista Busqueda</title>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    <h4>Resultados</h4>
                    <div style="float: right">
                        <a class="btn btn-outline-light" href="altaComprador.htm">Agregar Registro</a>
                    </div>
                    <div style="float: right">
                        <a class="btn btn-outline-light" href="#">Menú</a>
                    </div>
                    <div>
                        <label>Filtro: </label>
                        &nbsp; &nbsp;
                        <input type="text" name="buscar" id="buscar" placeholder="Ingresa dato a buscar">
                        <a id="btnBuscar" class="btn btn-warning">Buscar</a>
                        
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-hover" >
                        <thead>
                            <tr>
                                <th>ID Comprador</th>
                                <th>ID Distribuidora</th>
                                <th>ID Videojuego</th>
                                <th>Nombre</th>
                                <th>A. Paterno</th>
                                <th>A. Materno</th>
                                <th>Correo</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Fecha Nacimiento</th>
                                <th>Sexo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <!--lista es variable del controlador-->
                            <c:forEach var="dato" items="${resultados}">
                                <tr>
                                    <!--dato.{codigo} entre llaves igual que en la BD-->
                                    <td>${dato.idComprador}</td>
                                    <td>${dato.idDistribuidora}</td>
                                    <td>${dato.idVideojuego}</td>
                                    <td>${dato.nombre}</td>
                                    <td>${dato.aPaterno}</td>
                                    <td>${dato.aMaterno}</td>
                                    <td>${dato.email}</td>
                                    <td>${dato.direccion}</td>
                                    <td>${dato.telefono}</td>
                                    <td>${dato.fechaNacimiento}</td>
                                    <td>${dato.sexo}</td>
                                    
                                    <td>
                                        <a href="editarComprador.htm?idComprador=${dato.idComprador}"
                                           class="btn btn-warning">Editar</a>
                                        <a href="eliminarComprador.htm?idComprador=${dato.idComprador}"
                                        class="btn btn-danger">Eliminar</a>
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            var boton = document.getElementById('btnBuscar');
            boton.addEventListener("click", () => {
                boton.href = "listaBuscar.htm?buscar=" + document.getElementById('buscar').value;
            });
        </script>
    </body>
</html>
