<?PHP
include 'conexion.php';

$json=array();
if(isset($_GET["id_curso"])){

        $id_curso = $_GET['id_curso'];

		if(isset($_GET["id_usuario"])){
			$id_usuario = $_GET['id_usuario'];
			//$consulta="SELECT * FROM tarea t INNER JOIN entrega_tarea et WHERE et.id_tarea = t.id AND t.curso_id ='{$id_curso}' AND t.estado_id = 1 AND et.id_usuario = '{$id_usuario}' ORDER BY t.id DESC;";

			$consulta=" SELECT t.id AS tarea_id, t.titulo, t.descripcion, t.fecha_limite, t.estado_id, t.curso_id,
				et.id AS entrega_id, et.retroalimentacion, et.url_trabajo, et.nota
			FROM tarea t
			LEFT JOIN entrega_tarea et ON et.id_tarea = t.id AND et.id_usuario = '{$id_usuario}'
			WHERE t.curso_id = '{$id_curso}' AND t.estado_id = 1
			ORDER BY t.id DESC;
			";

			$resultado=mysqli_query($conexion,$consulta);
		
			while($registro=mysqli_fetch_array($resultado)){
				$result["id"]=(int)$registro['tarea_id'];
				$result["titulo"]=$registro['titulo'];
				$result["descripcion"]=$registro['descripcion'];
				$result["fecha_limite"]=$registro['fecha_limite'];
				$result["retroalimentacion"]=$registro['retroalimentacion'];
				$result["url_trabajo"]=$registro['url_trabajo'];
				$result["nota"]=(int)$registro['nota'];
				$json['tareas'][]=$result;
				//echo $registro['id'].' - '.$registro['nombre'].'<br/>';
			}
			mysqli_close($conexion);
			header('Content-Type: application/json');
			echo json_encode($json);

		}else{
			$consulta="SELECT * FROM tarea WHERE curso_id ='{$id_curso}' ORDER BY id DESC";
			$resultado=mysqli_query($conexion,$consulta);
		
		while($registro=mysqli_fetch_array($resultado)){
			$result["id"]=(int)$registro['id'];
			$result["titulo"]=$registro['titulo'];
			$result["descripcion"]=$registro['descripcion'];
			$result["fecha_limite"]=$registro['fecha_limite'];
			$result["estado"]=(int)$registro['estado_id'];
			$result["curso_id"]=(int)$registro['curso_id'];
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