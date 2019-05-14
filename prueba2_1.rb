def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end
  

def promedio
    aux_arr = {}
    notas = read_alum('alumnos.csv')
    notas.each do |value_line|
    acc = 0
    cont = 0
    value_line.each_with_index do |elem, index|
    acc += elem.to_i if index != 0
    
    cont += 1 if index != 0
    
    end
    puts "Alumno #{value_line[0]} promedio nota: #{acc/cont}"
    aux_arr[value_line[0]] = acc
    end
    return aux_arr
end
  

def inasistencias
  aux_arr = {}
  notas = read_alum('alumnos.csv')
  notas.each do |value_line|
  cont = 0
  value_line.each_with_index do |elem, index|
  cont += 1 if elem != "A"
  end
  puts "Alumno #{value_line[0]}, #{cont} inasistencias"
  aux_arr[value_line[0]] = cont
  end
  return aux_arr
  
end
  
def aprobación
  aux_arr = {}
  notas = read_alum('alumnos.csv')
  notas.each do |value_line|
  acc = 0
  cont = 0
  value_line.each_with_index do |elem, index|
  acc += elem.to_i if index != 0
  
  cont += 1 if index != 0

  end

  if acc/cont >=5 
  puts "El alumno #{value_line[0]} aprobó"
  else 
  puts "El alumno #{value_line[0]} reprobó"
  end 
  aux_arr [value_line[0]] = acc
  end
  return aux_arr
  end
  
  

  condition = 0
  
  while condition != 4
  
    puts "Elije una opción, 1 = promedio cada alumno. 2 = inasistencias cada alumno.
     3 = aprobación cada alumno. 4 = salir"
  
    condition = gets.chomp.to_i
  
    case condition
  
    when 1
  
      promedio
  
    when 2
  
     inasistencias
  
    when 3
  
      aprobación
  
    when 4
  
      puts "salida"
  
    else
  
      puts "no valido: 1 = promedio cada alumno. 2 = inasistencias cada alumno.
      3 = aprobación cada alumno. 4 = salir"
  
    end
end