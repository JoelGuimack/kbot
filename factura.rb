class Facturacion

    def convertirPorcentaje(numero)
        return numero.to_f*100
    end
    def calcularPrecioBruto(cantidad, precioUnitario)
        return cantidad.to_f * precioUnitario.to_f
    end

    def calculoTasaImpuestoFijo()
        return 0.0825
    end

    def impuestoAplicado(precioBruto, tasaImpuesto)
        return precioBruto.to_f*tasaImpuesto.to_f
    end
    def pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, precioBruto)
        puts "Cantidad: #{cantidad}, Precio Unitario: #{precioUnitario} = #{precioBruto}"
        puts "Impuesto Aplicado Fijo(#{tasaImpuestoAplicado}) = #{impuestoAplicado(precioBruto, calculoTasaImpuestoFijo())}"
    end

    def calculoDescuentoFijo()
        return 0.03
    end
    
    def descuentoAplicado(precioBruto, porcentajeDescuento)
        return precioBruto.to_f*porcentajeDescuento.to_f
    end

    def pintarDescuento(porcentajeDescuentoAplicado, precioBruto)
        puts "Descuento Aplicado(#{porcentajeDescuentoAplicado}): #{descuentoAplicado(precioBruto, porcentajeDescuentoAplicado)}"
    end

    def pintarDetalleFacturacion(estado, tasaImpuesto)
        puts "******** Detalle de Facturación ****************"
        puts "Estado: #{estado}"
        puts "Tasa de Impuesto: #{convertirPorcentaje(tasaImpuesto)}%"
        puts "************************************************"
    end
end
cantidad = ARGV[0]
precioUnitario = ARGV[1]
estado = ARGV[2]
facturacion= Facturacion.new()
precioBruto = facturacion.calcularPrecioBruto(cantidad, precioUnitario)
tasaImpuestoAplicado = facturacion.calculoTasaImpuestoFijo()
descuentoAplicado = facturacion.calculoDescuentoFijo()
facturacionTotal = precioBruto + precioBruto*tasaImpuestoAplicado - precioBruto*descuentoAplicado
facturacion.pintarDetalleFacturacion(estado, tasaImpuestoAplicado)
facturacion.pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, precioBruto)
facturacion.pintarDescuento(facturacion.calculoDescuentoFijo, precioBruto)
puts "Total: #{facturacionTotal}"