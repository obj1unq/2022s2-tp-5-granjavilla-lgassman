import wollok.game.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	
	
	method sembrar(tipoCultivo) {
		self.validarSembrar()
		const cultivo = tipoCultivo.nuevo()
		cultivo.position(position)
		game.addVisual(cultivo)
	}
	
	method validarSembrar() {
		if (not game.colliders(self).isEmpty()) {
			self.error("Espacio ocupado!")
		}
	}
	
	method regar() {
		self.validarRegar()
		game.colliders(self).first().regar()
	}
	
	method validarRegar() { //Este validar es solamente para que el mensaje sea bonito
		if (game.colliders(self).isEmpty()) {
			self.error("Nada que regar!")
		}		
	}
}