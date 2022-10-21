import wollok.game.*

object aspersores {
	
	const property todos = #{}


	method agregarNuevo(position) {
		self.validarPosition(position)
		const nuevo = new Aspersor(position = position)
		game.addVisual(nuevo)
		todos.add(nuevo)
	}
	
	method validarPosition(position) {
		const mismaPositionPredicate = {aspersor => aspersor.position() == position}
		if (todos.any(mismaPositionPredicate)) {
			todos.find(mismaPositionPredicate).error("Ya hay aspersor aqui")
		}
	}
	
	method tirarAgua() {
		todos.forEach({aspersor => aspersor.tirarAgua()})
	}
}

class Aspersor {
	const property image = "aspersor.png"
	const property position
	
	
	method tirarAgua() {
		
		(-1..1).forEach( { x =>
			 (-1..1).forEach ( {y =>
			 	 self.tirarAgua(x,y)
			})
		})
	}
	
	method tirarAgua(dx,dy) {
		const positionARegar = game.at( position.x() + dx, position.y() + dy)
		game.getObjectsIn(positionARegar).forEach( { posibleCultivo => posibleCultivo.regar() })
	}
	
	method regar() {
		//nada
	}
	
}


