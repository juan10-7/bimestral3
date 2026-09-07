<?php

session_start();

include "conexion.php";

// Comprobar que el usuario inició sesión
if (!isset($_SESSION["id_usuario"])) {
    header("Location: login.html");
    exit();
}


// Obtener los datos del formulario

$id_usuario = $_SESSION["id_usuario"];
$id_servicio = $_POST["id_servicio"];
$tipo_derecho = $_POST["tipo_derecho"];
$fecha = $_POST["fecha"];
$hora = $_POST["hora"];
$problema = $_POST["problema"];


// Insertar la cita

$consulta = $conexion->prepare(
    "INSERT INTO citas
    (id_usuario, id_servicio, tipo_derecho, fecha, hora, problema, estado)
    VALUES (?, ?, ?, ?, ?, ?, 'pendiente')"
);

$consulta->bind_param(
    "iissss",
    $id_usuario,
    $id_servicio,
    $tipo_derecho,
    $fecha,
    $hora,
    $problema
);


if ($consulta->execute()) {

    echo "<h1>Cita solicitada correctamente</h1>";

    echo "<p>
            Tu solicitud de cita fue registrada.
        </p>";

    echo "<a href='citas.php'>
            Solicitar otra cita
        </a>";

    echo "<br><br>";

    echo "<a href='index.html'>
            Volver al inicio
        </a>";

} else {

    echo "<h1>Error</h1>";

    echo "<p>
            No fue posible registrar la cita.
        </p>";
}


$consulta->close();

$conexion->close();

?>