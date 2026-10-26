object productora{
    var impuesto = 0

    const asistentes = #{}

    const bandas = #{}

    method impuesto() = impuesto

    method gananciaTotal() = asistentes.sum({asistente => asistente.historialDeEntradas().precioConImpuesto})

    method bonificarAsistenteVip(asistente){
        asistente.abono().recibirBonificacion()
    }
}