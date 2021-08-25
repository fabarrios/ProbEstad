# Notas de R  

En este documento agregaremos notas y comentarios prácticos del leguaje R o partes de código. Por ejemplo por lo general en las funciones numéricas de R si se encuentran algún elemento con un NA (sin contenido numérico) se detienen sin estimar la operación pudiendo detener un programa. Así casi todas las funciones de R cuentan con una opción `na.rm = TRUE` que si está presente como opción en la función, no incluyen en la estimación de la función aquellos elementos con NA (no los toman en cuenta).  

## Funciones  
De las funciones más básicas de R que son de gran utilidad están:  
`sum(x)` esta función suma los elementos del vector numérico x.  
`mean(x)` esta función regresa la media de los elementos del vector numérico x, como (`sum(x)/lenght(x)`).  
`median(x)` esta función estima la mediana de los elementos del vector numérico x.  
`min(x)` y `max(x)` estiman el mínimo y el máximo numérico del vector x.  
`sd(x)` y `var(x)` estiman la desviación estándar y la varianza del vector x.  
`IQR(x)` estima el Inter Quartile Range, la distancia intercuartile de x, usa la funcion `quantile(x)`.  

Para variables paramétricas, tenemos `mean(x)` media y `sd(x)` desviación estándar, como estimadores de medida central y dispersión. Y para medidas no-paramétricas tenemos `median(x)` mediana y `mad(x)` (median absolute deviation) desviación de la mediana, como medidas de centralidad.  

## Operadores lógicos de filtrado  

| Operators | Meaning |  
| :-------: | ------- |  
|  ==  |  equal to  |  
|  !=  |  not equal to  |  
|  <  | less than  |  
|  >  |  greater than  |  
|  <=  |  less than or equal to  |
|  >=  |  greater than or equal to  |
|  &  |  AND  |  
|  \| |  OR  |  

## Recusrso importante !!!  
Un recurso muy importante y práctico para el uso de voirs de los recursos de Rstudio y varios de los paquetes miembros de la familia (y extras) de `tidyverse` son las "Cheatsheets" (hojas de trampa, o mejor dicho en español acordiones) estos acordiones son muy utilizados y prácticos y acaban de ser revisados y re-publicados, es muy recomendable imprimirlos (en color) y guardarlos en una carpeta de trabajo. Yo los uso frecuentemenre. [Acordiones](https://www.rstudio.com/resources/cheatsheets/) de la familia `tidy` de Rstudio. **Pueden encontrar una copia de las últimas versiones en pdf en el directorio pdf de mi repositorio.**  

## Tidy Data (de acuerdo a `dplyr`)  
Para hacer uso de estos comandos hay que cargar la `tidyverse` por medio del comando `library()`. Estos comandos son usados frecuentemente con el comando de "tubería o tubo" `%>%` y son de extrema utilidad al manipular estructuras de datos, o tablas o cómo se llaman en los datos "tidy" tibbles (tablas) en esta [liga](https://es.r4ds.hadley.nz/tibbles.html) se encuentra un documento que explica en R el manejo de "tibbles".  
Aquí se lista algunos comandos básicos (muy básicos) y conceptoe fundamentales del orden que debe seguir una tabla de tados o tibble:  
- Cada variable está en una columna  
- Cada observación es un renglón  
- Cada valor es la celda  
  
  
Algunos (pocos) comandos para transformación de datos en "tidy data" de `dplyr` (vervos de manipulación de datos)    
- Para escojer observaciones por sus valores  
 `filter()`  
- Para reordenar renglones  
 `arrange()`  
- Para seleccionar variables por nombre  
 `select()`  
- Para creas una variable (columna) nueva en una tibble existente  
 `mutate()`  
- Todas se pueden usar junto con  
 `group_by()`  
Estos son solo algunas funciones y comentarios para recordar el uso de algunos comandos de `dplyr`.  
 
## Gráficas con ggplot  
 Para gráficas en `ggplot` ademas del libro de [Harrison & Pius](https://argoshare.is.ed.ac.uk/healthyr_book/), hay varias páginas en la red que tienen recursos para aprender a hacer gráficas en ggplot una buena es [plotly](https://plotly.com/ggplot2/)  
 
## Librerías de R (CRAN)  
Algunas [librerías de R](https://fabarrios.github.io/ProbEstad/Presenta/Libraries) estan latabla, pero al instalar se instalan varias otras librerías que complementan la operación del conjunto. Siempre es bueno checar por compatibilidades de las librerías cargadas en memoria.  

