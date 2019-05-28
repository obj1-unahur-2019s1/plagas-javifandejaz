class Plaga {
	var property poblacion	
	method transmiteEnfermedades() { return poblacion >= 10 }
	method atacar(elemento) {
		poblacion = poblacion + (poblacion * (10/100))
		elemento.recibirAtaque(self)
	}
}

class PlagaCucarachas inherits Plaga {
	var property pesoPromedio
	
	method nivelDeDanio() { return poblacion / 2 }
	
	// *obligatorio* poner "override"
	// si repito en la subclase un metodo que tengo en la superclase
	override method transmiteEnfermedades() { return super() and pesoPromedio >= 10 }
	
	override method atacar(elemento) { 
		super(elemento)
		pesoPromedio = pesoPromedio + 2
	}
}

class PlagaPulgas inherits Plaga {	
	method nivelDeDanio() { return poblacion * 2 }
}

class Garrapatas inherits PlagaPulgas {	override method atacar(elemento) {
	poblacion = poblacion + (poblacion * (20/100))
	elemento.recibirAtaque(self)
	}
}

class PlagaMosquitos inherits Plaga {
	method nivelDeDanio() { return poblacion }
	// transmiteEnfermedades(): va override porque agrega una condicion particular
	override method transmiteEnfermedades() { return super() and poblacion % 3 == 0 }
	// atacar: lo borro porque no hace nada distinto a lo que esta definido
	// en la superclase
//	method atacar(elemento) {
//		poblacion = poblacion + (poblacion * (10/100))
//	}
}
