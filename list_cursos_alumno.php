<?PHP
include 'conexion.php';

$json=array();
if(isset($_GET["id_usuario"])){

        $id_usuario = $_GET['id_usuario'];
        
		$consulta="SELECT c.id,
        c.curso_codigo AS cursoCodigo,
        c.nombre AS cursoNombre, 
        g.nombre AS grado, 
        s.nombre AS seccion,
        c.url_imagen
        
        FROM curso c
        INNER JOIN curso_alumno ca on c.id = ca.curso_id
        JOIN grado g ON c.grado_id = g.id
        JOIN seccion s ON c.seccion_id = s.id
        WHERE ca.usuario_id = '{$id_usuario}'";
		
		$resultado=mysqli_query($conexion,$consulta);
		
		while($registro=mysqli_fetch_array($resultado)){
			$result["id"]=$registro['id'];
			$result["cursoCodigo"]=$registro['cursoCodigo'];
			$result["cursoNombre"]=$registro['cursoNombre'];
			$result["grado"]=$registro['grado'];
			$result["seccion"]=$registro['seccion'];
			$result["img_url"]=$registro['url_imagen'];
			$json['cursos'][]=$result;
			//echo $registro['id'].' - '.$registro['nombre'].'<br/>';
		}
		mysqli_close($conexion);
		header('Content-Type: application/json');
		echo json_encode($json);
    }else{
        $resulta["id"]=0;
        $resulta["cursos"]='No registra Cursos';
        header('Content-Type: application/json');
        echo json_encode($json);
    }
?>