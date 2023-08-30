<%-- 
    Document   : qrVistaDistribuidora
    Created on : 14/03/2022, 04:57:53 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Datos de la Distribuidora</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>Datos</h3>
                </div>
                <div class="card-body">
                    <form method="POST">
                        
                        <label> ID Distribuidora: </label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].idDistribuidora}">
                        <label> Videojuego: </label>
                        <input disabled="true" type="text" class="form-control" value="${video[0].titulo}">
                        <label> Nombre Distribuidora: </label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].nombre}">
                        <label> Numero Sedes: </label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].numSedes}">
                        <label> Formato: </label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].formatoDistribuidora}">
                        <label> Hora Apertura: </label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].horarioApertura}">
                        <label> Pagina Web: </label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].paginaWeb}">
                        <label> Pais: </label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].pais}">
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
