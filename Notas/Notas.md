# Notas de R  

En este documento agregaremos notas y comentarios prácticos del leguaje R o partes de código. Por ejemplo por lo general en las funciones numéricas de R si se encuentran algún elemento con un NA (sin contenido numérico) por lo general se detienen sin estimar la operación pudiendo detener un programa. Así casi todas las funciones de R cuentan con una opción `na.rm = TRUE` que si está presente como opción el la función, no incluyen en la estimación de la función los elementos con NA (no los toman en cuenta)  

## Funciones  

De las funciones más básicas de R que son de gran utilidad están
`sum(x)` esta función suma los elementos del vector numérico x  
`mean(x)` esta función regresa la media de los elementos del vector numérico x  
`median(x)` esta función estima la mediana de los elementos del vector numérico x  
