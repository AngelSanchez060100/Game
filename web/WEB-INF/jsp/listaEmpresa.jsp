<%-- 
    Document   : listaEmpresa
    Created on : 10/03/2022, 08:59:49 PM
    Author     : Angel Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista empresa</title>
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <style>
            .qr-code {
                max-width: 100px;
            }
            body {
                background-image: url("https://www.enter.co/wp-content/uploads/2019/08/fryos-studios-1024x768.jpg");
            }
        </style>
    </head>
    <body>
        <!-- SE AGREGA ESTA PARTE DE CODIGO -->
        <div class="container mt-4">
            <div class="card boarder-info">
                <div class="card-header bg-info text-white">
                    <h4> Lista general </h4>
                    <div style="float: right">
                        <a class="btn btn-outline-light" href="altaEmpresa.htm">Agregar Registro</a>
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
                    <table class="table table-hover text-center align-middle" >
                        <thead>
                            <tr>
                                <th> IdEmpresa </th>
                                <th> Nombre </th>
                                <th> Locacion </th>
                                <th> Correo Electronico</th>
                                <th> Numero de empleados </th>
                                <th> Sitio Web </th>
                                <th> Fecha de Fundacion </th>
                                <th> Juegos Publicados </th>
                                <th> CEO o DIRECTOR </th>
                                <th>Acciones</th>
                                <th>QR</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="dato" items="${Lista}">
                                <tr>
                                    <td>${dato.idEmpresa}</td> 
                                    <td>${dato.nombre}</td> 
                                    <td>${dato.locacion}</td> 
                                    <td>${dato.correo}</td> 
                                    <td>${dato.numEmpleados}</td>
                                    <td>${dato.sitioWeb}</td>
                                    <td>${dato.fundacion}</td>
                                    <td>${dato.juegosPublicados}</td>
                                    <td>${dato.ceo}</td>
                                    <td>
                                        <a href="editarEmpresa.htm?idEmpresa=${dato.idEmpresa}"
                                           class="btn btn-warning">Editar</a>
                                        <a href="${dato.idEmpresa}"
                                           class="btn btn-danger btnEliminar">Eliminar</a>
                                    </td>
                                    <td>
                                        <img src=
                                             "https://chart.googleapis.com/chart?cht=qr&chl=http://192.168.100.7:8080/Proyecto/qrVistaEmpresa.htm?idEmpresa=${dato.idEmpresa}&chs=160x160&chld=L|0"
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
                        e.href = "eliminarEmpresa.htm?idEmpresa=" + e.href.replace('http://localhost:8080/Proyecto/','');
                    } else {
                        e.href = "";
                    }
                });
            });
            
            //FUNCION PARA FILTRO
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
