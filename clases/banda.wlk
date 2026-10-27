class Banda{
    const nombre

    const property canon = 1000000

    method presupuesto() = self.canon() + self.gastoExtra()

    method gastoExtra()

    method popularidad()
}

class BandaDeRock inherits Banda{
    const cantidadSolosDeGuitarra

    override method gastoExtra() = 10000

    override method popularidad() = 100 * cantidadSolosDeGuitarra
}

class BandaDeTrap inherits Banda{
    const tienenHielo

    override method canon() = super() * self.popularidad()

    override method gastoExtra() = 0

    override method popularidad() = if(tienenHielo) 1000 else 0
}

class BandaIndie inherits Banda{
    const cantidadDeInstrumentos

    override method gastoExtra() = 500 * cantidadDeInstrumentos

    override method popularidad() = 3.14 * nombre.length()
}