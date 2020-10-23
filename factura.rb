def precioTotal(cantidad, precioUnitario)
    return cantidad.to_f * precioUnitario.to_f
end

cantidad = ARGV[0]
precioUnitario = ARGV[1]
facturacionTotal = precioTotal(cantidad, precioUnitario)
tasaImpuestoAplicado = 0.0825
puts "Cantidad: #{cantidad}, Precio Unitario: #{precioUnitario} = #{facturacionTotal}"
facturacionTotal += facturacionTotal*tasaImpuestoAplicado
puts "Impuesto Fijo: #{tasaImpuestoAplicado}"
puts "Total: #{facturacionTotal}"