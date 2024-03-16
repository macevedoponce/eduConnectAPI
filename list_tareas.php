<?PHP
include 'conexion.php';

$json=array();
if(isset($_GET["id_curso"])){

        $id_curso = $_GET['id_curso'];

		if(isset($_GET["id_usuario"])){
			$id_usuario = $_GET['id_usuario'];
			//$consulta="SELECT * FROM tarea t INNER JOIN entrega_tarea et WHERE et.id_tarea = t.id AND t.curso_id ='{$id_curso}' AND t.estado_id = 1 AND et.id_usuario = '{$id_usuario}' ORDER BY t.id DESC;";

			$consulta=" 
			SELECT t.tarea_id AS tarea_id, t.tarea_nombre, t.tarea_descripcion, t.tarea_fecha_limite, t.tarea_estado, t.id_curso,
				et.et_id AS entrega_id, et.et_retroalimentacion, et.et_url_trabajo, et.et_nota
			FROM Tareas t
			LEFT JOIN Entrega_Tareas et ON et.id_tarea = t.tarea_id AND et.id_usuario = '{$id_usuario}'
			WHERE t.id_curso = '{$id_curso}'  AND t.tarea_estado = 1
			ORDER BY t.tarea_id DESC;";

			$resultado=mysqli_query($conexion,$consulta);
		
			while($registro=mysqli_fetch_array($resultado)){
				$result["id"]=(int)$registro['tarea_id'];
				$result["titulo"]=$registro['tarea_nombre'];
				$result["descripcion"]=$registro['tarea_descripcion'];
				$result["fecha_limite"]=$registro['tarea_fecha_limite'];
				$result["retroalimentacion"]=$registro['et_retroalimentacion'];
				$result["url_trabajo"]=$registro['et_url_trabajo'];
				$result["nota"]=(int)$registro['et_nota'];
				$json['tareas'][]=$result;
				//echo $registro['id'].' - '.$registro['nombre'].'<br/>';
			}
			mysqli_close($conexion);
			header('Content-Type: application/json');
			echo json_encode($json);

		}else{
			$consulta="SELECT * FROM Tareas WHERE id_curso ='{$id_curso}' ORDER BY tarea_id DESC";
			$resultado=mysqli_query($conexion,$consulta);
		
		while($registro=mysqli_fetch_array($resultado)){
			$result["id"]=(int)$registro['tarea_id'];
			$result["titulo"]=$registro['tarea_nombre'];
			$result["descripcion"]=$registro['tarea_descripcion'];
			$result["fecha_limite"]=$registro['tarea_fecha_limite'];
			$result["estado"]=(int)$registro['tarea_estado'];
			$result["curso_id"]=(int)$registro['id_curso'];
			$json['tareas'][]=$result;
			//echo $registro['id'].' - '.$registro['nombre'].'<br/>';
		}
		mysqli_close($conexion);
		header('Content-Type: application/json');
		echo json_encode($json);
		}
        
		
    }else{
        $resulta["id"]=0;
        $resulta["tareas"]='No registra Cursos';
        header('Content-Type: application/json');
        echo json_encode($json);
    }
?>