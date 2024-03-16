<?PHP
include 'conexion.php';

$json=array();
if(isset($_GET["id_usuario"])){

        $id_usuario = $_GET['id_usuario'];
        
		$consulta="SELECT c.curso_id,
        c.curso_nombre AS cursoNombre, 
        g.grado_nombre AS grado, 
        s.seccion_nombre AS seccion,
        c.curso_foto AS url_imagen
        
        FROM Cursos c
        JOIN Grados g ON c.id_grado = g.grado_id
        JOIN Secciones s ON c.id_seccion = s.seccion_id
        WHERE c.id_user = '{$id_usuario}'";
		
		$resultado=mysqli_query($conexion,$consulta);
		
		while($registro=mysqli_fetch_array($resultado)){
			$result["id"]=$registro['curso_id'];
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