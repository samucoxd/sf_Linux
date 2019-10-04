<?php
include '../config/conexion.php';

class mysql{

    protected $con;
    protected $db;
    function __construct(){
        $this->db = new Connection();
        $this->con = $this->db->openConnection(); 
    }

    public function select($tabla){
        try {
            $data = $this->con->query("SELECT * FROM {$tabla}")->fetchAll();
        
            return $data;
        } catch (PDOException $e) {
            echo "Error al realizar el Select".$e->getMessage();    
        }
    }

    function __destruct(){
        $this->con = $this->db->closeConnection(); 
        $this->con = null;
    }
}

?>