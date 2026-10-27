import banda.*
import objetos.productora.*

class Entrada {
  const property banda

  const fecha //tipo Date()
  
  const precioBase = 1000

  var impuestoCobrado = null

  method registrarCompra(){
    impuestoCobrado = productora.impuesto()
  }

  method esDelAnioPasado(){
    const anioCorriente = new Date().year()
    
    fecha.year() == anioCorriente - 1
  }
  
  method precioConImpuesto() = if (impuestoCobrado != null) precioBase + impuestoCobrado else precioBase + productora.impuesto()
}