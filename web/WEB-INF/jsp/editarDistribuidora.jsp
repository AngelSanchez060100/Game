<%-- 
    Document   : editarDistribuidora
    Created on : 10/03/2022, 09:48:10 PM
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Distribuidora</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            .mt-3{
                margin-left: 0.5rem;
            }
            body {
                background-image: url("https://img.freepik.com/free-vector/video-game-shop-theme-logo-template_1056-348.jpg");
            }
        </style>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>
                        Actualiza Distribuidora
                    </h3>

                </div>
                <div class="card-body">
                    <form method="POST" class="needs-validation" novalidate>
                        
                        <div>
                            <label class="form-label">Videojuego:</label>
                            <select class="form-select" id="validationCustom01" name="idVideojuego" required>
                                <option selected hidden="true" value="${lista[0].idVideojuego}">${video[0].titulo}</option>
                                <c:forEach var="dato" items="${lista2}">
                                    <option value="${dato.idVideojuego}">${dato.titulo} </option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona un videojuego.
                            </div>
                        </div>

                        <div>
                            <label class="form-label"> Nombre Distribuidora: </label>
                            <input type="text" value="${lista[0].nombre}" pattern="[A-Za-z]{3,40}" id="validationCustom02" name="nombre" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un nombre valido.
                            </div>
                        </div>


                        <div>
                            <label class="form-label"> Numero Sedes: </label>
                            <input type="number" value="${lista[0].numSedes}" min="1" id="validationCustom03" name="numSedes" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor indica cuantas sedes existen.
                            </div>
                        </div>

                        <div>
                            <label class="form-label"> Formato: </label>
                            <select class="form-select" id="validationCustom04" name="formatoDistribuidora" required>
                                <option selected hidden value="${lista[0].formatoDistribuidora}">${lista[0].formatoDistribuidora}</option>
                                <option value="Fisica">Fisica</option>
                                <option value="Online">Online</option>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona el formato de la distribuidora.
                            </div>
                        </div>

                        <div>
                            <label class="form-label"> Hora Apertura: </label>
                            <input type="time" value="${lista[0].horarioApertura}" id="validationCustom05" name="horaApertura"  class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor indica la hora de apertura.
                            </div>
                        </div>

                        <div>
                            <label class="form-label"> Pagina Web: </label>
                            <input type="url" value="${lista[0].paginaWeb}" placeholder="https://www.example.com" id="validationCustom06" name="paginaWeb" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa una pagina valida.
                            </div> 
                        </div>

                        <div>
                            <label class="form-label"> Pais: </label>
                            <input type="text" value="${lista[0].pais}" pattern="[A-Za-z]{3,30}" id="validationCustom07" name="pais" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un país.
                            </div>
                        </div>

                        <input type="submit" class="btn btn-success float-end mt-3" href="listaDistribuidora.htm" value="Actualizar">
                        <a class="btn btn-primary float-end mt-3" href="listaDistribuidora.htm">Regresar</a>
                    </form>                    
                </div>
            </div>
        </div>
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation');

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                        form.addEventListener('submit', function (event) {
                            if (!form.checkValidity()) {
                                event.preventDefault();
                                event.stopPropagation();
                            }

                            form.classList.add('was-validated');
                            form.classList.remove('invalid-feedback');
                        }, false);
                    });
                })();
        </script>
    </body>
</html>
