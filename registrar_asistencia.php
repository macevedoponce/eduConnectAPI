<?php

// Establecer conexión con la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "educonnect";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión a la base de datos: " . $conn->connect_error);
}

// Obtener los datos enviados por la solicitud
$usuario_id = $_POST['usuario_id'];
$curso_id = $_POST['curso_id'];
$fecha = $_POST['fecha'];
$estado = $_POST['estado'];

// Verificar si ya existe un registro con los mismos valores de curso_id, usuario_id y fecha
$sql = "SELECT * FROM asistencia WHERE curso_id = '$curso_id' AND usuario_id = '$usuario_id' AND fecha = '$fecha'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Actualizar el registro existente
    $sql = "UPDATE asistencia SET estado = '$estado' WHERE curso_id = '$curso_id' AND usuario_id = '$usuario_id' AND fecha = '$fecha'";
    if ($conn->query($sql) === TRUE) {
        echo "Registro actualizado exitosamente";
    } else {
        echo "Error al actualizar el registro: " . $conn->error;
    }
} else {
    // Agregar un nuevo registro
    $sql = "INSERT INTO asistencia (usuario_id, curso_id, fecha, estado) VALUES ('$usuario_id', '$curso_id', '$fecha', '$estado')";
    if ($conn->query($sql) === TRUE) {
        echo "Registro agregado exitosamente";
    } else {
        echo "Error al agregar el registro: " . $conn->error;
    }
}

// Cerrar la conexión con la base de datos
$conn->close();

?>