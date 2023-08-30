<%-- 
    Document   : listaDistribuidora
    Created on : 10/03/2022, 09:47:57 PM
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Distribuidoras</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <style>
            .qr-code {
              max-width: 100px;
            }
            body {
                background-image: url("https://img.freepik.com/free-vector/video-game-shop-theme-logo-template_1056-348.jpg");
            }
        </style>
    </head>
    <body>

        <div class="container mt-4">
            <div class="card border-info">
                <div class="card-header bg-info text-pink">
                    <h4> Lista General Distribuidora</h4>
                    <div style="float: right">
                        <a class="btn btn-outline-light" href="altaDistribuidora.htm">Agregar Registro</a>
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
                <div class="card-body">
                    <table class="table table-hover text-center align-middle">
                        <thead>
                            <tr>
                                <th>Id Distribuidora</th>
                                <th>Videojuego</th>
                                <th>Nombre</th>
                                <th>Sedes</th>
                                <th>Formato</th>
                                <th>Hora Apertura</th>
                                <th>Pagina Web</th>
                                <th>Pais</th>
                                <th>Acciones</th>
                                <th>QR</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="dato" items="${lista}">
                                <tr>
                                    <td>${dato.idDistribuidora}</td>
                                    <td>${dato.idVideojuego}</td>
                                    <td>${dato.nombre}</td>
                                    <td>${dato.numSedes}</td>
                                    <td>${dato.formatoDistribuidora}</td>
                                    <td>${dato.horarioApertura}</td>
                                    <td>${dato.paginaWeb}</td>
                                    <td>${dato.pais}</td>

                                    <td> 
                                        <a href="editarDistribuidora.htm?idDistribuidora=${dato.idDistribuidora}" class="btn btn-warning">Editar</a> 
                                        <a href="${dato.idDistribuidora}" class="btn btn-danger btnEliminar">Eliminar</a>
                                    </td>
                                    
                                    <td>
                                        <img src=
                                             "https://chart.googleapis.com/chart?cht=qr&chl=http://192.168.100.7:8080/Proyecto/qrVistaDistribuidora.htm?idDistribuidora=${dato.idDistribuidora}&chs=160x160&chld=L|0"
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
                    if (window.confirm("¿Esta seguro que quiere eliminar el registro? Puede ser que este esté relacionado con otra tabla.")) {
                        e.href = "eliminarDistribuidora.htm?idDistribuidora=" + e.href.replace('http://localhost:8080/Proyecto/','');
                    } else {
                        e.href = "";
                    }
                });
            });
            
            
            //FUNCION PARA FILTRO CON JQUERY
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