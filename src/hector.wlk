import wollok.game.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	const property cosechados = #{}
	
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
		self.cultivoActual().regar()
	}
	
	method cultivoActual() {
		self.validarCultivo()
		return game.colliders(self).first()
	}
	
	method validarCultivo() { //Este validar es solamente para que el mensaje sea bonito
		if (game.colliders(self).isEmpty()) {
			self.error("No hay cultivo!")
		}		
	}
	method cosechar() {
		const cultivo = self.cultivoActual()
		self.validarCosecha(cultivo)
		cosechados.add(cultivo)
		game.removeVisual(cultivo)
	}
	
	method validarCosecha(cultivo) {
		if (not cultivo.listo()) {
			self.error("no esta listo para cosechar")
		}
	}
	
}