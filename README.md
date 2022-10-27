# DS-PI-Data-Engineering-Henry

Proyecto presentado para la finalizacion de la carrera Data Science en Henry, orientado a Data Engineering. Propone demostrar el uso de varias herramientas y habilidades.

# Entre las habilidades se encuentran:

-Analisis de Datos, Transformacion de Datos, ETL, Logica.
-Entre las Herramientas se encuentran:

-Jupyter Notebooks, SQL, Python.
-Uso de Librerias de Python: FastParquet, Pandas.

# Propuesta

En este primer proyecto proponemos realizar un proceso de ETL (extract, transform and load) a partir de un conjunto de datos que se enfocarán en una misma perspectiva de negocio. Los datos vienen de diversas fuentes de relevamiento de precios en distintos mercados. Deberán trabajar los diferentes tipos de archivos para llevarlos a una misma extensión y, una vez finalizada esta etapa, deberán crear los joins necesarios con el objetivo de crear un DER y dejarlos almacenados en un archivo con extensión .db. Por último, todo su trabajo deberá contemplar la carga incremental del archivo "precios_semana_20200518.txt".

En esta etapa de la academia, verán siempre la palabra "Plus", que hará referencia a los puntos extra disponibles para cada trabajo. Es muy importante que estos sean obviados hasta completar los requerimientos mínimos (deben entregar siempre el producto mínimo viable, MVP, que hace lo mínimo que pedimos), pero siempre recomendamos tratar de completar los plus/adicionales aún después de que el trabajo haya sido entregado, ya que generarán valor agregado a su portfolio.


# Procesos

Generar la Base de Datos: Se usaran todos los datos propuestos a excepcion del propuesto para la carga incremental.
En este proceso se tomaran los archivos de Producto y Sucursal y se añadiran a un archivo .db generado (Si la carpeta de Salida contiene un archivo .db lo borrara y generara uno nuevo), luego de generadas las tablas procesara todos los archivos de precio, detectando automaticamente la fecha y dejando en la tabla final de precio el ultimo precio conocido para la sucursal y el producto, junto con la fecha de la que se tomo.

# Diagrama De Flujo
![Untitled Diagram](https://user-images.githubusercontent.com/106763237/198394424-0be0f46a-5980-45bf-8a6d-4f4a864c0a66.jpg)

# Carga Incremental del Archivo de Excel

En este proceso se tomaran archivos de precios y se procesaran de la misma manera que en el proceso anterior, pero en este caso se hara lectura a un archivo .db y se lo escribira, los precios inexistentes seran agregados, mientras que los precios existentes seran sometidos a una comparacion donde la tabla final solo contendra el precio con la fecha mas reciente
