<?php
    Class Connection {
    private  $server = "mysql:host=localhost;dbname=controlpedido";
<<<<<<< HEAD
    private  $user = "root";
    private  $pass = "DBfnROOT789@";
=======
    private  $user = "samucoxd";
    private  $pass = "samucoxd";
>>>>>>> ab00cd7eeba80192e86c53eca7c7674abf5b71ff
    private $options  = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,);
    
    protected $con;
     
        public function openConnection()
        {
            try
                {
                    $this->con = new PDO($this->server,$this->user,$this->pass,$this->options);
                    return $this->con;
                }
            catch (PDOException $e)
                {
                    echo "There is some problem in connection: " . $e->getMessage();
                }
        }

        public function closeConnection() 
        {
            $this->con = null;
        }
    }

?>
