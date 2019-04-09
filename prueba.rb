def procesar(micadena)
  temporal = micadena.downcase.split(' ')
  temporal.each_with_index do |a|
    if a.length >= 3
      if a[0,1] != "d"
        a.capitalize!
      end
    end
  end
  temporal.join(' ')
end

puts procesar("maria de la rosa")
puts procesar("PUENTE")
puts procesar("puente")
puts procesar("de la quintana")
puts procesar("De La Quintana")
puts procesar("DEL PILAR")
puts procesar("Ponce De Leon")
