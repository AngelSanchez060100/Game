<%-- 
    Document   : listaVideojuego
    Created on : 10/03/2022, 10:44:00 PM
    Author     : Angel Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <title>Lista Videojuegos</title>}
        <style>
            .qr-code {
              max-width: 100px;
            }
            body {
                background-image: url("https://png.pngtree.com/thumb_back/fh260/background/20201015/pngtree-gamer-style-cmando-neon-effect-vactor-image_418958.jpg");
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
                        <a class="btn btn-outline-light" href="altaVideojuego.htm">Agregar registro</a>
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
                            <tr>
                                <th> IdVideojuego </th>
                                <th> IdEmpresa </th>
                                <th> Titulo </th>
                                <th> Clasificacion </th>
                                <th> Numero de jugadores</th>
                                <th> Fecha de lanzamiento </th>
                                <th> Codigo de barras </th>
                                <th> Formato </th>
                                <th> Precio </th>
                                <th> Almacenamiento </th>
                                <th> Idioma </th>
                                <th> Plataforma </th>


                                <!-- cuarto paso de la clase 4-->
                                <th>Acciones</th>
                                <th>QR</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="dato" items="${Lista}">
                                <tr>
                                    <td>${dato.idVideojuego}</td> 
                                    <td>${dato.idEmpresa}</td> 
                                    <td>${dato.titulo}</td> 
                                    <td>${dato.clasificacion}</td> 
                                    <td>${dato.numeroJugadores}</td> 
                                    <td>${dato.fechaLanzamiento}</td>
                                    <td>${dato.codigoBarras}</td>
                                    <td>${dato.formato}</td>
                                    <td>${dato.precio}</td>
                                    <td>${dato.almacenamiento}</td>
                                    <td>${dato.idioma}</td>
                                    <td>${dato.plataforma}</td>
                                    <td>
                                        <a href="editarVideojuego.htm?idVideojuego=${dato.idVideojuego}"
                                           class="btn btn-warning">Editar</a>
                                           <a href="${dato.idVideojuego}"
                                           class="btn btn-danger btnEliminar">Eliminar</a>
                                    </td>
                                    <td>
                                        <img src=
                                             "https://chart.googleapis.com/chart?cht=qr&chl=http://192.168.100.7:8080/Proyecto/qrVistaVideojuego.htm?idVideojuego=${dato.idVideojuegp}&chs=160x160&chld=L|0"
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
                        e.href = "eliminarVideojuego.htm?idVideojuego=" + e.href.replace('http://localhost:8080/Proyecto/','');
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
