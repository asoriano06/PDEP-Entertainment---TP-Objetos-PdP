import Exception

class ExceptionSaldoNegativo inherits Exception (message = "No puede comprar la entrada porque tiene saldo negativo."){}

class ExceptionNoPuedeRecibirBonificacion inherits Exception (message = "No puede recibir bonificacion porque su abono es tipo fan."){}