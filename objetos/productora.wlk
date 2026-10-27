import clases.asistente.*
import clases.banda.*
import clases.entrada.*
import clases.vip.*
import clases.excepcionSaldoNegativo.*
import fan.*

object productora{
    var property impuesto = 0

    const asistentes = #{}

    const bandas = #{}

    method agregarAsistentes(unosAsistentes) = asistentes.addAll(unosAsistentes)

    method agregarBandas(unasBandas) = bandas.addAll(unasBandas)

    method entradasVendidas() = asistentes.flatMap({asistente => asistente.historialDeEntradas()})

    method gananciaTotal() = self.gananciaDeEntradas() - self.gastoDePresupuestos()

    method gananciaDeEntradas() = self.entradasVendidas().sum({entrada => entrada.precioConImpuesto()})

    method gastoDePresupuestos() = bandas.sum({banda => banda.presupuesto()})

    method cantidadDeEntradasVendidas() = self.entradasVendidas().size()

    method bandaMasPopular() = bandas.max({banda => self.cantidadDeEntradasDeBanda(banda)})

    method cantidadDeEntradasDeBanda(unaBanda) = self.entradasVendidas().count({entrada => entrada.banda() == unaBanda})

    method bonificarAsistentesVip(){
        asistentes.foreach({asistente => asistente.abono().recibirBonificacion()})
    }
}