<%-- 
    Document   : qrVistaVideojuego
    Created on : 14/03/2022, 08:17:23 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Datos del Videojuego</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>Videojuego</h3>
                </div>
                <div class="card-body">
                    <form>
                        
                        <label>ID Videojuego:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].idVideojuego}">
                        <label>Empresa:</label>
                        <input disabled="true" type="text" class="form-control" value="${empre[0].nombre}">
                        <label>Titulo:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].titulo}">
                        <label>Clasificacion:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].clasificacion}">
                        <label>Numero de jugadores:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].numeroJugadores}">
                        <label>Fecha de lanzamiento:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].fechaLanzamiento}">
                        <label>codigo de barras</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].codigoBarras}">
                        <label>Formato:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].formato}">
                        <label>Precio:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].precio}">
                        <label>Almacenamiento:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].almacenamiento}">
                        <label>Idioma:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].idioma}">
                        <label>Plataforma:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].plataforma}">
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
