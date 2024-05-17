function validarCorreo() {
    var correo = document.forms["form"]["email"].value;
    var regex = /^.+@(gmail|hotmail){1}\.(com|es)$/;
    if(regex.test(correo)) {
        alert("Registro exitoso.");
        
    } else {
        alert("El correo debe ser un correo valido. ej: ejemplo@gmail.com.");
    }
}