<%-- 
    Document   : editarComprador
    Created on : 10/03/2022, 08:21:55 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Editar Comprador</title>
        <style>
            .mt-3{
                margin-left: 0.5rem;
            }
            body {
                background-image: url("https://170en81rlrm1a6dxv47yvydg-wpengine.netdna-ssl.com/wp-content/uploads/2019/04/Buyer-Persona-Example.jpg");
                background-size: 50%
            }
        </style>
    </head>
    <body>
         <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>Editar Registro</h3>
                </div>
                <div class="card-body">
                    <form method="POST" class="needs-validation" novalidate>

                        <div>
                            <label class="form-label">Distribuidora:</label>
                            <select class="form-select" name="idDistribuidora" id="validationCustom01" required>
                                <option selected hidden="true" value="${lista[0].idDistribuidora}">${distri[0].nombre}</option>
                                <c:forEach var="dato" items="${lista2}">
                                    <option value="${dato.idDistribuidora}">${dato.nombre}</option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona una distribuidora.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Videojuego:</label>
                            <select class="form-select" name="idVideojuego" id="validationCustom02" required>
                                <option selected hidden="true" value="${lista[0].idVideojuego}">${video[0].titulo}</option>
                                <c:forEach var="dato2" items="${lista3}">
                                    <option value="${dato2.idVideojuego}">${dato2.titulo} </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div>
                            <label class="form-label">Nombre:</label>
                            <input type="text" pattern="[A-Za-z ]{3,30}" name="nombre" class="form-control" value="${lista[0].nombre}" id="validationCustom03" required/>
                            <div class="invalid-feedback">
                                Por favor ingresa un nombre valido.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">A. Paterno:</label>
                            <input type="text" pattern="[A-Za-z ]{3,30}" name="aPaterno" class="form-control" value="${lista[0].aPaterno}" id="validationCustom04" required/>
                            <div class="invalid-feedback">
                                Por favor ingresa un apellido paterno.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">A. Materno:</label>
                            <input type="text" pattern="[A-Za-z ]{3,30}" name="aMaterno" class="form-control" value="${lista[0].aMaterno}" id="validationCustom05" required/>
                            <div class="invalid-feedback">
                                Por favor ingresa un apellido materno.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Correo:</label>
                            <input type="email" name="email" placeholder="alguien@email.com" class="form-control" value="${lista[0].email}" id="validationCustom06" required/>
                            <div class="invalid-feedback">
                                Por favor ingresa un correo.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Dirección:</label>
                            <input type="text" name="direccion" class="form-control" value="${lista[0].direccion}" id="validationCustom07" required/>
                            <div class="invalid-feedback">
                                Por favor ingresa una dirección.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Telefono:</label>
                            <input type="text" pattern="[0-9]{10}" placeholder="5512345678" name="telefono" class="form-control" value="${lista[0].telefono}" id="validationCustom08" required/>
                            <div class="invalid-feedback">
                                Por favor ingresa un numero de teléfono (de 10 digitos).
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Fecha Nacimiento</label>
                            <input type="date" name="fechaNacimiento" class="form-control" value="${lista[0].fechaNacimiento}" id="validationCustom09" required/>
                            <div class="invalid-feedback">
                                Por favor selecciona una fecha de nacimiento.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Sexo:</label>
                            <select class="form-select" name="sexo" id="validationCustom10" required>
                                <option selected hidden="true">${lista[0].sexo}</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona un sexo.
                            </div>
                        </div>

                        <br>
                        <input type="submit" class="btn btn-success float-end mt-3" href="listaComprador.htm" value="Actualizar">
                        <a class="btn btn-primary float-end mt-3" href="listaComprador.htm">Regresar</a>
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
