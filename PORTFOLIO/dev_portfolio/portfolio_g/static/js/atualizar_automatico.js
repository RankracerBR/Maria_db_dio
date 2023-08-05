function atualizarHorario(){
    var horarioElement = document.getElementById('horario-atual');
    var now = new Date();
    var hora = now.getHours();
    var minutos = now.getMinutes();
    var segundos = now.getSeconds();

    hora = hora.toString().padStart(2,'0');
    minutos = minutos.toString().padStart(2,'0');
    segundos = segundos.toString().padStart(2,'0');

    horarioElement.innerText = hora + ":" + minutos + ":" + segundos;

}

setInterval(atualizarHorario, 1000);