def precioTotal(cantidad, precioUnitario)
    return cantidad.to_f * precioUnitario.to_f
end

def calculoTasaImpuesto()
    return 0.0825
end

def pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, facturacionTotal)
    puts "Cantidad: #{cantidad}, Precio Unitario: #{precioUnitario} = #{facturacionTotal}"
    puts "Impuesto Aplicado: #{tasaImpuestoAplicado}"
end
cantidad = ARGV[0]
precioUnitario = ARGV[1]
facturacionTotal = precioTotal(cantidad, precioUnitario)
tasaImpuestoAplicado = calculoTasaImpuesto()
pintarParametros(cantidad, precioUnitario, tasaImpuestoAplicado, facturacionTotal)
facturacionTotal += facturacionTotal*tasaImpuestoAplicado
puts "Total: #{facturacionTotal}"