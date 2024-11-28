
## Practica: Cómo escribir un programa en Elixir para registrar datos de un estudiante y guardarlos en un archivo

Este tutorial te guiará para crear un programa en Elixir que registra los datos de un estudiante, como nombre, edad, carrera y semestre, y guarda esa información en un archivo de texto.

### Paso 1: Crear un nuevo proyecto en Elixir

Antes de comenzar, asegúrate de tener Elixir instalado en tu máquina. Si no lo tienes, sigue la [guía de instalación de Elixir](https://elixir-lang.org/install.html).

1. Abre tu terminal.
2. Crea un nuevo proyecto con el siguiente comando:

   ```bash
   touch Registro.exs
   ```
Yo estare utilizando Visual Studio Code para poder demostrarles como deberia salirles el archivo:

![image](https://github.com/user-attachments/assets/4a0ba795-34a2-4e35-b1d4-21ac1479f9da)

Recuerden que saldra con el nombre que ustedes le hayan asignado al archivo.


### Paso 2: Escribir el código

Ahora vamos a escribir el código del programa. Abre el archivo `Registro.exs` en tu editor de texto y sigue estos pasos:

#### Paso 2.1: Definir la función `welcome`

Esta función mostrará un mensaje de bienvenida al usuario.

```elixir
defmodule Registro do
  def welcome() do
    IO.puts("Bienvenido, completa los siguientes datos para registrarte.")
  end
```

#### Paso 2.2: Definir la función `ask_name`

Esta función solicitará el nombre del usuario.

```elixir
  def ask_name() do
    IO.gets("¿Cuál es tu nombre?\n") |> String.trim()
  end
```

#### Paso 2.3: Definir la función `ask_age`

Esta función pedirá la edad del usuario y la convertirá en un número entero.

```elixir
  def ask_age() do
    IO.gets("¿Cuál es tu edad?\n") |> String.trim() |> String.to_integer()
  end
```

#### Paso 2.4: Definir la función `ask_carreer`

Aquí pedimos la carrera que está estudiando el usuario.

```elixir
  def ask_carreer() do
    IO.gets("¿Qué carrera estás estudiando?\n") |> String.trim()
  end
```

#### Paso 2.5: Definir la función `ask_grade`

Solicitamos el semestre en el que se encuentra el usuario, y lo convertimos en un número entero.

```elixir
  def ask_grade() do
    IO.gets("¿En qué semestre vas (Solo ingresa el número)?\n") |> String.trim() |> String.to_integer()
  end
```

#### Paso 2.6: Definir la función `run`

Esta será la función principal del programa. Llamará a las otras funciones para obtener los datos del usuario y luego los almacenará en un mapa.

```elixir
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
```

#### Paso 2.7: Definir la función `save_to_file`

Esta función se encargará de guardar los datos en un archivo de texto llamado `registros.txt`.

```elixir
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
```

### Paso 3: Ejecutar el programa

Para ejecutar el programa, abre la terminal en el directorio de tu proyecto y ejecuta:

```bash
iex
```
Despues ya dentro del Elixir ejecutaremos lo siguiente:

```elixir
iex(3)> Registro.run
```

Esto ejecutará el programa, solicitando los datos del estudiante y luego guardándolos en un archivo llamado `registros.txt`.

---

### Conclusión

Has aprendido a crear un pequeño programa en Elixir que solicita datos de un estudiante, los guarda en un archivo de texto y los imprime en consola. ¡Ahora puedes modificar este proyecto y adaptarlo a tus necesidades!

---

Este tutorial ha sido simplificado para enfocarse solo en la creación del programa y cómo ejecutarlo localmente.
