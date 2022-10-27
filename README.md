# DS-PI-Data-Engineering-Henry
Proyecto presentado para la finalizacion de la carrera Data Science en Henry, orientado a Data Engineering. Propone demostrar el uso de varias herramientas y habilidades.

# Entre las habilidades se encuentran:
-Analisis de Datos, Transformacion de Datos, ETL, Logica.
-Entre las Herramientas se encuentran:

-Jupyter Notebooks, SQL, Python.
-Uso de Librerias de Python: FastParquet, Pandas.

# Propuesta
-Procesar los diferentes datasets.
-Crear un archivo DB con el motor de SQL que quieran. Pueden usar SQLAlchemy por ejemplo.
-Realizar en draw.io un diagrama de flujo de trabajo del ETL y explicarlo en vivo.
-Realizar una carga incremental de los archivos que se tienen durante el video.
-Realizar una query en el video, para comprobar el funcionamiento de todo su trabajo. La query a armar es la siguiente: Precio promedio de la sucursal 9-1-688.

# Procesos
Generar la Base de Datos: Se usaran todos los datos propuestos a excepcion del propuesto para la carga incremental.
En este proceso se tomaran los archivos de Producto y Sucursal y se añadiran a un archivo .db generado (Si la carpeta de Salida contiene un archivo .db lo borrara y generara uno nuevo), luego de generadas las tablas procesara todos los archivos de precio, detectando automaticamente la fecha y dejando en la tabla final de precio el ultimo precio conocido para la sucursal y el producto, junto con la fecha de la que se tomo.

# Diagrama De Flujo
![Untitled Diagram](https://user-images.githubusercontent.com/106763237/198394424-0be0f46a-5980-45bf-8a6d-4f4a864c0a66.jpg)
