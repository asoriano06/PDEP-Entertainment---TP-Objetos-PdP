object productora{
    var impuesto = 0

    const asistentes = #{}

    const bandas = #{}

    method impuesto() = impuesto

    method entradasVendidas() = asistentes.flatten({asistente => asistente.historialDeEntradas()})

    method gananciaTotal() = self.entradasVendidas().sum({entrada => entrada.precioConImpuesto()})

    method cantidadDeEntradasVendidas() = self.entradasVendidas().size()

    method bandaMasPopular() = self.entradasVendidasPorBanda().max()

    method entradasVendidasPorBanda() = self.entradasVendidas().map({entrada => entrada.banda()}).map({banda => self.cuantasVecesAparece(banda)})
    
    method cuantasVecesAparece(unaBanda) = listaDeBandas().count({entrada => entrada.banda()})

    method entradasDeUnaBanda() =

    method bonificarAsistenteVip(asistente){
        asistente.abono().recibirBonificacion()
    }
}