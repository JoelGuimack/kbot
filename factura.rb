class Facturacion

    def convertirPorcentaje(numero)
        return numero.to_f*100.0
    end
    def calcularPrecioBruto(cantidad, precioUnitario)
        return cantidad.to_f*precioUnitario.to_f
    end

    def calculoTasaImpuestoAplicada(estado)
        return case estado
        when "UT"  then 0.0685
        when "NV"  then 0.08
        when "TX"  then 0.0625
        when "AL"  then 0.04
        when "CA"  then 0.0825
        end
    end
    
    def verificarEstado(estado)
        return case estado
        when "UT"  then false
        when "NV"  then false
        when "TX"  then false
        when "AL"  then false
        when "CA"  then false
        else true
        end
    end

    def impuestoAplicado(precioBruto, tasaImpuesto)
        return precioBruto.to_f*tasaImpuesto.to_f
    end
    def pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, porcentajeDescuentoAplicado, precioBruto, estado)
        puts "Cantidad: #{cantidad}, Precio Unitario: #{precioUnitario} = #{precioBruto}"
        puts "Impuesto Aplicado(#{tasaImpuestoAplicado}) = #{impuestoAplicado(precioBruto, calculoTasaImpuestoAplicada(estado))}"
        puts "Descuento Aplicado(#{porcentajeDescuentoAplicado}) = #{descuentoAplicado(precioBruto, calculoPorcentajeDescuentoAplicado(precioBruto))}"
    end

    def calculoPorcentajeDescuentoAplicado(precioBruto)
        return case
        when precioBruto > 15000.0  then 0.15
        when precioBruto > 10000.0  then 0.1
        when precioBruto > 7000.0 then 0.07
        when precioBruto > 5000.0 then 0.05
        when precioBruto > 1000.0   then 0.03
        end
    end
    
    def descuentoAplicado(precioBruto, porcentajeDescuento)
        return precioBruto.to_f*porcentajeDescuento.to_f
    end

    def pintarDescuento(porcentajeDescuentoAplicado, precioBruto)
        puts "Descuento Aplicado(#{porcentajeDescuentoAplicado}): #{descuentoAplicado(precioBruto, porcentajeDescuentoAplicado)}"
    end

    def pintarDetalleFacturacion(estado, tasaImpuesto, porcentajeDescuento)
        puts "************ Detalle de Facturación ************"
        puts "Estado: #{estado}"
        puts "Tasa de Impuesto: #{convertirPorcentaje(tasaImpuesto)}%"
        puts "Porcentaje de Descuento: #{convertirPorcentaje(porcentajeDescuento)}%"
        puts "************************************************"
    end

    def mapaDeImpuestosXEstado()
        puts"      IMPUESTO                     DESCUENTO     "
        puts"Estado         Tasa         Más de            %  "
        puts"UT             6.85%         $1000           3%  "       
        puts"NV             8.00%         $5000           5%  "
        puts"TX             6.25%         $7000           7%  "
        puts"AL             4.00%         $10000          10% "
        puts"CA             8.25%         $50000          15% "
        puts "************************************************"
    end

    def mensajeErrorEstadoDesconocido()
        puts "Por favor, ingrese un estado correcto..."
    end

    def setEstadoXDefecto(estado)
        if estado==nil
            estado = "CA"
        else
            return estado
        end
    end

    def pintarTotal(total)
        puts "************************************************"
        puts "Total: #{total}"
        puts "************************************************"
    end

end
cantidad = ARGV[0]
precioUnitario = ARGV[1]
facturacion= Facturacion.new()
estado = facturacion.setEstadoXDefecto(ARGV[2])
estadoDesconocido = false
if estadoDesconocido == facturacion.verificarEstado(estado)
    puts "#{facturacion.calculoTasaImpuestoAplicada(ARGV[2])}"
    precioBruto = facturacion.calcularPrecioBruto(cantidad, precioUnitario)
    tasaImpuestoAplicado = facturacion.calculoTasaImpuestoAplicada(estado)
    porcentajeDescuentoAplicado = facturacion.calculoPorcentajeDescuentoAplicado(precioBruto)
    facturacionTotal = precioBruto + facturacion.impuestoAplicado(precioBruto,tasaImpuestoAplicado) - facturacion.descuentoAplicado(precioBruto, porcentajeDescuentoAplicado)
    facturacion.pintarDetalleFacturacion(estado, tasaImpuestoAplicado, porcentajeDescuentoAplicado)
    facturacion.mapaDeImpuestosXEstado()
    facturacion.pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, porcentajeDescuentoAplicado, precioBruto, estado)
    #facturacion.pintarDescuento(facturacion.calculoPorcentajeDescuentoAplicado(precioBruto), precioBruto)
    facturacion.pintarTotal(facturacionTotal)
else
    facturacion.mensajeErrorEstadoDesconocido
end