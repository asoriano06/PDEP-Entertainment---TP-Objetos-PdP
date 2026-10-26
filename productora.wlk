object productora{
    var impuesto = 0

    const asistentes = #{}

    const bandas = #{}

    method impuesto() = impuesto

    method entradasVendidas() = asistentes.flatMap({asistente => asistente.historialDeEntradas()})

    method gananciaTotal() = self.entradasVendidas().sum({entrada => entrada.precioConImpuesto()})

    method cantidadDeEntradasVendidas() = self.entradasVendidas().size()

    method bandaMasPopular() = bandas.max({banda => self.cantidadDeEntradasDeBanda(banda)})

    method cantidadDeEntradasDeBanda(unaBanda) = self.entradasVendidas().count({entrada => entrada.banda() == unaBanda})

    method bonificarAsistenteVip(asistente){
        asistente.abono().recibirBonificacion()
    }
}