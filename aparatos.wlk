import pacientes.*
class Maquina{
    var property color = "Blanco"
    method puedeUsarseEn(unPaciente)
    method sufrirConsecuencias(unPaciente)
    method necesitaMantenimiento() = false
    method recibirMantenimiento(){}
}

class Magneto inherits Maquina{
    var imantacion 
    
    override method sufrirConsecuencias(unPaciente) {
        unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
        imantacion -= 1
    }
    override method necesitaMantenimiento() {return imantacion < 100}
    override method puedeUsarseEn(unPaciente) = true
}


class Bicicleta inherits Maquina{
    var desajustesDeTornillos = 0
    var perdidasDeAceite = 0

    override method puedeUsarseEn(unPaciente) = unPaciente.edad() > 8
    override method sufrirConsecuencias(unPaciente) {
        if(unPaciente.nivelDeDolor() > 30){ 
            desajustesDeTornillos += 1
        }else if(unPaciente.eded().between(30, 50)){
            perdidasDeAceite += 1
        }

    }
    override method necesitaMantenimiento() {
        return desajustesDeTornillos >= 10 or perdidasDeAceite >= 5
    }
    override method recibirMantenimiento(){
        desajustesDeTornillos = 0
        perdidasDeAceite = 0
    }
}


class Minitramp inherits Maquina{
    override method puedeUsarseEn(unPaciente) = unPaciente.nivelDeDolor() < 20
}