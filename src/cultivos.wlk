import wollok.game.*

//factories
object maiz {
	
	method nuevo() {
		return new Maiz()
	}
}

object trigo {
	method nuevo() {
		return new Trigo()
	}
}

object tomaco {
	method nuevo() {
		return new Tomaco()
	}
}


object adulto {
	method sufijo() {
		return "adult"
	}
	
	method listoParaCosecha() {
		return true
	}
	
}

object bebe {
	method sufijo() {
		return "baby"
	}
	
	method listoParaCosecha() {
		return false
	}
}

class Maiz {
	var property position = game.at(0,0)
	const property image = "corn_baby.png"
	var crecimiento = bebe
	
	method regar() {
		crecimiento = adulto
	}
	method image() {
		return "corn_" + crecimiento.sufijo() + ".png" 
	}
	
	method listo() {
		return crecimiento.listoParaCosecha()
	}
	
	method precio() {
		return 150
	}
}

class Trigo {
	var property position = game.at(0,0)
	var etapa = 0
	const etapaMaxima = 4
	
	method image() {
		return "wheat_" + etapa + ".png"
	}
	
	method regar() {
		etapa = (etapa + 1) % etapaMaxima
	}
	
	method listo() {
		return etapa >=2
	}
	
	method precio() {
		return (etapa -1 ) * 100 
	}
	
}

class Tomaco {
	var property position = game.at(0,0)
	const property image = "tomaco.png"
	
	
	method regar() {
		if (not self.estaArriba())
			position = position.up(1)
		else {
			//no usar else si no queria moverse
			position = game.at(position.x(), 0)
		}	
	}
	
	method listo() {
		return true
	}
	
	method estaArriba() {
		return position.y() == game.height() - 1
	}
	
	method precio() {
		return 80
	}
	
}