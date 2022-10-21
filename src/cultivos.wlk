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
}

object bebe {
	method sufijo() {
		return "baby"
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
	
}

class Tomaco {
	var property position = game.at(0,0)
	const property image = "tomaco.png"
	
}