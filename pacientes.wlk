import aparatos.*
class Paciente{
    const property edad
    var fortalezaMuscular
    var nivelDeDolor
    var property cantidadConfigurable = 3
    const property rutinaAsignada = []

    method fortalezaMuscular() = fortalezaMuscular
    method nivelDeDolor() = nivelDeDolor
    method usarAparato(unAparato) {
         if(self.puedeUsar(unAparato)){
            unAparato.sufrirConsecuencias()
         }
    }
    method disminuirDolor(unValor) {
        nivelDeDolor = (nivelDeDolor - unValor).max(0)
    }
    method aumentarFortaleza(unValor) {
        fortalezaMuscular += unValor
    }
    method puedeUsar(unAparato) = unAparato.puedeUsarseEn(self)
    method hacerRutina() {rutinaAsignada.forEach({m => self.usarAparato(m)})}
    method puedeHacerRutina() = rutinaAsignada.all({m => m.puedeUsarseEn(self)})
    method agregarUnaRutina(rutina) {
        rutinaAsignada.clear()
        rutinaAsignada.addAll(rutina)
    }
}


class PacienteResistente inherits Paciente{
    override method hacerRutina(){
        super()
        self.aumentarFortaleza(rutinaAsignada.size())
    }
}


class PacienteCaprichoso inherits Paciente{
    override method puedeHacerRutina(){return super() && rutinaAsignada.any({a => a.color() == "Rojo"})}
    override method hacerRutina(){
        super()
        super()
    }
}


class PacienteRecuperacion inherits Paciente{
    override method hacerRutina(){
        super()
        self.disminuirDolor(cantidadConfigurable)
    }
}