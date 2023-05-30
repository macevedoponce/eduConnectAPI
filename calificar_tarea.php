<?php

// Incluir el archivo de conexión
require 'conexion.php';

// Preparar la consulta SQL
if (isset($_POST['id_entrega'])) {
    // Obtener los datos enviados por POST
    $retroalimentacion = $_POST['retroalimentacion'];
    $nota = $_POST['nota'];
    $idEntrega = $_POST['id_entrega'];

    // Actualizar los demás campos sin incluir estado_id
    $sql = "UPDATE entrega_tarea SET retroalimentacion = ?, nota = ? WHERE id = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->bind_param("sii", $retroalimentacion, $nota, $idEntrega);
}

// Ejecutar la consulta y verificar el resultado
if ($stmt->execute()) {
    $response = array(
        'status' => 'success',
        'message' => 'Se registro la nota y retroalimentación satisfactoriamente'
    );
} else {
    $response = array(
        'status' => 'error',
        'message' => 'Error al registrar nota y retroalimentacion: ' . $stmt->error
    );
}

// Devolver la respuesta como JSON
header('Content-Type: application/json');
echo json_encode($response);

// Cerrar la conexión a la base de datos
$stmt->close();
$conexion->close();

?>
