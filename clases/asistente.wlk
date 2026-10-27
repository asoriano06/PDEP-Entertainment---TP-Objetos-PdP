import clases.excepcionSaldoNegativo.*
import entrada.*
import vip.*
import objetos.fan.*

class Asistente {
  const property abono

  const property historialDeEntradas = []
  
  var dineroDisponible

  method comprarEntrada(entrada){
    self.validarCompra()
    entrada.registrarCompra()
    self.pagarEntrada(entrada)
    historialDeEntradas.add(entrada)
  }

  method validarCompra(){
    if (!self.saldoPositivo()) throw new ExceptionSaldoNegativo()
  }

  method saldoPositivo() = dineroDisponible > 0

  method pagarEntrada(entrada){
    dineroDisponible -= self.precioFinal(entrada)
  }

  method precioFinal(entrada) = entrada.precioConImpuesto() - abono.descuento(entrada.precioConImpuesto())

  method entradasDelAnioPasado() = historialDeEntradas.filter({entrada => entrada.esDelAnioPasado()})

  method bandasQueLesComproEntrada() = historialDeEntradas.map({entrada => entrada.banda().nombre()}).asSet()
}