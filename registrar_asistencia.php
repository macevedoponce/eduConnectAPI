<?php

// Establecer conexión con la base de datos
$servername = "localhost";
$username = "macevedoponce";
$password = "toor";
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
$sql = "SELECT * FROM Registro_Asistencias WHERE id_curso = '$curso_id' AND id_usuario = '$usuario_id' AND ra_fecha = '$fecha'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Actualizar el registro existente
    $sql = "UPDATE Registro_Asistencias SET ra_estado = '$estado' WHERE id_curso = '$curso_id' AND id_usuario = '$usuario_id' AND ra_fecha = '$fecha'";
    if ($conn->query($sql) === TRUE) {
        echo "Registro actualizado exitosamente";
    } else {
        echo "Error al actualizar el registro: " . $conn->error;
    }
} else {
    // Agregar un nuevo registro
    $sql = "INSERT INTO Registro_Asistencias (id_usuario, id_curso, ra_fecha, ra_estado) VALUES ('$usuario_id', '$curso_id', '$fecha', '$estado')";
    if ($conn->query($sql) === TRUE) {
        echo "Registro agregado exitosamente";
    } else {
        echo "Error al agregar el registro: " . $conn->error;
    }
}

// Cerrar la conexión con la base de datos
$conn->close();

?>