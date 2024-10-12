<?php
    $pass = getenv('DB_PASSWORD');
    $usuario = getenv('DB_USERNAME');
    $nomdb = getenv('DB_DATABASE');
    $rutaServidor = getenv('DB_HOST');
    $puerto = getenv('DB_PORT');


    try {
        $base_de_datos = new PDO("pgsql:host=$rutaServidor;port=$puerto;dbname=$nomdb", $usuario, $pass);
        $base_de_datos->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch(Exception $e){
        echo "¡Ocurrió un error! Tranquilo, el problema es nuestro, intenta más tarde: ".$e->getMessage();
    }
?>
