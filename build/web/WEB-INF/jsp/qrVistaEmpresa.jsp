<%-- 
    Document   : qrVistaEmpresa
    Created on : 14/03/2022, 05:58:47 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Datos de la Empresa</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>Datos</h3>
                </div>
                <div class="card-body">
                    <form method="POST">
                        
                        <label>ID Empresa:</label>
                        <input disabled="true" type="text"class="form-control" value="${listaQr[0].idEmpresa}">
                        <label>Nombre:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].nombre}">
                        <label>Locacion:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].locacion}">
                        <label>Correo:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].correo}">
                        <label>Numero de empleados:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].numEmpleados}">
                        <label>Sitio Web</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].sitioWeb}">
                        <label>Fecha de fundacion:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].fundacion}">
                        <label>Num de juegos publicados:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].juegosPublicados}">
                        <label>CEO o JEFE:</label>
                        <input disabled="true" type="text" class="form-control" value="${listaQr[0].ceo}">
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
