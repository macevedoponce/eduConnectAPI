<?php
include 'conexion.php';

$tipoTarea = $_POST['tipoTarea'];
$idEstudiante = $_POST['idEstudiante'];
$idTarea = $_POST['idTarea'];
$file = $_POST['file'];

// Ruta de la carpeta para guardar los archivos
$carpeta = 'tarea/';

// Obtener la fecha actual
$fechaActual = date('YmdHis');

if ($tipoTarea == 1) {
    // Decodificar la imagen base64
    $data = base64_decode($file);

    // Generar el nombre del archivo
    $nombreArchivo = $fechaActual . '_' . $idEstudiante . '_' . $idTarea . '.jpg';

    // Guardar la imagen en la carpeta
    file_put_contents($carpeta . $nombreArchivo, $data);
} else {
    // Generar el nombre del archivo
    $nombreArchivo = $fechaActual . '_' . $idEstudiante . '_' . $idTarea . '.pdf';

    // Guardar el archivo PDF en la carpeta
    move_uploaded_file($_FILES['file']['tmp_name'], $carpeta . $nombreArchivo);
}

// Guardar los datos en la tabla "entrega_tarea"
$consulta = "INSERT INTO entrega_tarea (id, retroalimentacion, url_trabajo, nota, id_tarea, id_usuario) VALUES (NULL, '', '$nombreArchivo', '', $idTarea, $idEstudiante)";

if ($conexion->query($consulta)) {
    echo "Datos guardados correctamente";
} else {
    echo "Error al guardar los datos: " . $conexion->error;
}

$conexion->close();
?>
