<?php

// Incluir el archivo de conexión
require 'conexion.php';

// Obtener los datos enviados por POST
$titulo = $_POST['titulo'];
$descripcion = $_POST['descripcion'];
$fechaLimite = $_POST['fecha_limite'];
$estadoId = $_POST['estado_id'];
$cursoId = $_POST['curso_id'];

// Preparar la consulta SQL
$sql = "INSERT INTO tarea (titulo, descripcion, fecha_limite, estado_id, curso_id) VALUES (?, ?, ?, ?, ?)";
$stmt = $conexion->prepare($sql);
$stmt->bind_param("sssii", $titulo, $descripcion, $fechaLimite, $estadoId, $cursoId);

// Ejecutar la consulta y verificar el resultado
if ($stmt->execute()) {
    $response = array(
        'status' => 'success',
        'message' => 'Tarea agregada exitosamente'
    );
} else {
    $response = array(
        'status' => 'error',
        'message' => 'Error al agregar la tarea: ' . $stmt->error
    );
}

// Devolver la respuesta como JSON
header('Content-Type: application/json');
echo json_encode($response);

// Cerrar la conexión a la base de datos
$stmt->close();
$conexion->close();

?>
