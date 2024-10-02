import wollok.game.*
import mapa.*
import tiempo.*
import sonidos.*

class Pollo{
	var property position = game.at(1,5)
	var property viajandoTronco = false
	var property name = "pollo"
	method image() = "pollo.png"

	method position(nuevaPosicion){
		game.getObjectsIn(nuevaPosicion).forEach{f =>
			if (f.name() == "tronco"){viajandoTronco = true}
			if (f.name() != "tronco"){viajandoTronco = false}
			
			if (f.name() == "meta"){
				meta.play()
				game.say(self, "ganaste!")

				game.removeTickEvent("tiempo")
				tiempo.mejor()
				tiempo.reset()
				
				game.schedule(4000, {mapa.terminar()})
			}

			if(f.name() == "pasto"){pasto.play()}
			if(f.name() == "calle"){calle.play()}
			if(f.name() == "tronco"){tronco.play()}
		}
		position = nuevaPosicion
	}

	method moverAbajo(){position = position.down(1)}
	method moverArriba(){position = position.up(1)}
	
	method tiempoTermina(){
		if (tiempo.tiempoSegundos() == 60){
			game.removeTickEvent("tiempo")
			game.say(self, "se acabo el tiempo!")
			game.schedule(2500, {mapa.terminar()})
		}
	}
}