require 'sinatra'
require_relative 'core_ext/string'

set :bind, '0.0.0.0'
set :port, '8080'

COURSES = {
  'Aula 1 - PL/1' => [
    nil,
    {
      8 => 'Programación concurrente',
      9 => 'Programación concurrente',
      10 => 'Programación concurrente'
    },
    {
      8 => 'Diseño centrado en el usuario',
      9 => 'Diseño centrado en el usuario',
      10 => 'Diseño centrado en el usuario'
    },
    {
      8 => 'Diseño centrado en el usuario',
      9 => 'Diseño centrado en el usuario',
      10 => 'Diseño centrado en el usuario'
    },
    nil,
    nil,
    nil
  ],
  'Aula 2 - APL' => [
    nil,
    nil,
    {
      8 => 'Introducción a la computación móvil',
      9 => 'Introducción a la computación móvil',
      10 => 'Introducción a la computación móvil'
    },
    {
      8 => 'Introducción a la computación móvil',
      9 => 'Introducción a la computación móvil',
      10 => 'Introducción a la computación móvil'
    },
    nil,
    nil,
    nil
  ],
  'Aula 3 - COBOL' => [
    nil,
    nil,
    {
      8 => 'LIBRE',
      9 => 'Curso universidad',
      10 => 'Curso universidad'
    },
    {
      8 => 'LIBRE',
      9 => 'Curso universidad',
      10 => 'Curso universidad'
    },
    nil,
    nil,
    nil
  ],
  'Aula 4 - LISP' => [
    nil,
    nil,
    {
      8 => 'Organización de computadoras',
      9 => 'Organización de computadoras',
      10 => 'Organización de computadoras'
    },
    {
      8 => 'Organización de computadoras',
      9 => 'Organización de computadoras',
      10 => 'Organización de computadoras'
    },
    nil,
    nil,
    nil
  ],
}

def select_course(aproximated_name)
  courses = COURSES
  choosen_course = courses.keys.max_by { |c| c.downcase.similarity aproximated_name.downcase }
  schedule = courses[choosen_course]
  current_datetime = Time.now - 10800
  current_day  = current_datetime.wday
  current_hour = current_datetime.hour
  schedule[current_day][current_hour]
rescue Exception => e
  p schedule
  p current_day, current_hour
  'No se han encontrado horarios'
end

get '/' do
  aula = params[:aula] || ''
  select_course aula
end
