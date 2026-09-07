<?php

session_start();

include "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $correo = $_POST["correo"];
    $password = $_POST["password"];

    $consulta = $conexion->prepare(
        "SELECT id_usuario, nombre, apellido, password, rol
         FROM usuarios
         WHERE correo = ?"
    );

    $consulta->bind_param("s", $correo);
    $consulta->execute();

    $resultado = $consulta->get_result();

    if ($resultado->num_rows == 1) {

        $usuario = $resultado->fetch_assoc();

        if (password_verify($password, $usuario["password"])) {

            $_SESSION["id_usuario"] = $usuario["id_usuario"];
            $_SESSION["nombre"] = $usuario["nombre"];
            $_SESSION["apellido"] = $usuario["apellido"];
            $_SESSION["rol"] = $usuario["rol"];

            header("Location: citas.php");
            exit();

        } else {

            echo "Contraseña incorrecta.";
        }

    } else {

        echo "El correo no está registrado.";
    }

    $consulta->close();
}

$conexion->close();

?>