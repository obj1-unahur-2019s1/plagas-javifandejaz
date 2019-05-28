class Hogar {
	var property mugre = 0;
	var property confort = 0;
		
	method esBuena() { return mugre <= confort / 2 }
	method recibirAtaque(plaga) {mugre += plaga.nivelDeDanio()}
}

class Huerta {
	var property capacidadDeProduccion = 0;
	
	method esBuena() { return capacidadDeProduccion > configuracionHuerta.nivelActual() }
	
	method recibirAtaque(plaga) { capacidadDeProduccion -= plaga.nivelDeDanio()*0.10
		if(plaga.transmiteEnfermedades()){capacidadDeProduccion -= 10}
	}
}

object configuracionHuerta {
	var property nivelActual = 300
}

class Mascota {
	var property nivelDeSalud
	
	method esBuena() { return nivelDeSalud > 250 }
	
	method recibirAtaque(plaga) { if(plaga.transmiteEnfermedades()){nivelDeSalud -= plaga.nivelDeDanio()}
	}
}

class Barrio {
	var elementos = #{}
	
	method agregarElemento(elem) { elementos.add(elem) }
	method agregarElementos(elems) { elementos.addAll(elems) }
	method elementosBuenos() {
		return elementos.filter({elemento => elemento.esBuena() })
	}
	method elementosMalos() {
		return elementos.filter({elemento => not elemento.esBuena() })
	}
	method esCopado() { return self.elementosBuenos().size() > self.elementosMalos().size() }
}

