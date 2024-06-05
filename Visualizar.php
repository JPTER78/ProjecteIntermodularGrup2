<?php
function consultar($conexion, $consulta){
    $datos = mysqli_query($conexion, $consulta);

    echo "<table>";
    echo "<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Email</th><th>Contraseña</th><th>Fecha de Nacimiento</th><th>Población</th><th>Imagen de Perfil</th><th>Rol</th></tr>";  
    while ($fila = mysqli_fetch_array($datos)) {
        $idUsuari = $fila["IDUsuari"];
        $nom = $fila["Nom"];
        $cognom = $fila["Cognom"];
        $email = $fila["Email"];
        $contrasenya = $fila["Contrasenya"];
        $dataNaixement = $fila["DataNaixement"];
        $poblacio = $fila["Poblacio"];
        $imatgePerfil = $fila["ImatgePerfil"];
        $rol = $fila["Rol"];

        // Convertir el BLOB a una imagen base64
        $imatgePerfilBase64 = base64_encode($imatgePerfil);

        echo "<tr><td>$idUsuari</td><td>$nom</td><td>$cognom</td><td>$email</td><td>$contrasenya</td><td>$dataNaixement</td><td>$poblacio</td><td><img src='data:image/;base64,$imatgePerfilBase64' alt='Base64 Image' width='50' height='50'></td><td>$rol</td></tr>"; 
    }
    echo "</table>";
}

// Conexión a la base de datos
$host = "localhost";
$usuario = "root";
$bd = "Equip2PI";
$port = 3306;
$pass = "";

$conexion = mysqli_connect($host, $usuario, $pass, $bd, $port);

if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $buscador = $_POST["Buscador"];
    $consulta = "SELECT * FROM Usuari WHERE Nom LIKE '%$buscador%'";
    consultar($conexion, $consulta);
}

// Cerrar la conexión
mysqli_close($conexion);
?>