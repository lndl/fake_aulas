require 'sinatra'
require_relative 'core_ext/string'

COURSES = {
  'Assembler' => {
    7 => 'Seminario C (Assembler)',
    8 => 'Seminario C (Assembler)',
    9 => 'AyED (Assembler)',
    10 => 'AyED (Assembler)',
    11 => 'Objetos I (Assembler)',
    12 => 'Objetos I (Assembler)',
    20 => 'IBD (Assembler)',
    21 => 'IBD (Assembler)',
    22 => 'IBD (Assembler)'
  },
  'FORTRAN' => {
    7 => 'Seminario C (FORTRAN)',
    8 => 'Seminario C (FORTRAN)',
    9 => 'AyED (FORTRAN)',
    10 => 'AyED (FORTRAN)',
    11 => 'Objetos I (FORTRAN)',
    12 => 'Objetos I (FORTRAN)',
    20 => 'IBD (FORTRAN)',
    21 => 'IBD (FORTRAN)',
    22 => 'IBD (FORTRAN)'
  },
  'Lisp' => {
    7 => 'Seminario C (Lisp)',
    8 => 'Seminario C (Lisp)',
    9 => 'AyED (Lisp)',
    10 => 'AyED (Lisp)',
    11 => 'Objetos I (Lisp)',
    12 => 'Objetos I (Lisp)',
    20 => 'IBD (Lisp)',
    21 => 'IBD (Lisp)',
    22 => 'IBD (Lisp)'
  }
}

def select_course(aproximated_name)
  courses = COURSES
  choosen_course = courses.keys.max_by { |c| c.downcase.similarity aproximated_name.downcase }
  schedule = courses[choosen_course]
  current_hour = Time.now.hour
  schedule[current_hour] || 'No se han encontrado horarios'
end

get '/' do
  aula = params[:aula] || ''
  select_course aula
end
