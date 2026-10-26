class Vip{
  var bonificacion

  method bonificacion() = bonificacion

  method recibirBonificacion(){
    bonificacion += 1
  }

  method descuento(precioDeEntrada) = precioDeEntrada * bonificacion / 100
}