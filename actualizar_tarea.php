<?php

// Incluir el archivo de conexión
require 'conexion.php';

$idTarea = $_POST['id_tarea'];

// Preparar la consulta SQL
if (isset($_POST['estado_id'])) {
    $estadoId = $_POST['estado_id'];
    // Actualizar solo el campo estado_id
    $sql = "UPDATE tarea SET estado_id = ? WHERE id = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("ii", $estadoId, $idTarea);
} else {

    // Obtener los datos enviados por POST
    $titulo = $_POST['titulo'];
    $descripcion = $_POST['descripcion'];
    $fechaLimite = $_POST['fecha_limite'];

    // Actualizar los demás campos sin incluir estado_id
    $sql = "UPDATE tarea SET titulo = ?, descripcion = ?, fecha_limite = ? WHERE id = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("sssi", $titulo, $descripcion, $fechaLimite, $idTarea);
}

// Ejecutar la consulta y verificar el resultado
if ($stmt->execute()) {
    $response = array(
        'status' => 'success',
        'message' => 'Tarea actualizada exitosamente'
    );
} else {
    $response = array(
        'status' => 'error',
        'message' => 'Error al actualizar la tarea: ' . $stmt->error
    );
}

// Devolver la respuesta como JSON
header('Content-Type: application/json');
echo json_encode($response);

// Cerrar la conexión a la base de datos
$stmt->close();
$conexion->close();

?>
