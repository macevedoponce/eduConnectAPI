<?PHP
include 'conexion.php';

$json=array();
//if(isset($_GET["id_usuario"])){
    if(1==1){

        $id_usuario = $_GET['id_usuario'];
        
		$consulta="SELECT pregunta.id, pregunta.nombre 
        AS nombre_pregunta, pregunta.retroalimentacion, pregunta.puntaje, alternativa.id 
        AS id_alternativa, alternativa.nombre 
        AS nombre_alternativa 
        FROM pregunta INNER JOIN alternativa ON pregunta.id = alternativa.pregunta_id"; //debemos obtener el id de curso, examen
		
		$resultado=mysqli_query($conexion,$consulta);
		
		while($registro=mysqli_fetch_array($resultado)){
			$result["id"]=$registro['id'];
			$result["nombre"]=$registro['nombre'];
			$result["retroalimentacion"]=$registro['retroalimentacion'];
			$result["puntaje"]=$registro['puntaje'];
            $result["alternativas"]=$registro['alternativas'];

			$json['preguntas'][]=$result;
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