<?php
// insertuser.php

// Incluir la configuración de la base de datos
include 'config.php';

// Datos del nuevo usuario
$nom = $_POST['Nom'] ?? NULL;
$cognom = $_POST['Cognoms'] ?? NULL;
$email = $_POST['Email'] ?? NULL;
$contrasenya = $_POST['Pass'] ?? NULL;
$dataNaixement = $_POST['DataNaiximent'] ?? NULL;
$poblacio = $_POST['Poblacio'] ?? NULL;
$imatgePerfil = $_FILES['Imatge']['tmp_name'] ?? NULL; // Obtener la ubicación temporal del archivo
$imatgePerfilContenido = file_get_contents($imatgePerfil); // Leer el contenido del archivo
$rol = $_POST['Rol'] ?? NULL;

// Verificar que todos los datos requeridos estén presentes
if ($nom && $cognom && $email && $contrasenya && $dataNaixement && $poblacio && $imatgePerfil && $rol) {
    // Cifrar la contraseña
    $contrasenyaCifrada = password_hash($contrasenya, PASSWORD_BCRYPT);
    if ($rol == 'Admin') {
        $sql = "INSERT INTO Usuari (Nom, Cognom, Email, Contrasenya, DataNaixement, Poblacio, ImatgePerfil, Rol)
            VALUES ('$nom', '$cognom', '$email', '$contrasenya', '$dataNaixement', '$poblacio', '$imatgePerfil', '$rol')";
    } else {
        $sql = "INSERT INTO Usuari (Nom, Cognom, Email, Contrasenya, DataNaixement, Poblacio, ImatgePerfil, Rol)
            VALUES ('$nom', '$cognom', '$email', '$contrasenyaCifrada', '$dataNaixement', '$poblacio', '$imatgePerfil', '$rol')";
    }
    // Consulta para insertar un nuevo usuario
    if ($conn->query($sql) === TRUE) {
        echo "Nuevo usuario creado exitosamente";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Error: Datos requeridos no proporcionados";
}

// Cerrar conexión
$conn->close();
?>