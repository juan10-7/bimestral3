<?php

session_start();

include "conexion.php";

// Verificar que el usuario haya iniciado sesión
if (!isset($_SESSION["id_usuario"])) {
    header("Location: login.html");
    exit();
}

// Obtener los servicios de la base de datos
$consulta = $conexion->query(
    "SELECT id_servicio, nombre, precio
     FROM servicios
     ORDER BY nombre"
);

?>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Solicitar cita - Santana Legal</title>

    <link rel="stylesheet" href="style.css">

    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body>

    <!-- ENCABEZADO -->

    <header class="index">

        <div class="nav-container">

            <a href="index.html" class="logo">
                Santana Legal
            </a>

            <nav>

                <ul class="nav-menu">

                    <li>
                        <a href="index.html">
                            Inicio
                        </a>
                    </li>

                    <li>
                        <a href="servicios.html">
                            Servicios
                        </a>
                    </li>

                    <li>
                        <a href="citas.php" class="active">
                            Citas
                        </a>
                    </li>

                    <li>
                        <a href="contacto.html">
                            Contacto
                        </a>
                    </li>

                    <li>
                        <a href="login.html">
                            Mi cuenta
                        </a>
                    </li>

                </ul>

            </nav>

        </div>

    </header>


    <!-- CONTENIDO -->

    <main>

        <section class="titulo-pagina">

            <h1>Solicitar una cita</h1>

            <p>
                Completa los siguientes datos para solicitar
                tu cita jurídica.
            </p>

        </section>


        <section class="formulario">

            <form action="guardar_cita.php" method="post">


                <!-- TIPO DE DERECHO -->

                <label for="derecho">
                    Tipo de derecho:
                </label>

                <select id="derecho"
                        name="tipo_derecho"
                        required>

                    <option value="">
                        Selecciona un área
                    </option>

                    <option value="Derecho familiar">
                        Derecho familiar
                    </option>

                    <option value="Derecho laboral">
                        Derecho laboral
                    </option>

                    <option value="Derecho civil">
                        Derecho civil
                    </option>

                    <option value="Derecho comercial">
                        Derecho comercial
                    </option>

                    <option value="Derecho penal">
                        Derecho penal
                    </option>

                </select>


                <!-- SERVICIO -->

                <label for="servicio">
                    Servicio:
                </label>

                <select id="servicio"
                        name="id_servicio"
                        required>

                    <option value="">
                        Selecciona un servicio
                    </option>

                    <?php

                    while ($servicio = $consulta->fetch_assoc()) {

                        echo "<option value='" .
                             $servicio["id_servicio"] .
                             "'>" .
                             $servicio["nombre"] .
                             " - $" .
                             number_format(
                                 $servicio["precio"],
                                 0,
                                 ",",
                                 "."
                             ) .
                             "</option>";
                    }

                    ?>

                </select>


                <!-- FECHA -->

                <label for="fecha">
                    Fecha:
                </label>

                <input
                    type="date"
                    id="fecha"
                    name="fecha"
                    required
                >


                <!-- HORA -->

                <label for="hora">
                    Hora:
                </label>

                <input
                    type="time"
                    id="hora"
                    name="hora"
                    required
                >


                <!-- PROBLEMA -->

                <label for="problema">
                    Describe tu situación:
                </label>

                <textarea
                    id="problema"
                    name="problema"
                    rows="6"
                    placeholder="Describe brevemente tu situación..."
                    required
                ></textarea>


                <button type="submit" class="boton">
                    Solicitar cita
                </button>

            </form>

        </section>

    </main>


    <!-- PIE DE PÁGINA -->

    <footer>

        <p>
            © 2032 Santana Legal -
            Tu derecho, nuestra responsabilidad
        </p>

    </footer>

</body>

</html>

<?php

$conexion->close();

?>