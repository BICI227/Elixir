defmodule Registro do
  def welcome() do
    IO.puts("Bienvenido, completa los siguientes datos para registrarte.")
  end

  def ask_name() do
    IO.gets("¿Cuál es tu nombre?\n") |> String.trim()
  end

  def ask_age() do
    IO.gets("¿Cuál es tu edad?\n") |> String.trim() |> String.to_integer()
  end

  def ask_carreer() do
    IO.gets("¿Qué carrera estás estudiando?\n") |> String.trim()
  end

  def ask_grade() do
    IO.gets("¿En qué semestre vas (Solo ingresa el número)?\n") |> String.trim() |> String.to_integer()
  end

  def run() do
    welcome()
    name = ask_name()
    age = ask_age()
    carreer = ask_carreer()
    grade = ask_grade()

    # Crear el mapa de datos del alumno
    alumno = %{Nombre: name, Edad: age, Carrera: carreer, Semestre: grade}
    IO.inspect(alumno, label: "Estudiante")

    # Guardar el registro en el archivo
    save_to_file(alumno)
  end
  
  def save_to_file(%{Nombre: name, Edad: age, Carrera: carreer, Semestre: grade}) do
    # Convertir el mapa a texto formateado
    data = """
    Nombre: #{name}
    Edad: #{age}
    Carrera: #{carreer}
    Semestre: #{grade}
    ---
    """

    # Agregar al archivo "registros.txt"
    case File.write("registros.txt", data, [:append]) do
      :ok -> IO.puts("Registro guardado en registros.txt")
      {:error, reason} -> IO.puts("Error al guardar el archivo: #{reason}")
    end
  end
end

Registro2.run()
