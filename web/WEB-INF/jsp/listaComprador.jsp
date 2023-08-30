<%-- 
    Document   : listaComprador
    Created on : 10/03/2022, 07:54:55 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <style>
            .qr-code {
              max-width: 100px;
            }
            body {
                background-image: url("https://170en81rlrm1a6dxv47yvydg-wpengine.netdna-ssl.com/wp-content/uploads/2019/04/Buyer-Persona-Example.jpg");
                background-size: 60%
            }
        </style>
        <title>Lista de Compradores</title>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    <h4>Lista general</h4>
                    <div style="float: right">
                        <a class="btn btn-outline-light" href="altaComprador.htm">Agregar Registro</a>
                    </div>
                    <div style="float: right; padding-right:8px">
                        <a class="btn btn-outline-light" href="index.htm">Menú</a>
                    </div>
                    <div>
                        <label>Filtro: </label>
                        &nbsp; &nbsp;
                        <input  type="text" id="buscar" placeholder="Buscar">
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover text-center align-middle" >
                        <thead>
                            <tr class="align-middle">
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
                                <th>QR</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <!--lista es variable del controlador-->
                            <c:forEach var="dato" items="${lista}">
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
                                           class="btn btn-warning" id="btnEditar">Editar</a>
                                        <a href="${dato.idComprador}"
                                           class="btn btn-danger btnEliminar">Eliminar</a>
                                    </td>
                                    <td>
                                        <img src=
                                             "https://chart.googleapis.com/chart?cht=qr&chl=http://192.168.100.7:8080/Proyecto/qrVista.htm?idComprador=${dato.idComprador}&chs=160x160&chld=L|0"
                                             class="qr-code img-thumbnail img-responsive"/>
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            
            //FUNCION PARA CONFIRMAR ELIMNACION
            var listaBotones = document.getElementById('myTable').querySelectorAll('a.btnEliminar');
            listaBotones.forEach((e) => {
                e.addEventListener("click", () => {
                    if (window.confirm("¿Esta seguro que quiere eliminar el registro?")) {
                        e.href = "eliminarComprador.htm?idComprador=" + e.href.replace('http://localhost:8080/Proyecto/','');
                    } else {
                        e.href = "";
                    }
                });
            });
            
            //FUNCION PARA BUSCAR EN TABLA CON JQUERY
            $(document).ready(function(){
                $("#buscar").on("keyup", function() {
                  var value = $(this).val().toLowerCase();
                  $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                  });
                });
            });
            
        </script>
    </body>
</html>
