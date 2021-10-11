#
#  Ejemplo para graficar la función Normal

#  definición de la función normal
f_norm <- function(x){
  return((1/sqrt(2*pi)*exp((-x**2)/2)))
}
# Para graficar con una línea
curve(f_norm, # función Normal estándar que definí arriba
  from = -3.5, # Desde z = -3.5
  to = 3.5,  # Hasta z = 3.5
  ylab = "Probabilidad",
  xlab = "z = (x - pormedio)/s.d.",
  main = "Funcion Normal Estándard")

# Ahora usando la función qnorm de R también se estima la
# gráfica de la función.
curve(dnorm, # usando el generador Normal de R en x
      from = -3.5, # desde z = -3.5
      to = 3.5, # a z = 3.5
      main = "Distribución Normal usando dnorm")

# Frecuencia normal acumulada usando pnorm
curve(pnorm, # usando el generador pnorm (dist acumulada a x)
      from = -3.5, # desde z = -3.5
      to = 3.5, # a z = 3.5
      main = "Distribución Normal frecuencia acumulada usando pnorm")
