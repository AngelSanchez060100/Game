<%-- 
    Document   : editarEmpresa
    Created on : 10/03/2022, 09:07:13 PM
    Author     : Angel Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Empresa</title>
        <style>
            .mt-3{
                margin-left: 0.5rem;
            }
            body {
                background-image: url("https://www.enter.co/wp-content/uploads/2019/08/fryos-studios-1024x768.jpg");
            }
        </style>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>
                        Editar Registro
                    </h3> 
                </div>
                <div class="card-body">
                    <form method="POST" class="needs-validation" novalidate>
                        
                        <div>
                            <label class="form-label">Nombre:</label>
                            <input type="text" value="${Lista[0].nombre}" pattern="[A-Za-z ]{3,45}" id="validationCustom01" name="nombre" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un nombre valido.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Locacion:</label>
                            <input type="text" value="${Lista[0].locacion}" id="validationCustom02" name="locacion" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa la locación.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Correo:</label>
                            <input type="email" value="${Lista[0].correo}" placeholder="alguien@email.com" id="validationCustom03" name="correo" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un correo valido.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Numero de empleados:</label>
                            <input type="number" value="${Lista[0].numEmpleados}" min="1" id="validationCustom04" name="numEmpleados" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor indica el número de empleados.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Sitio Web</label>
                            <input type="url" value="${Lista[0].sitioWeb}" placeholder="https://www.example.com" id="validationCustom05" name="sitioWeb" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa una pagina web valida.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Fecha de fundacion:</label>
                            <input type="date" value="${Lista[0].fundacion}" id="validationCustom06" name="fundacion" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor selecciona la fecha de fundación.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Num de juegos publicados:</label>
                            <input min="1" type="number" value="${Lista[0].juegosPublicados}" id="validationCustom07" name="juegosPublicados" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor indica el número de juegos publicados.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">CEO:</label>
                            <input type="text" value="${Lista[0].ceo}" pattern="[A-Za-z ]{3,40}" id="validationCustom08" name="ceo" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa el nombre del CEO.
                            </div> 
                        </div>
                        
                        <input type="submit" class="btn btn-success float-end mt-3" href="listaEmpresa.htm" value="Actualizar">
                        <a class="btn btn-primary float-end mt-3" href="listaEmpresa.htm">Regresar</a>
                        
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
