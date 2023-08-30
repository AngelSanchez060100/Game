<%-- 
    Document   : editarVideojuego
    Created on : 10/03/2022, 10:53:48 PM
    Author     : Angel Sanchez
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="text/html">
        <title>Editar Videojuego</title>
        <style>
            .mt-3{
                margin-left: 0.5rem;
            }
            body {
                background-image: url("https://png.pngtree.com/thumb_back/fh260/background/20201015/pngtree-gamer-style-cmando-neon-effect-vactor-image_418958.jpg");
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
                            <label class="form-label">Empresa:</label>
                            <select class="form-select " name="idEmpresa" id="validationCustom01" required>
                                <option selected hidden="true" value="${Lista[0].idEmpresa}">${empre[0].nombre}</option>
                                <c:forEach var="dato" items="${lista2}">
                                    <option value="${dato.idEmpresa}">${dato.nombre} </option> 
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona una empresa.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Titulo:</label>
                            <input type="text" value="${Lista[0].titulo}" name="titulo" class="form-control" id="validationCustom02" required>
                            <div class="invalid-feedback">
                                Por favor ingresa el titulo del videojuego.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Clasificacion:</label>
                            <select class="form-select" name="clasificacion" id="validationCustom03" required>
                                <option selected hidden value="${Lista[0].clasificacion}">${Lista[0].clasificacion}</option> 
                                <option value="E">Todos</option>
                                <option value="T">Adolecentes(+15)</option>
                                <option value="M">Maduro(+18)</option>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona la clasificación del juego.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Numero de jugadores:</label>
                            <input type="number" value="${Lista[0].numeroJugadores}" min="1" name="numeroJugadores" class="form-control" id="validationCustom04" required>
                            <div class="invalid-feedback">
                                Por favor indica el numero de jugadores.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Fecha de lanzamiento:</label>
                            <input type="date" value="${Lista[0].fechaLanzamiento}" name="fechaLanzamiento" class="form-control" id="validationCustom05" required>
                            <div class="invalid-feedback">
                                Por favor ingresa la fecha de lanzamiento.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Código de barras</label>
                            <input type="text" value="${Lista[0].codigoBarras}" pattern="[0-9]{10}" name="codigoBarras" class="form-control" id="validationCustom06" required>
                            <div class="invalid-feedback">
                                Por favor ingresa el codigo de barras (10 digitos).
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Formato:</label>
                            <select class="form-select" name="formato" id="validationCustom07" required>
                                <option selected hidden value="${Lista[0].formato}">${Lista[0].formato}</option> 
                                <option value="Fisico">Fisico</option>
                                <option value="Digital">Digital</option>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona el formato del videojuego.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Precio:</label>
                            <input type="double" value="${Lista[0].precio}" min="0" name="precio" class="form-control" id="validationCustom08" required>
                            <div class="invalid-feedback">
                                Por favor ingresa el precio videojuego.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Almacenamiento:</label>
                            <input type="number" value="${Lista[0].almacenamiento}" min="4" name="almacenamiento" class="form-control" id="validationCustom09" required>
                            <div class="invalid-feedback">
                                Por favor ingresa el almacenamiento que usara el videojuego.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Idioma:</label>
                            <select class="form-select" name="idioma" id="validationCustom10" required>
                                <option selected hidden value="${Lista[0].idioma}">${Lista[0].idioma}</option> 
                                <option value="Español">Español</option>
                                <option value="Ingles">Ingles</option>
                                <option value="Multi">Multi</option>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona el idio del videojuego.
                            </div>
                        </div>
                        
                        <div>
                            <label class="form-label">Plataforma:</label>
                            <select class="form-select" name="plataforma" id="validationCustom11" required>
                                <option selected hidden value="${Lista[0].plataforma}">${Lista[0].plataforma}</option>
                                <option  value="Xbox One/ Series S/X">Xbox One/ Series S/X</option>
                                <option value="PS4">PS4</option>
                                <option value="PS5">PS5</option>
                                <option value="Switch">Switch</option>
                                <option value="PC">PC</option>
                            </select>
                            <div class="invalid-feedback">
                                Por favor selecciona la plataforma del videojuego.
                            </div>
                        </div>
                        
                        <input type="submit" class="btn btn-success float-end mt-3" href="listaVideojuego.htm" value="Actualizar">
                        <a class="btn btn-primary float-end mt-3" href="listaVideojuego.htm">Regresar</a>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            
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
