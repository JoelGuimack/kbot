def precioTotal(cantidad, precioUnitario)
    return cantidad.to_f * precioUnitario.to_f
end

cantidad = ARGV[0]
precioUnitario = ARGV[1]
facturacionTotal = precioTotal(cantidad, precioUnitario)
puts "Cantidad: #{cantidad}, Precio Unitario: #{precioUnitario}"
puts "Total: #{facturacionTotal}"