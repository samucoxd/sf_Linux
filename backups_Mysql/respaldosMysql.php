<?php

$db_host = 'localhost'; //Host del Servidor MySQL
$db_name = 'sanfernandodb'; //Nombre de la Base de datos
$db_user = 'root'; //Usuario de MySQL
$db_pass = 'root'; //Password de Usuario MySQL

$fecha = date("h-m-s_d-m-Y"); //Obtenemos la fecha y hora para identificar el respaldo

// Construimos el nombre de archivo SQL Ejemplo: mibase_20170101-081120.sql
$salida_sql = "backups/{$db_name}_{$fecha}.sql"; 
if (is_writable("backups")) {
    
    if (file_exists($salida_sql)) {
        unlink($salida_sql);
    }else {
        $comando = "mysqldump -u {$db_user} -p'{$db_pass}' {$db_name} > {$salida_sql}";
        system($comando);

        $zip = new ZipArchive(); //Objeto de Libreria ZipArchive
	
        //Construimos el nombre del archivo ZIP Ejemplo: mibase_20160101-081120.zip
        $salida_zip = "backups/{$db_name}_{$fecha}zip";
        
        if($zip->open($salida_zip,ZIPARCHIVE::CREATE)===true) { //Creamos y abrimos el archivo ZIP
            $zip->addFile($salida_sql); //Agregamos el archivo SQL a ZIP
            $zip->close(); //Cerramos el ZIP
            unlink($salida_sql); //Eliminamos el archivo temporal SQL
            //header ("Location: $salida_zip"); // Redireccionamos para descargar el Arcivo ZIP
            } else {
            echo 'Error'; //Enviamos el mensaje de error
        }
    }
}else {
    echo "El Directorio no tiene permisos de escritura.";
}

?>