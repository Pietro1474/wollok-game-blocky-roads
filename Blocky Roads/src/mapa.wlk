import wollok.game.*
import pasto.*
import calle.*
import agua.*
import tronco.*
import auto.*
import pollo.*
import meta.*
import muro.*
import tiempo.*

object mapa{

	method terminar(){
		game.clear()
		self.cargar()
		tiempo.reset()
	}

	method cargar(){
		// pasto
		const posPasto = []
		(1..9).forEach({n => posPasto.add(new Position(x = 1, y = n))})
		(1..9).forEach({n => posPasto.add(new Position(x = 3, y = n))})
		(1..9).forEach({n => posPasto.add(new Position(x = 6, y = n))})
		(1..3).forEach({n => posPasto.add(new Position(x = 9, y = n))})
		(6..9).forEach({n => posPasto.add(new Position(x = 9, y = n))})
		posPasto.forEach{a => game.addVisual(new Pasto(position = a))}

		// calle
		const posCalle = []
		(1..9).forEach({n => posCalle.add(new Position(x = 2, y = n))})
		(1..9).forEach({n => posCalle.add(new Position(x = 7, y = n))})
		(1..9).forEach({n => posCalle.add(new Position(x = 8, y = n))})
		posCalle.forEach{b => game.addVisual(new Calle(position = b))}

		// agua
		const posAgua = []
		(1..9).forEach({n => posAgua.add(new Position(x = 4, y = n))})
		(1..9).forEach({n => posAgua.add(new Position(x = 5, y = n))})
		posAgua.forEach{c => game.addVisual(new Agua(position = c))}

		// meta
		const posMeta = []
		(4..6).forEach({n => posMeta.add(new Position(x = 9, y = n))})
		posMeta.forEach{d => game.addVisual(new Meta(position = d))}

		// muro
		const posMuro = []
		(0..10).forEach({n => posMuro.add(new Position(x = n, y = 0))})
		(0..10).forEach({n => posMuro.add(new Position(x = 0, y = n))})
		(0..10).forEach({n => posMuro.add(new Position(x = n, y = 10))})
		(0..10).forEach({n => posMuro.add(new Position(x = 10, y = n))})
		posMuro.forEach{j => game.addVisual(new Muro(position = j))}

		// pollo
		const pollo = new Pollo()

		// tronco 1
		const posTronco1 = []
		const moveTronco1 = []
		posTronco1.addAll([
			new Position(x=4,y=7), new Position(x=4,y=5), 
			new Position(x=4,y=3), new Position(x=4,y=1)])

		posTronco1.forEach{g =>
			const tronco1 = new Tronco1(position = g)
			game.addVisual(tronco1)
			moveTronco1.add(tronco1)
		}

		moveTronco1.forEach{h =>
			game.onTick(800, "5", {
				if(pollo.position() == h.position()){pollo.moverAbajo()}
				h.moverAbajo()
			})
		}

		// tronco 2
		const posTronco2 = []
		const moveTronco2 = []
		posTronco2.addAll([
			new Position(x=5,y=1), new Position(x=5,y=3), 
			new Position(x=5,y=5), new Position(x=5,y=7)])

		posTronco2.forEach{y =>
			const tronco2 = new Tronco2(position = y)
			game.addVisual(tronco2)
			moveTronco2.add(tronco2)
		}

		moveTronco2.forEach{n =>
			game.onTick(1500, "6", {
				if(pollo.position() == n.position()){pollo.moverArriba()}
				n.moverArriba()
			})
		}

		// auto 1.1
		const posAuto11 = []
		const moveAuto11 = []
		posAuto11.addAll([
			new Position(x=2,y=2), new Position(x=2,y=5), 
			new Position(x=2,y=8), new Position(x=7,y=2), 
			new Position(x=7,y=5), new Position(x=7,y=8)])

    	posAuto11.forEach{e =>
   			const auto_11 = new Auto11(position = e)
   			game.addVisual(auto_11)
   			moveAuto11.add(auto_11)
   	 	}
   	 	moveAuto11.forEach{f => 
   	 		game.onTick(1000, "1", {f.moverAbajo()})
   	 	}

		// auto 1.2
		const posAuto12 = []
		const moveAuto12 = []
		posAuto12.addAll([
			new Position(x=2,y=3), new Position(x=2,y=6), 
			new Position(x=2,y=9), new Position(x=7,y=3), 
			new Position(x=7,y=6), new Position(x=7,y=9)])

    	posAuto12.forEach{g =>
   			const auto_12 = new Auto12(position = g)
   			game.addVisual(auto_12)
   			moveAuto12.add(auto_12)
   	 	}
   	 	moveAuto12.forEach{h => 
   	 		game.onTick(1000, "2", {h.moverAbajo()})
   	 	}

		// auto 2.1
		const posAuto21 = []
		const moveAuto21 = []
		posAuto21.addAll([
			new Position(x=8,y=8), new Position(x=8,y=5), 
			new Position(x=8,y=2)])

   		posAuto21.forEach{i =>
   			const auto_21 = new Auto21(position = i)
   			game.addVisual(auto_21)
   			moveAuto21.add(auto_21)
   		}
		moveAuto21.forEach{j => 
			game.onTick(1000, "3", {j.moverArriba()})
		}

		// auto 2.2
		const posAuto22 = []
		const moveAuto22 = []
		posAuto22.addAll([
			new Position(x=8,y=9), new Position(x=8,y=6), 
			new Position(x=8,y=3)])

   		posAuto22.forEach{k =>
   			const auto_22 = new Auto22(position = k)
   			game.addVisual(auto_22)
   			moveAuto22.add(auto_22)
   		}
		moveAuto22.forEach{l => 
			game.onTick(1000, "4", {l.moverArriba()})
		}

		// pollo visual
		game.addVisualCharacter(pollo)

		// tiempo
		game.addVisual(tiempo)
		game.onTick(100, "tiempo", {
			tiempo.sumar()
			pollo.tiempoTermina()
		})

		// colision
		game.whenCollideDo(pollo, {c =>
			if (c.colision() and not pollo.viajandoTronco()){self.terminar()}
			
			if (pollo.position() == game.at(6, 10) || pollo.position() == game.at(5, 0)){
				self.terminar()}
			}
		)
	}
}