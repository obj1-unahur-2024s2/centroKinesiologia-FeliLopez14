import aparatos.*
import pacientes.*

object centro{
    const aparatos = []
    const pacientes = []

    method coloresDeAparatos() = aparatos.map({a => a.color()}).asSet()
    method pacientesMenoresDe8() = pacientes.filter({p => p.edad() < 8})
    method pacientesQueNoPuedenHacerSesion() = pacientes.count({p => !p.puedeHacerRutina()})
    method estaEnCondiciones() = aparatos.all({a => !a.necesitaMantenimiento()})
    method estaComplicado() = self.aparatosEnCondiciones() <= self.aparatosAReparar()
    method aparatosEnCondiciones() = aparatos.count({a => !a.necesitaMantenimiento()})
    method aparatosAReparar() = aparatos.count({a => a.necesitaMantenimiento()})
    method visitaTecnica(){
        self.aparatosAReparar().forEach({a => a.recibirMantenimiento()})
    }
}