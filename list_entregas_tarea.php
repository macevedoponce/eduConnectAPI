<?php

// Archivo de conexión a la base de datos
require_once 'conexion.php';
$url = "http://192.168.18.53/eduConnectAPI/tarea/";
$json=array();
if(isset($_GET["id_tarea"])){
    // Obtener el id_tarea de la solicitud
    $idTarea = $_GET['id_tarea'];

    // Consulta para obtener los registros de entrega_tarea y los nombres y apellidos de usuario
    $consulta = "SELECT Entrega_Tareas.*, Users.user_nombres, Users.user_apellidos
    FROM Entrega_Tareas
    INNER JOIN Users ON Entrega_Tareas.id_usuario = Users.user_id
    WHERE Entrega_Tareas.id_tarea = $idTarea";

    // Ejecutar la consulta
    $resultado = mysqli_query($conexion, $consulta);

    if($resultado){
        while ($fila = mysqli_fetch_array($resultado)) {
            // Extraer solo los campos necesarios de entrega_tarea y usuario
            $entrega["id"] = (int)$fila["et_id"];
            $entrega["retroalimentacion"] = $fila["et_retroalimentacion"];
            $entrega["url_trabajo"] = $url.$fila["et_url_trabajo"];
            $entrega["nota"] = (float)$fila["et_nota"];
            $entrega["id_tarea"] = (int)$fila["id_tarea"];
            $entrega["id_usuario"] = (int)$fila["id_usuario"];
            $entrega["nombres"] = $fila["user_nombres"];
            $entrega["apellidos"] = $fila["user_apellidos"];
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
