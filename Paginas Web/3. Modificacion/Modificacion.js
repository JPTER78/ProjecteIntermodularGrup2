window.onload = function() {
    document.getElementById("Crear").style.display = "none";
    document.getElementById("Modificar").style.display = "none";
    document.getElementById("Eliminar").style.display = "none";
    document.getElementById("IDContainer").style.display = "none";
    document.getElementById("div").style.display = "none";
    var regex = /^(\d)+$/;

    $('#IDUsuari').keyup(function() {
        var valor = this.value;
        // Si el valor no esta vacio y cumple el regex...
        if ((valor.value == "") || (regex.test(valor)) == false){
          // ...oculta el div modificar, y si tiene valor correcto...
        $('#IDContainer').slideUp();
        } else {
          // ...lo muestra
        $('#IDContainer').slideDown();
        }
        }).keyup(); // Se activa en KeyUp.
    
}

function crearUsuari() {
    document.getElementById("Titulo").innerHTML = "Crear";
    document.getElementById("Crear").style.display = "grid";
    document.getElementById("Modificar").style.display = "none";
    document.getElementById("Eliminar").style.display = "none";
    document.getElementById("IDContainer").style.display = "none";
    
}

function modificarUsuari() {
    document.getElementById("Titulo").innerHTML = "Modificar";
    document.getElementById("Crear").style.display = "none";
    document.getElementById("Modificar").style.display = "grid";
    document.getElementById("Eliminar").style.display = "none";
    document.getElementById("IDContainer").style.display = "none";

    $("#IDUsuari").on("focusout", function() {
        $('#IDUsuari').keyup(function() {
            var valor = this.value;
            // Si el valor no esta vacio y cumple el regex...
            if ((valor.value == "") || (regex.test(valor)) == false){
              // ...oculta el div modificar, si tiene valor correcto...
            $('#IDContainer').slideUp();
            } else {
              // ...lo muestra
            $('#IDContainer').slideDown();
            }
            }).keyup(); // Se activa en KeyUp. Necesita estar en window.onload
        });
    }


function borrarUsuari() {
    document.getElementById("Titulo").innerHTML = "Eliminar";
    document.getElementById("Crear").style.display = "none";
    document.getElementById("Modificar").style.display = "none";
    document.getElementById("Eliminar").style.display = "grid";
    document.getElementById("IDContainer").style.display = "none";
}

function mostraUsuari() {
  document.getElementById('div').style.display = "grid";
}