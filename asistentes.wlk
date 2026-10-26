import excepciones.*

class Asistente {
  const abono

  const property historialDeEntradas = []
  
  var property dineroDisponible

  const informante
  
  method comprarEntrada(entrada){
    if (self.saldoPositivo()){
        self.pagarEntrada(entrada)
        historialDeEntradas.add(entrada)
    }
    else {
        throw new ExceptionSaldoNegativo()
    }
  }

  method saldoPositivo() = self.dineroDisponible() > 0

  method pagarEntrada(entrada){
    dineroDisponible -= self.precioFinal(entrada)
  }

  method precioFinal(entrada) = entrada.precioConImpuesto() - abono.descuento(entrada.precioConImpuesto())

  method entradasDelAnioPasado() = informante.entradasDelAnioPasado(self.historialDeEntradas())

  method bandasQueLesComproEntrada() = informante.bandasQueLesComproEntrada(self.historialDeEntradas())
}