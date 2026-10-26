import saldoNegativo.*

class Asistente {
  const abono

  const property historialDeEntradas = []
  
  var property dineroDisponible

  const informador
  
  method comprarEntrada(entrada){
    if (self.saldoPositivo()){
        self.pagarEntrada(entrada)
        historialDeEntradas.add(entrada)
    }
    else {
        throw new ExceptionSaldoNegativo ()
    }
  }

  method saldoPositivo() = self.dineroDisponible() > 0

  method pagarEntrada(entrada){
    dineroDisponible -= self.precioFinal(entrada)
  }

  method precioFinal(entrada) = entrada.precioConImpuesto() - abono.descuento(entrada.precioConImpuesto())

  method entradasDelAnioPasado() = informador.entradasDelAnioPasado(self.historialDeEntradas())

  method bandasQueLesComproEntrada() = informador.bandasQueLesComproEntrada(self.historialDeEntradas())
}

class Vip{
  var bonificacion

  method bonificacion() = bonificacion

  method descuento(precioDeEntrada) = precioDeEntrada * (100 - bonificacion)
}