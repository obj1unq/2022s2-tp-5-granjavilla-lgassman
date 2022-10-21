import wollok.game.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	
	method sembrarTrigo() {
		self.sembrar(new Trigo())
	}
	method sembrarMaiz() {
		self.sembrar(new Maiz())
	}
	method sembrarTomaco() {
		self.sembrar(new Tomaco())
	}
	
	
	method sembrar(cultivo) {
		self.validarSembrar()
		cultivo.position(position)
		game.addVisual(cultivo)
	}
	
	method validarSembrar() {
		if (not game.colliders(self).isEmpty()) {
			self.error("Espacio ocupado!")
		}
	}
}