<?php
    include_once "base_de_datos.php";

    $nombre = $_POST['nombre'];
    $email = $_POST['email'];
    $cellular = $_POST['cellular'];
    $fecha = $_POST['fecha'];
    $hora = $_POST['hora'];
    $mensaje = $_POST['mensaje'];
    $ok = false;

    if(strlen($email) == 0 ){
        $ok = false;
    }
    else{ 
            if(strlen($nombre) == 0){
                $ok = false;
            }else{
                    $sentecia = $base_de_datos->prepare("INSERT INTO public.reserva(nombre, email, celular, fecha, hora, mensaje) VALUES (:nombre, :email, :cellular, :fecha, :hora, :mensaje);");
                    $sentecia->bindValue(':nombre', $nombre, PDO::PARAM_STR);
                    $sentecia->bindValue(':email', $email, PDO::PARAM_STR);
                    $sentecia->bindValue(':cellular', $cellular, PDO::PARAM_STR);
                    $sentecia->bindValue(':fecha', $fecha, PDO::PARAM_STR);
                    $sentecia->bindValue(':hora', $hora, PDO::PARAM_STR);
                    $sentecia->bindValue(':mensaje', $mensaje, PDO::PARAM_STR);
                    try {
                        $sentecia->execute();
                        $res = $sentecia->fetchAll(PDO::FETCH_OBJ);                
                        $ok = true;
                    }
                    catch(Exception $e){
                        $ok = false;
                    }
                }
    }  
    if($ok == true){
        echo '¡Reserva exitosa!';
    }          
?>     