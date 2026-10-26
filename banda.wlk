class Banda{
    const nombre

    const canon = 1000000

    method canon() = canon

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

    override method canon() = canon * self.popularidad()

    override method gastoExtra() = 0

    override method popularidad(){
        if(tienenHielo) return 1000
        else return 0
    }
}