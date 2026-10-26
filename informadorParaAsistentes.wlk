object informadorParaAsistentes{
    const hoy = new Date()

    method entradasDelAnioPasado(historialDeEntradas) = historialDeEntradas.map({entrada => entrada.fecha().year() == hoy.minusYears(1).year()})

    method bandasQueLesComproEntrada(historialDeEntradas) = historialDeEntradas.map({entrada => entrada.banda()}).asSet()
}