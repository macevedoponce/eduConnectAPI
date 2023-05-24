<?php

include 'conexion.php';

$json=array();

if(isset($_GET["usuario"])){
  //echo password_hash("password123", PASSWORD_DEFAULT)."\n";
    
    $dni=$_GET['usuario'];
    $password=$_GET['contrasena'];

    $sentencia=$conexion->prepare("SELECT * FROM usuario WHERE dni=?");
    $sentencia->bind_param('s',$dni,);
    $sentencia->execute();
    $resultado = $sentencia->get_result();
    $fila = $resultado->fetch_assoc();
    $pass = $fila["password"];
    //echo $pass;
    if($fila && password_verify($password,$pass)){
       //echo json_encode($fila,JSON_UNESCAPED_UNICODE);
       $json['usuario'][]=$fila;
      }
    header('Content-Type: application/json');
    echo json_encode($json);

    $sentencia->close();
    $conexion->close();
} 


?>