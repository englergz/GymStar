
<?php
include_once "../class/base_de_datos.php";
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel="icon" type="image/png" href="../img/logo.ico" />
        <title>Contacto</title>
        
    </head>
  <body>
    <br/><br/>
    <div class="container"> 
      <?php
          $nom = $_POST['nom'];
          $email = $_POST['email'];
          $mensaje = $_POST['mensaje'];
          $ok = false;
          $sentecia = $base_de_datos->prepare("INSERT INTO public.contacto(nombre, email, mensaje) VALUES (:nom, :email, :mensaje);");
          $sentecia->bindValue(':nom', $nom, PDO::PARAM_STR);
          $sentecia->bindValue(':email', $email, PDO::PARAM_STR);
          $sentecia->bindValue(':mensaje', $mensaje, PDO::PARAM_STR);
          try {
              $sentecia->execute();
              $res = $sentecia->fetchAll(PDO::FETCH_OBJ);                
              $ok = true;
          }
          catch(Exception $e){
              $ok = false;
          }
          if($ok == true){
            echo '¡Mensaje enviado exitosamente!';
          }  
        ?>         
    </div>
  </body>
</html>