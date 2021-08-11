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

## Operadores para filtrado  

| Operators | Meaning |  
| --------- | ------- |  
|  ==  |  equal to  |  
|  !=  |  not equal to  |  
|  <  | less than  |  
|  >  |  greater than  |  
|  <=  |  less than or equal to  |
|  >=  |  greater than or equal to  |
|  &  |  AND  |  
|     |  OR  |  
