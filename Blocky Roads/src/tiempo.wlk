import wollok.game.*
import mapa.*

object tiempo{
	const property position = game.at(5, 10)

	const property verde = "00FF00FF"
	
	var property tiempo = 0
	
	var property tiempoSegundos = 0
	var property tiempoMiliSegundos = 0
	var property mejorTiempoSegundos = 0
	var property mejorTiempoMiliSegundos = 0

	var property mejorTiempo = 0

	method colision() = true

	method text() = "tiempo = " + tiempoSegundos.toString() + ":" + tiempoMiliSegundos.toString() + 
	"\n mejor tiempo = " + mejorTiempoSegundos.toString() + ":" + mejorTiempoMiliSegundos.toString()

	method textColor() = verde

	method sumar(){
		tiempo += 1
		tiempoMiliSegundos += 1
		if (tiempoMiliSegundos == 10){
			tiempoMiliSegundos = 0
			tiempoSegundos += 1
		}
	}

	method reset(){
		tiempo = 0
		tiempoSegundos = 0
		tiempoMiliSegundos = 0
	}

	method mejor(){
		if(tiempo < mejorTiempo || mejorTiempo == 0){
			mejorTiempo = tiempo
			mejorTiempoSegundos = tiempoSegundos
			mejorTiempoMiliSegundos = tiempoMiliSegundos
		}
	}
}

// poner en segundos y milisegundos, check
// poner si pasas de 60 segundos perdes, check
// agregar sonido