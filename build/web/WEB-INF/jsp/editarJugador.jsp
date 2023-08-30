<%-- 
    Document   : editarJugador
    Created on : 14/03/2022, 09:29:25 AM
    Author     : Brandon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Jugador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            .mt-3{
                margin-left: 0.5rem;
            }
            body {
                background-image: url("https://i.pinimg.com/originals/8f/0a/de/8f0ade163f0f3ec61bc626b3f48567e0.png");
            }
        </style>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card boarder-info">
                <div class="card-header bg-info">
                    <h3>Editar Jugador</h3>
                </div>
                <div class="card-body">
                    <form method="POST" class="needs-validation" novalidate>
                        
                        <div>
                            <label class="form-label">Videojuego</label>
                            <select class="form-select" id="validationCustom01" name="idVideojuego" required>
                                <option selected hidden value="${lista[0].idVideojuego}">${video[0].titulo}</option>
                                <c:forEach var="dato" items="${lista2}">
                                    <option value="${dato.idVideojuego}">${dato.titulo} </option> 
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona un videojuego.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Alias</label>
                            <input type="text" value="${lista[0].alias}" id="validationCustom02" name="alias" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un alias.
                            </div>
                        </div>
                            
                        <div>
                            <label class="form-label">Pais</label>
                            <input type="text" value="${lista[0].pais}" pattern="[A-Za-z]{3,30}" id="validationCustom03" name="pais" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un pais.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Clan</label>
                            <input type="text" value="${lista[0].clan}" id="validationCustom04" name="clan" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un clan.
                            </div>
                        </div>


                        <div>
                            <label class="form-label">Nivel</label>
                            <input type="number" value="${lista[0].nivel}" min="1" id="validationCustom05" name="nivel" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor indica un nivel.
                            </div> 
                        </div>

                        <div>
                            <label class="form-label">Victorias</label>
                            <input type="number" value="${lista[0].victorias}" min="0" id="validationCustom06" name="victorias" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor indica el numero de victorias.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Hora de inicio de juego</label>
                            <input type="time" value="${lista[0].horasJugadas}" id="validationCustom07" name="horasJugadas" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor indica las horas de juego.
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Telefono</label>
                            <input type="tel" value="${lista[0].telefono}" pattern="[0-9]{10}" placeholder="5512345678" id="validationCustom08" name="telefono" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor ingresa un numero de telefono valido (de 10 digitos).
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Fecha de Nacimiento</label>
                            <input type="date" value="${lista[0].fechaNacimiento}" id="validationCustom08" name="fechaNacimiento" class="form-control" required>
                            <div class="invalid-feedback">
                                Por favor seleciona la fecha de nacimiento.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Sexo</label>
                            <select class="form-select" id="inputGroupSelect01" name="sexo" required>
                                <option selected hidden value="${lista[0].sexo}">${lista[0].sexo}</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona un sexo.
                            </div>
                        </div>
                        
                        
                        <input type="submit" class="btn btn-success float-end mt-3" href="listaJugador.htm" value="Actualizar">
                        <a class="btn btn-primary float-end mt-3" href="listaJugador.htm">Regresar</a>
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