object neo{
    var energia = 100
    var vitalidad = energia/10
    
    method esElegido() = true 

    method saltar(){
        energia = energia /2
    }

    method vitalidad() = energia /10
}


object morfeo{
    var vitalidad =8
    var estaCansado = false
   
    method esElegido() = false
   
    method saltar(){
        estaCansado = not estaCansado
        vitalidad = (vitalidad -1).max(0)
    }
    method vitalidad() = vitalidad
}

object trinity{
    method vitalidad() = 0
    method esElElegido() = false
    method saltar(){}
}

object nave{
    const pasajeros = []

    method subirPasajeros(unPasajero){
        pasajeros.add(unPasajero)
    }
    method bajarPasajeros(unPasajero){
        pasajeros.remove(unPasajero)
    }
    method cantidadPasajeros(){
        return pasajeros.size()
    }
    method elPasajeroConMasVitalidad(){
        return pasajeros.max({unPasajero => unPasajero.vitalidad()})
    }
    method laMayorVitalidad(){
        //neo - neo.vitalidad() - return :10
        return pasajeros.max({unPasajero => unPasajero.vitalidad()}).max()

        return self.elPasajeroConMasVitalidad().vitalidad()
    }
    method estaEquilobrada(){
        return self.elPasajeroConMasVitalidad().vitalidad() =< min*2
    }
    method estaElElegido(){
        return pasajeros.any({unPasajero => unPasajero.esElElegido()})
    }
    method chocar(){
        pasajeros.forEach({ p => p.saltar()})
        pasajeros.clear()
    }
    method acelerar(){
        pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})
    }
}