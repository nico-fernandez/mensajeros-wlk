object roberto {
  	const peso = 90
  	var transporte = camion
  
  	method peso() {
   		return peso + transporte.peso()
  	}	
  
  	method transporte(vehiculo) {
    	transporte = vehiculo
  	}
  
  	method credito() {
    	return 0
  	}
}

object camion {
	var acoplados = 0
  
 	method peso() {
    	return acoplados * 500
  	}
  
  	method acoplados(cantAcoplados){
    	acoplados = cantAcoplados
  	}
}

object bici {
	method peso() {
    	return 1
  	}
}

object chuck {
	const credito = 100000
	
	method peso() {
		return 900
	}
	
	method credito() {
		return credito
	}
} 

object neo {
  	var credito = 7
  
  	method peso() {
    	return 0
  	}
  
  	method credito() {
    	return credito
  	}
  
  	method llamar() {
    	credito -= 5
  	}
  	
  	method cargaCredito() {
  		credito += 6
  	}
}


// Nuevo mensajero
object pedro {
  	const peso = 100
  	const transporte = patineta
  	const credito = 100
  
  	method peso() {
   		return peso + transporte.materialDensidad() //devuelve la densidad del material de la patineta de pedro, ya que tiene varias.
  	}	
  
  	method credito() {
    	return credito
  	}
}

object patineta {
	method materialDensidad() {
		return 1.randomUpTo(100)
	}
}

///////////////// Destinos /////////////////
object laMatrix {
	const distanciaDelCorreo = 76 
	
	method dejaEntrar(unEmpleado) {
    	return unEmpleado.credito() > 2
  	}
  	
  	method distanciaDelCorreo() {
  		return distanciaDelCorreo
  	}
}

object puenteDeBrooklyn {
	const distanciaDelCorreo = 98
  	
  	method dejaEntrar(unEmpleado) {
    	return unEmpleado.peso() < 1000
  	}
  	method distanciaDelCorreo() {
  		return distanciaDelCorreo
  	}
}

///////////////// Paquetes /////////////////
object paquete {
  	var estaPago = false
  	var destino = laMatrix
  
  	method precio() {
    	return 50
  	}
  
  	method pagar() {
    	estaPago = true
  	}
  
  	method estaPago() {
    	return estaPago
  	}
  
  	method destino(nuevoDestino) {
    	destino = nuevoDestino
  	}
  
  	method puedeSerEntregadoPor(unEmpleado) {
    	return destino.dejaEntrar(unEmpleado) and self.estaPago()
  	}
}

object paquetito {
  
  	method precio() {
    	return 0
  	}
  
  	method estaPago() {
   		return true
  	}
  
  	method puedeSerEntregadoPor(unEmpleado) {
    	return true
  	}
}

object paqueton {
   	var destinos = [laMatrix, puenteDeBrooklyn]
   	var importePagado = 0
   	const precio = 100
   
   	method destinos(losDestinos) {
    	destinos = losDestinos
  	}
   
   	method destinos() {
    	return destinos
   	}
  
  	method pagar(importe) {
    	importePagado += importe  
  	}
  
  	method precio() {
    	return precio * destinos.size()
 	}
  
  	method estaPago() {
   		return importePagado >= self.precio()
  	}
  
  	method puedeSerEntregadoPor(unEmpleado) {
    	return destinos.all({unDestino => unDestino.dejaEntrar(unEmpleado)}) and self.estaPago()
  	}
}

object paqueteEspecial {
	var destino = laMatrix
	const precio = 1000
	var estaPago = false
	
	method precio() {
    	return precio * destino.distanciaDelCorreo()
 	}
  
  	method destino(nuevoDestino) {
  		destino = nuevoDestino
  	}
  	
  	method pagar() {
  		estaPago = true
  	}
  	
  	method estaPago() {
   		return estaPago
  	}
  
  	method puedeSerEntregadoPor(unEmpleado) {
    	return destino.dejaEntrar(unEmpleado) and self.estaPago()
  	}
}

