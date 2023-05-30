<?php

// Incluir el archivo de conexión
require 'conexion.php';

// Obtener los datos enviados por POST
$pregunta_nombre = $_POST['pregunta_nombre'];
$pregunta_retroalimentacion = $_POST['pregunta_retroalimentacion'];
$pregunta_puntaje = $_POST['pregunta_puntaje'];
$alternativa_correcta = $_POST['alternativa_correcta'];
$alternativa_incorrecta1 = $_POST['alternativa_incorrecta1'];
$alternativa_incorrecta2 = $_POST['alternativa_incorrecta2'];
$alternativa_incorrecta3 = $_POST['alternativa_incorrecta3'];

// Preparar la consulta SQL
$stmt = $conexion->prepare("INSERT INTO pregunta (nombre, retroalimentacion, puntaje) VALUES (?, ?, ?)");
$stmt->bind_param("ssi", $pregunta_nombre, $pregunta_retroalimentacion, $pregunta_puntaje);

// Ejecutar la consulta de la pregunta y verificar el resultado
if ($stmt->execute()) {
    // Obtener el ID de la pregunta insertada
    $id_pregunta = $stmt->insert_id;

    // Preparar la consulta para insertar las alternativas
    $alternativas_query = "INSERT INTO alternativa (nombre, pregunta_id, es_correcta) VALUES ";

    // Agregar las alternativas a la consulta
    $alternativas_query .= "('".$alternativa_correcta."', ".$id_pregunta.", 1), ";
    $alternativas_query .= "('".$alternativa_incorrecta1."', ".$id_pregunta.", 0), ";
    $alternativas_query .= "('".$alternativa_incorrecta2."', ".$id_pregunta.", 0), ";
    $alternativas_query .= "('".$alternativa_incorrecta3."', ".$id_pregunta.", 0)";

    // Ejecutar la consulta de las alternativas
    if ($conexion->query($alternativas_query)) {
        $response = array(
            'status' => 'success',
            'message' => 'Pregunta y alternativas agregadas exitosamente'
        );
    } else {
        $response = array(
            'status' => 'error',
            'message' => 'Error al agregar las alternativas: ' . $conexion->error
        );
    }
} else {
    $response = array(
        'status' => 'error',
        'message' => 'Error al agregar la pregunta: ' . $stmt->error
    );
}

// Devolver la respuesta como JSON
header('Content-Type: application/json');
echo json_encode($response);

// Cerrar la conexión a la base de datos
$stmt->close();
$conexion->close();

?>
