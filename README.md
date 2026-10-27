# TP PDEP Entertainment

* Alumno: Agustín Ezequiel Soriano

* Comisión: K2001

* Profesora: Rocio Gonzalez

* Fecha de entrega: 26/10/26

# Justificación Teórica

## Decisiones de diseño

### Asistente
* Decidí que historialDeEntradas sea una lista ([]) pues un asistente podría comprar varias entradas al mismo concierto (misma banda y fecha) y tenerlas a su nombre, así que deben poder repetirse.
* Sobre el encapsulamiento, use property para generar el getter de abono e historialDeEntradas, pues ambas son const (property no genera el setter) y será necesario para el funcionamiento de productora.
* Apliqué el concepto de responsabilidad al relevar el cálculo del descuento para el precio final de la entrada al abono, como también al relevar la confirmación de que una entrada sea del año anterior a la clase entrada. Asimismo, respeté las responsabilidades del asistente, como el manejo de su saldo, la habilidad de comprar una entrada, la resta simple entre el precio de la entrada y el descuento y la visualización de información como entradasDelAnioPasado y bandasQueLesComproEntrada.
* Apliqué manejo de errores para el caso en el que el saldo del asistente sea negativo, siendo declarativo al evaluar si pasa o no el error en el método validarCompra en lugar de escribir la funcionalidad directamente en comprarEntrada. Si se da el caso, se detendrá la compra y se notificará adecuadamente.
* Decidí que al comprar una entrada se registre en ésta que haya sido comprada por razones que detallo más adelante.
* También apliqué expresiones lambda en entradasDelAnioPasado y bandasQueLesComproEntrada, pues esas transformaciones solo se usaron en dichos métodos.

### Banda
* Aquí apliqué herencia pués los distintos tipos de bandas comparten ciertos atributos y comportamientos, como también para obligarlos a entender ciertos métodos y poder aplicar polimorfismo más adelante.
* Al no necesitar su getter ni su setter, definí a nombre como const (sin property).
* Como la clase BandaDeTrap modifica el cálculo del canon, decidí que presupuesto utilice el getter de canon, obtenido gracias a property; de esta manera, canon() puede ser redefinido en esta subclase sin afectar el cálculo de presupuesto del resto de subclases.

### Entrada
* Como para el funcionamiento de productora preciso el getter de la banda de la entrada la declaré como const property, mientras que como la fecha y el precioBase solo se usan dentro de la entrada las declaré como const.
* Aquí definí el funcionamiento para chequear si la entrada es del año anterior, utilizando la clase predefinida Date.
* Para el cálculo del precioConImpuesto decidí que mientras no haya sido comprada se utilice productora.impuesto(), de esta manera se puede instanciar una entrada y cambiar el impuesto a cobrar antes de su venta. Una vez vendida, se congela en la entrada el impuesto cobrado, así más adelante la ganancia de las entradas calculada en productora se mantiene fiel a los precios a los que fueron vendidas en lugar de verse afectada por el cambio del impuesto posterior a su venta.

### ExcepcionSaldoNegativo
* Para el previo manejo de errores en asistente cree una subclase vacia de Exception, pues reemplazo el atributo del mensaje en lugar de sobreescribir su método.

### Vip
* Como el enunciado dice que el porcentaje de descuento vip es particular para cada asistente decidí crear una clase vip en lugar de un objeto, definiendo la bonificación al ser instanciada.
* Unicamente se encarga del cálculo del descuento y de recibir bonificación, cuyo método solo es accedido por la productora (más allá de por sí mismo).
* Apliqué (en teoría) una interfaz entre vip y fan, pues ambos deben entender los mismos métodos para el correcto funcionamiento polimorfico tanto en bonificarAsistentesVip de la productora como también en precioFinal de la entrada del asistente.

### fan
* Como su estado (nulo) y comportamiento es igual para todo asistente con este abono, cree un solo objeto en lugar de una clase.
* Como fue explicado previamente, comparte una interfaz con vip para que funcione el polimorfismo en diferentes métodos.

### productora
* Como los asistentes y las bandas son únicas, utilice set (#{}) para ambos, impidiendo repetición de elementos.
* Decidí crear unos métodos extra para poder agregar bandas y asistentes a sus respectivos sets.
* Apliqué declaratividad al crear el método entradasVendidas (usado en varios otrs métodos), como también al separar el cálculo de la gananciaTotal y el funcionamiento de bandaMasPopular.
* Use varias funciones lambda, de funcionamiento útil unicamente en su respectivo método, más que nada para métodos iterativos.
* Aquí se aplica el polimorfismo varias veces mencionado anteriormente: en gananciaDeEntradas con precioConImpuesto; en gastoDePresupuestos con presupuesto; y en bonificarAsistentesVip con recibirBonificacion.
* Importo todos los archivos antes mencionados para propositos de compilación.