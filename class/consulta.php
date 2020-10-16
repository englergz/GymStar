
<?php
    include_once "base_de_datos.php";
        
    $email = $_POST['email'];
    $ok = true;

    if(strlen($email) == 0 ){
        $ok = false;
    }else{
        $sentecia = $base_de_datos->prepare("SELECT * FROM public.reserva WHERE email=:email;");
        $sentecia->bindValue(':email', $email, PDO::PARAM_STR);     
        try {
            $sentecia->execute();
            $res = $sentecia->fetchAll(PDO::FETCH_OBJ);  
            if($res == null){
                echo '<div class="card-title">No se encontra ninguna reserva con: <b>'.$_POST['email'].'</b></div>';
            }else{
                echo '<div class="col-sm-18">';
                echo '<div class="card-body">';
                echo '<h1 class="card-title">'.(ucwords($res[0]->nombre)).'</h1>';                            
                echo '<p class="card-text">';
                echo ''.$res[0]->email.'<br/><br/>';
                for ($i=0; $i < sizeof($res); $i++) { 
                    echo '<b>Celular: </b>'.$res[$i]->celular.'<br/>';
                    echo '<b>Fecha: </b>'.$res[$i]->fecha.'<br/>';
                    echo '<b>Hora: </b>'.$res[$i]->hora.'<br/>';                   
                    echo '</p></div></div>'; 
                }
            }
        }
        catch(Exception $e){
        }   
    }
?>    
    