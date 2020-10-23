class Facturacion
    def precioTotal(cantidad, precioUnitario)
        return cantidad.to_f * precioUnitario.to_f
    end

    def calculoTasaImpuestoFijo()
        return 0.0825
    end

    def pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, facturacionTotal)
        puts "Cantidad: #{cantidad}, Precio Unitario: #{precioUnitario} = #{facturacionTotal}"
        puts "Impuesto Aplicado Fijo: #{tasaImpuestoAplicado}"
    end
    
end
cantidad = ARGV[0]
precioUnitario = ARGV[1]
facturacion= Facturacion.new()
facturacionTotal = facturacion.precioTotal(cantidad, precioUnitario)
tasaImpuestoAplicado = facturacion.calculoTasaImpuestoFijo()
facturacion.pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, facturacionTotal)
facturacionTotal += facturacionTotal*tasaImpuestoAplicado
puts "Total: #{facturacionTotal}"