<?php

// Archivo de conexión a la base de datos
require_once 'conexion.php';
$url = "http://192.168.1.35/educonnectAPI/tarea/";
$json=array();
if(isset($_GET["id_tarea"])){
    // Obtener el id_tarea de la solicitud
    $idTarea = $_GET['id_tarea'];

    // Consulta para obtener los registros de entrega_tarea y los nombres y apellidos de usuario
    $consulta = "SELECT entrega_tarea.*, usuario.nombres, usuario.apellidos
    FROM entrega_tarea
    INNER JOIN usuario ON entrega_tarea.id_usuario = usuario.id
    WHERE entrega_tarea.id_tarea = $idTarea";

    // Ejecutar la consulta
    $resultado = mysqli_query($conexion, $consulta);

    if($resultado){
        while ($fila = mysqli_fetch_array($resultado)) {
            // Extraer solo los campos necesarios de entrega_tarea y usuario
            $entrega["id"] = (int)$fila["id"];
            $entrega["retroalimentacion"] = $fila["retroalimentacion"];
            $entrega["url_trabajo"] = $url.$fila["url_trabajo"];
            $entrega["nota"] = (float)$fila["nota"];
            $entrega["id_tarea"] = (int)$fila["id_tarea"];
            $entrega["id_usuario"] = (int)$fila["id_usuario"];
            $entrega["nombres"] = $fila["nombres"];
            $entrega["apellidos"] = $fila["apellidos"];
            $json['tareas_entregadas'][] = $entrega;
        }
    }else{
        $resulta["id"]=0;
        $resulta["tareas"]='No se encontro ninguna entrega';
        $json['tareas_entregadas'][]=$resulta;
    }
    // Devolver los resultados como respuesta en formato JSON
    mysqli_close($conexion);
	header('Content-Type: application/json');
	echo json_encode($json);
}else{
    // En caso de error, devolver una respuesta de error en formato JSON
    $resulta["id"]=0;
    $resulta["tareas"]='No se encontro ninguna entrega';
    $json['tareas_entregadas'][]=$resulta;
    header('Content-Type: application/json');
    echo json_encode($json);
}

?>
