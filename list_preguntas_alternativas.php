<?php
include 'conexion.php';

$json = array();
$conexion = mysqli_connect($hostname, $username, $password, $database);

$consulta = "SELECT pregunta.id, pregunta.nombre AS nombre_pregunta, pregunta.retroalimentacion, pregunta.puntaje, alternativa.id AS id_alternativa, alternativa.nombre AS nombre_alternativa FROM pregunta LEFT JOIN alternativa ON pregunta.id = alternativa.pregunta_id";
$resultado = mysqli_query($conexion, $consulta);

while ($registro = mysqli_fetch_array($resultado)) {
    $preguntaId = $registro['id'];

    // Verificar si la pregunta ya existe en el array $json
    if (!isset($json[$preguntaId])) {
        $pregunta = array(
            "id" => $preguntaId,
            "nombre" => $registro['nombre_pregunta'],
            "retroalimentacion" => $registro['retroalimentacion'],
            "puntaje" => $registro['puntaje'],
            "alternativas" => array()
        );
        $json[$preguntaId] = $pregunta;
    }

    // Agregar la alternativa a la pregunta correspondiente
    if (!empty($registro['id_alternativa'])) {
        $alternativa = array(
            "id" => $registro['id_alternativa'],
            "nombre" => $registro['nombre_alternativa']
        );
        $json[$preguntaId]['alternativas'][] = $alternativa;
    }
}

mysqli_close($conexion);
echo json_encode(array_values($json));
?>
