class Entrada {
  const property banda

  const property show

  const property fecha = new Date() // DD/MM/AAAA
  
  const precioBase = 1000

  const productora
  
  var impuesto = productora.impuesto()
  
  method precioConImpuesto() = precioBase + impuesto
}