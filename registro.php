<?php

include "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $correo = $_POST["correo"];
    $telefono = $_POST["telefono"];
    $password = $_POST["password"];

    // Encriptar la contraseña
    $password_segura = password_hash($password, PASSWORD_DEFAULT);

    // Comprobar si el correo ya existe
    $consulta = $conexion->prepare(
        "SELECT id_usuario FROM usuarios WHERE correo = ?"
    );

    $consulta->bind_param("s", $correo);
    $consulta->execute();
    $resultado = $consulta->get_result();

    if ($resultado->num_rows > 0) {

        echo "Este correo ya está registrado.";

    } else {

        // Registrar usuario
        $insertar = $conexion->prepare(
            "INSERT INTO usuarios
            (nombre, apellido, correo, telefono, password, rol)
            VALUES (?, ?, ?, ?, ?, 'cliente')"
        );

        $insertar->bind_param(
            "sssss",
            $nombre,
            $apellido,
            $correo,
            $telefono,
            $password_segura
        );

        if ($insertar->execute()) {

            echo "Cuenta creada correctamente.";

        } else {

            echo "Error al crear la cuenta.";
        }

        $insertar->close();
    }

    $consulta->close();
}

$conexion->close();

?>