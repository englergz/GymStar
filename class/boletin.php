<?php
    include_once "../class/base_de_datos.php";
    $email = $_POST['email'];
    $ok = false;
    if(strlen($email) == 0 ){
        $ok = false;
    }
    else{
            $sentecia = $base_de_datos->prepare("INSERT INTO public.boletin(email) VALUES (:email);");
            $sentecia->bindValue(':email', $email, PDO::PARAM_STR);

            try {
                $sentecia->execute();
                $res = $sentecia->fetchAll(PDO::FETCH_OBJ);                
                $ok = true;
            }
            catch(Exception $e){
                $ok = false;
            }  
        }
        if($ok==true){
            echo '<div class="alert alert-success" role="alert"> ¡Inscripción éxitosa!</div>';
        }
        else {
            echo '<div class="alert alert-danger" role="alert"> ¡No fue posible realizar el registro!</div>';
        }   
?>