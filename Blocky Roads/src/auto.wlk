import wollok.game.*
class Auto11{
	var property name = "auto"
	var property position = game.at(0, 0)
	method image() = "auto 1.1.png"
	
	method moverAbajo(){
		position = position.down(1)
		if(position == game.at(2, 0)){self.volver(2, 9)}
   	 	if(position == game.at(7, 0)){self.volver(7, 9)}
	}
	
	method volver(x, y){position = game.at(x, y)}
	
	method colision() = true
}

class Auto12{
	var property name = "auto"
	var property position = game.at(0, 0)
	method image() = "auto 1.2.png"
	
	method moverAbajo(){
		position = position.down(1)
		if(position == game.at(2, 0)){self.volver(2, 9)}
   	 	if(position == game.at(7, 0)){self.volver(7, 9)}
	}

	method volver(x, y){position = game.at(x, y)}
	
	method colision() = true
}

class Auto21{
	var property name = "auto"
	var property position = game.at(0, 0)
	method image() = "auto 2.1.png"
	
	method moverArriba(){
		position = position.up(1)
		if(position == game.at(8, 10)){self.volver(8, 1)}
	}
	
	method volver(x, y){position = game.at(x, y)}
	
	method colision() = true
}

class Auto22{
	var property name = "auto"
	var property position = game.at(0, 0)
	method image() = "auto 2.2.png"
	
	method moverArriba(){
		position = position.up(1)
		if(position == game.at(8, 10)){self.volver(8, 1)}
	}
	
	method volver(x, y){position = game.at(x, y)}
	
	method colision() = true
}