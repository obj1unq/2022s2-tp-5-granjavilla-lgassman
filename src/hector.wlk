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
}