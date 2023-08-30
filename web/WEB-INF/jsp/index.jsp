<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">        
        <title>Proyecto VideojuegosSpring</title>
        <style>
            img {
                max-width: 90%;
                max-height: 70%;
                padding-left: 2.5rem;
            }
            body {
                background-color: #2b292d;
            }
            .card {
                background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
                border-color: black;
                border-radius: 2rem
            }
            .contener2 {
                display: inline-flex;
                justify-content: center;
                margin-top: .5rem;
            }
            
        </style>
    </head>

    <body>
        <div class="container mt-3">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card h-100 text-center">
                        <img src="https://cdn-icons-png.flaticon.com/512/1924/1924844.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Comprador</h5>
                            <a href="altaComprador.htm" class="btn btn-primary">Alta</a>
                            <a href="listaComprador.htm" class="btn btn-secondary">Lista</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 text-center">
                        <img src="https://cdn-icons-png.flaticon.com/512/5931/5931742.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Distribuidora</h5>
                            <a href="altaDistribuidora.htm" class="btn btn-primary">Alta</a>
                            <a href="listaDistribuidora.htm" class="btn btn-secondary">Lista</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 text-center">
                        <img src="https://cdn-icons-png.flaticon.com/512/458/458910.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Empresa</h5>
                            <a href="altaEmpresa.htm" class="btn btn-primary">Alta</a>
                            <a href="listaEmpresa.htm" class="btn btn-secondary">Lista</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-3 g-4 contener2">
                    <div >
                        <div class="card h-100 text-center">
                            <img src="https://cdn-icons-png.flaticon.com/512/2317/2317981.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Jugador</h5>
                                <a href="altaJugador.htm" class="btn btn-primary">Alta</a>
                                <a href="listaJugador.htm" class="btn btn-secondary">Lista</a>
                            </div>
                        </div>
                    </div>
                    <div >
                        <div class="card h-100 text-center">
                            <img src="https://cdn-icons-png.flaticon.com/512/2991/2991606.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Videojuego</h5>
                                <a href="altaVideojuego.htm" class="btn btn-primary">Alta</a>
                                <a href="listaVideojuego.htm" class="btn btn-secondary">Lista</a>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </body>
</html>
