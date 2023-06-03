<?PHP
include 'conexion.php';

$json=array();
$conexion = mysqli_connect($hostname,$username,$password,$database);

$consulta="select * from examen";
$resultado=mysqli_query($conexion,$consulta);

while($registro=mysqli_fetch_array($resultado)){
	$result["id"]=$registro['id'];
	$result["nombre"]=$registro['nombre'];
	$result["descripcion"]=$registro['descripcion'];
	$result["estado_id"]=$registro['estado_id'];
	$json['examen'][]=$result;
	//echo $registro['id'].' - '.$registro['nombre'].'<br/>';
}
mysqli_close($conexion);
echo json_encode($json);
?>