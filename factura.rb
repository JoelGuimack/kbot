class Facturacion
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
end
cantidad = ARGV[0]
precioUnitario = ARGV[1]
facturacion= Facturacion.new()
precioBruto = facturacion.calcularPrecioBruto(cantidad, precioUnitario)
tasaImpuestoAplicado = facturacion.calculoTasaImpuestoFijo()
descuentoAplicado = facturacion.calculoDescuentoFijo()
facturacionTotal = precioBruto + precioBruto*tasaImpuestoAplicado - precioBruto*descuentoAplicado
facturacion.pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, precioBruto)
puts "Total: #{facturacionTotal}"