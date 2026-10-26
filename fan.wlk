import excepciones.*
object fan{
    method descuento() = 0

    method recibirBonificacion(){
        throw new ExceptionNoPuedeRecibirBonificacion()
    }
}