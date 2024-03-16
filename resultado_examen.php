<?PHP
include 'conexion.php';

$json=array();
//if(isset($_GET["id_usuario"])){
    if(1==1){

        $id_usuario = $_GET['id_usuario'];
        
		$consulta="SELECT * FROM resultado_examen r INNER JOIN usuario u WHERE r.usuario_id = u.id ORDER BY nota DESC;"; //debemos obtener el id de curso, examen
		
		$resultado=mysqli_query($conexion,$consulta);
		
		while($registro=mysqli_fetch_array($resultado)){
			$result["id"]=$registro['id'];
			$result["name"]=$registro['nombres'];
			$result["score"]=$registro['nota'];
			$result["pic"]=$registro['foto'];
			$json['resExamen'][]=$result;
		}
		mysqli_close($conexion);
		header('Content-Type: application/json');
		echo json_encode($json);
    }else{
        $resulta["id"]=0;
        $resulta["resExamen"]='No registra Resultados de examen';
        header('Content-Type: application/json');
        echo json_encode($json);
    }
?>