<%-- 
    Document   : qrVista
    Created on : 12/03/2022, 05:39:09 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Datos del Comprador</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>Datos</h3>
                </div>
                <div class="card-body">
                    <form method="POST">
                        
                        <label>ID Comprador:</label>
                        <input disabled="true" type="text" value="${listaQr[0].idComprador}" class="form-control"/>
                        <label>Distribuidora:</label>
                        <input disabled="true" type="text" value="${distri[0].nombre}" class="form-control"/>
                        <label>Videojuego:</label>
                        <input disabled="true" type="text" value="${video[0].titulo}" class="form-control"/>
                        <label>Nombre:</label>
                        <input disabled="true" type="text" value="${listaQr[0].nombre}" class="form-control"/>
                        <label>A. Paterno:</label>
                        <input disabled="true" type="text" value="${listaQr[0].aPaterno}" class="form-control"/>
                        <label>A. Materno:</label>
                        <input disabled="true" type="text" value="${listaQr[0].aMaterno}" class="form-control"/>
                        <label>Correo:</label>
                        <input disabled="true" type="text" value="${listaQr[0].email}" class="form-control"/>
                        <label>Dirección:</label>
                        <input disabled="true" type="text" value="${listaQr[0].direccion}" class="form-control"/>
                        <label>Telefono:</label>
                        <input disabled="true" type="text" value="${listaQr[0].telefono}" class="form-control"/>
                        <label>Fecha Nacimiento</label>
                        <input disabled="true" type="text" value="${listaQr[0].fechaNacimiento}" class="form-control"/>
                        <label>Sexo:</label>
                        <input disabled="true" type="text" value="${listaQr[0].sexo}" class="form-control"/>
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

