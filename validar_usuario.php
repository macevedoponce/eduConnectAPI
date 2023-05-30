
<?php

include 'conexion.php';

$json=array();

if(isset($_GET["usuario"])){

    $dni=$_GET['usuario'];
    $password=$_GET['contrasena'];
    $rol=$_GET['tipo_usuario'];

    $sentencia=$conexion->prepare("SELECT * FROM usuario WHERE dni=? and rol = ?");
    $sentencia->bind_param('si',$dni,$rol);
    $sentencia->execute();
    $resultado = $sentencia->get_result();
    $fila = $resultado->fetch_assoc();
    if($fila && password_verify($password,$fila['password'])){
       //echo json_encode($fila,JSON_UNESCAPED_UNICODE);
       $json['usuario'][]=$fila;
      }
    header('Content-Type: application/json');
    echo json_encode($json);

    $sentencia->close();
    $conexion->close();
} 


?>
