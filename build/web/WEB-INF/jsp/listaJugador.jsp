<%-- 
    Document   : listaJugador
    Created on : 14/03/2022, 09:30:06 AM
    Author     : Brandon
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista General</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <style>
            .qr-code {
              max-width: 100px;
            }
            body {
                background-image: url("https://i.pinimg.com/originals/8f/0a/de/8f0ade163f0f3ec61bc626b3f48567e0.png");
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card boarder-info">
                <div class="card-header bg-info text-white">
                    <h4>Lista Jugadores</h4>
                    <div style="float: right">
                        <a class="btn btn-outline-light" href="altaJugador.htm" >Agregar Registro</a>
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
                    <table class="table table-hover text-center  align-middle">
                        <thead>
                            <tr>
                                <th>ID Jugador</th>
                                <th>Videojuego</th>
                                <th>Alias</th>
                                <th>Pais</th>
                                <th>Clan</th>
                                <th>Nivel</th>
                                <th>Victorias</th>
                                <th>Horas Jugadas/dia</th>
                                <th>Telefono</th>
                                <th>Fecha de Nacimiento</th>
                                <th>Sexo</th>
                                <th>Acciones</th>
                                <th>QR</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:forEach var="dato" items="${lista}">
                                <tr>
                                    <td>${dato.idJugador}</td>
                                    <td>${dato.idVideojuego}</td>
                                    <td>${dato.alias}</td>
                                    <td>${dato.pais}</td>
                                    <td>${dato.clan}</td>
                                    <td>${dato.nivel}</td>
                                    <td>${dato.victorias}</td>
                                    <td>${dato.horasJugadas}</td>
                                    <td>${dato.telefono}</td>
                                    <td>${dato.fechaNacimiento}</td>
                                    <td>${dato.sexo}</td>
                                    <td>
                                        <a href="editarJugador.htm?idJugador=${dato.idJugador}" class="btn btn-warning">Editar</a>
                                        <a href="${dato.idJugador}" class="btn btn-danger btnEliminar">Eliminar</a>
                                    </td>
                                    <td>
                                        <img src=
                                             "https://chart.googleapis.com/chart?cht=qr&chl=http://192.168.100.7:8080/Proyecto/qrVistaJugador.htm?idJugador=${dato.idJugador}&chs=160x160&chld=L|0"
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
                        e.href = "eliminarJugador.htm?idJugador=" + e.href.replace('http://localhost:8080/Proyecto/','');
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