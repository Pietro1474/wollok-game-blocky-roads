import wollok.game.*
class Tronco1{
	var property name = "tronco"
	var property position = game.at(0,0)
	method image() = "tronco1.jpg"
	method colision() = false

	method posicion(){return position}

	method volver(x, y){position = game.at(x, y)}

	method moverAbajo(){
		position = position.down(1)
		if(position == game.at(4, 0)){self.volver(4, 9)}
	}
}

class Tronco2{
	var property name = "tronco"
	var property position = game.at(0,0)
	method image() = "tronco2.jpg"
	method colision() = false

	method posicion(){return position}

	method volver(x, y){position = game.at(x, y)}

	method moverArriba(){
		position = position.up(1)
		if(position == game.at(5, 10)){self.volver(5, 1)}
	}
}