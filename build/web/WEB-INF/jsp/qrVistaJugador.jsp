<%-- 
    Document   : qrVistaJugador
    Created on : 14/03/2022, 06:56:22 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Datos del Jugador</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>Datos</h3>
                </div>
                <div class="card-body">
                    <form >
                        
                        <label>ID Jugador</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].idJugador}">
                        <label>Videojuego</label>
                        <input disabled="true" type="text" class="form-control" value="${video[0].titulo}">
                        <label>Alias</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].alias}">
                        <label>Pais</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].pais}">
                        <label>Clan</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].clan}">
                        <label>Nivel</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].nivel}">
                        <label>Victorias</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].victorias}">
                        <label>Horas Jugadas</label>
                        <p>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].horasJugadas}"/>
                        <p>
                        <label>Telefono</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].telefono}">
                        <label>Fecha de Nacimiento</label>
                        <p>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].fechaNacimiento}"/>
                        <p>
                        <label>Sexo</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].sexo}">
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
