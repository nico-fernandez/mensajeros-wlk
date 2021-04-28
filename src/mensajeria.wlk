import mensajeros.*

object mensajeria {
	const empleados = []
  	var pendientes = []
  	var pendienteMasCaro
  	var enviados = []
  	
	
	method empleados() {
		return empleados
	}
	
	method enviados() {
		return enviados
	}
  
	method pendientes() {
    	return pendientes
  	}
  
  	method pendientes(losPendientes) {
  		pendientes = losPendientes
  	}
	
	method contratar(unEmpleado) {
		empleados.add(unEmpleado)
	}
	
	method despedir(unEmpleado) {
		empleados.remove(unEmpleado)
	}
	
	method despedirATodos() {
		empleados.clear()
	}	
	
	method esGrande() {
		return empleados.size() > 2
	}
  
    method loEntregaElPrimero(unPaquete) {
    	return unPaquete.puedeSerEntregadoPor(empleados.first())
   	}
  
  	method pesoDelUltimo() {
    	return empleados.last().peso() 
  	}
  
  	method algunoPuedeEntregar(unPaquete) {
    	return empleados.any({unEmpleado => unPaquete.puedeSerEntregadoPor(unEmpleado)})
  	}
  
  	method candidatosPara(unPaquete) {
    	return empleados.filter({unEmpleado => unPaquete.puedeSerEntregadoPor(unEmpleado)})
  	}
  
  	method tieneSobrepeso() {
    	return (empleados.sum({unEmpleado => unEmpleado.peso()}) / empleados.size()) > 250
  	}

// Si no lo puede enviar no hace nada, el paquete se quda en pendientes.   
  	method enviar(unPaquete){
    	if (self.algunoPuedeEntregar(unPaquete)) {
      		enviados.add(unPaquete)
      		pendientes.remove(unPaquete)
		}

    }
    
  	method enviarTodos() {
    	pendientes.forEach({unPaquete => self.enviar(unPaquete)})
  	}
  
  	method enviarPendienteCaro() {
    	pendienteMasCaro = pendientes.max({unPaquete => unPaquete.precio()})
    	self.enviar(pendienteMasCaro)
   	}
   	
   	method facturacion() {
   		return enviados.sum({paqueteEnviado => paqueteEnviado.precio()})
   	}
}
