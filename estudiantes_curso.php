<?php

    // Archivo de conexión a la base de datos
    require_once 'conexion.php';
    
$json=array();
if(isset($_GET["curso_id"])){

    // Obtener los valores de los parámetros grupo_id y fecha_actual enviados por el usuario
    $curso_id = $_GET['curso_id'];
    $fecha_actual = $_GET['fecha_actual'];

    // Preparar la consulta SQL para obtener los datos de participante y, si existe, asistencia
    //$consulta = "SELECT usuario.id, usuario.dni, usuario.nombres, usuario.apellidos, asistencia.fecha, asistencia.estado,asistencia.curso_id
    //FROM curso_alumno JOIN usuario ON curso_alumno.usuario_id = usuario.id LEFT JOIN asistencia ON curso_alumno.usuario_id = asistencia.usuario_id 
    //AND asistencia.fecha = '$fecha_actual' WHERE curso_alumno.curso_id = $curso_id AND usuario.rol = 2";

    $consulta ="SELECT u.user_id, u.user_nombres, u.user_apellidos, u.user_dni, ra.ra_fecha, ra.ra_estado
    FROM Curso_Alumnos ca
    JOIN Users u ON ca.id_user = u.user_id
    LEFT JOIN Registro_Asistencias ra ON ca.id_user = ra.id_usuario AND ca.id_curso = ra.id_curso AND ra.ra_fecha = $fecha_actual
    WHERE ca.id_curso = $curso_id AND u.id_rol = 2";

    
            
    // Ejecutar la consulta
    $resultado = mysqli_query($conexion, $consulta);

    if($resultado){
        while ($fila = mysqli_fetch_assoc($resultado)) {
            // Extraer solo los campos necesarios de entrega_tarea y usuario
            $entrega["id"] = (int)$fila["user_id"];
            $entrega["dni"] = $fila["user_dni"];
            $entrega["nombres"] = $fila["user_nombres"];
            $entrega["apellidos"] = $fila["user_apellidos"];
            $entrega["fecha"] = $fila["ra_fecha"];
            $entrega["estado"] = $fila["ra_estado"];
            $json['estudiantes'][] = $entrega;
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
