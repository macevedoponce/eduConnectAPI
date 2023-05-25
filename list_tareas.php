<?PHP
include 'conexion.php';

$json=array();
if(isset($_GET["id_curso"])){

        $id_curso = $_GET['id_curso'];
        
		$consulta="SELECT * FROM tarea WHERE curso_id ='{$id_curso}'";
		
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
    }else{
        $resulta["id"]=0;
        $resulta["tareas"]='No registra Cursos';
        header('Content-Type: application/json');
        echo json_encode($json);
    }
?>