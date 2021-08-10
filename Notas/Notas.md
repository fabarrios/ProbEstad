# Notas de R  

En este documento agregaremos notas y comentarios pr�cticos del leguaje R o partes de c�digo. Por ejemplo por lo general en las funciones num�ricas de R si se encuentran alg�n elemento con un NA (sin contenido num�rico) por lo general se detienen sin estimar la operaci�n pudiendo detener un programa. As� casi todas las funciones de R cuentan con una opci�n `na.rm = TRUE` que si est� presente como opci�n el la funci�n, no incluyen en la estimaci�n de la funci�n los elementos con NA (no los toman en cuenta)  

## Funciones  

De las funciones m�s b�sicas de R que son de gran utilidad est�n
`sum(x)` esta funci�n suma los elementos del vector num�rico x  
`mean(x)` esta funci�n regresa la media de los elementos del vector num�rico x  
`median(x)` esta funci�n estima la mediana de los elementos del vector num�rico x  
