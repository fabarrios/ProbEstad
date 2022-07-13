# Introducción
## En esta corta introducción describimos la parte practica del curso

Este curso está orientado a la solución de problemas de probabilidad y estadística, con ejemplos 
prácticos, y en particular por el enfoque del libro que estaremos usando, varios de estos problemas son de 
carácter biomédico. Los dátos biomédicos son un campu muy fertil para hacer uso de técnicas estadísticas.

## Por que R ?  
El lenguaje R en la actualidad cuenta con apmplia acptación por la comunidad académica, es un sistema que tuvo
origen en ambientes de investigación y siempre ha sido de acceso gratuito, "open access". Por la gran calidad que
tiene para resolver varios tipos de probelmas y por la extensa base programada en acceso abierto como paquetes, 
sin duda es una de las plateformas más poderosasa para resolver probelmas de "Data Science" y estádística. En la
actiualidad el leguage R cuenta con una infraestructura de paquetería abeirta en la red única.  Además en la actualidad
el sistema R cuenta con una interface gráfica que potencía su uso, RStudio, y esta plataforma combinada es la 
que recomendamos para trabajar los ejemplos, tareas y proyectos que se desarrollarán en clase.  Como la gran mayoría
del materíal que se distribuye en el INTERNET, está en inglés, les sugiero que se acostumbren a revisar la documentación
en inglés.  

## Libro del curso  
El curso no tiene un libro de texto, pero en lo general pienso seguir las ideas del libro de W.W. Daniel, Biostatistics, (yo
uso la 11a y 9a ediciones). En particular por los ejercicios y ejemplos los tomaré de este libro principalmente, varios de estos
ejemplos tienen una buena cantidad de temas relacionados con los problemas biológicos y ejemplos con temas que encontrarán de 
interés.  También hay material que pueden accesar en la red, hay varios proyecto para la enseñanza de R que estánaccesbles y
por lo general son de my buena cálidad. Otro libro que usaré de referencia es el de 
[Harrison & Pius](https://argoshare.is.ed.ac.uk/healthyr_book/) que tiene una versión abierta en la red en la liga, cuenta con el 
material en la red para seguir los ejemplos y el código de R.  Otro libro que tiene una buena cantidad de ejemplos y material 
relacionado con R es 
[Statistics de Crawley](https://www.oreilly.com/library/view/statistics-an-introduction/9781118941102/), con buenas explicaciones,
por eso lo tengo listado en los libros de texto antes de la bibliografía más general.  
Hay otros materiales de empresas que se han dedicado a la publicación de libros que tienen versiones en papel así como verisiónes 
digitales abiertas y si encuentran el material presentado de interés se puede pagar su acceso completo (sin restricción), como el libro de 
[R in Action](https://livebook.manning.com/book/r-in-action-third-edition/copyright-2020-manning-publications/v-8/5), por ejemplo.  
Hay material de consulta en español, y entre otros hay un libro digital de R y estadística en la liga [Introduccion a R](https://bookdown.org/matiasandina/R-intro/), de todas formas invito a los estudinates que no dominan el inglés a hacer un esfuerzo por practicarlo y trabajar con material editado en inglés ya que en un tema técnico simpre se encontrará que el dominió del inglés es una herramienta necesaria.

## Instalación 
Como ya lo comentamos, el prograna R es un proyecto muy importante de "open code", "open access" y "open science", goza de una popularidad
extraordinaria, en particular en la comunidad académica mundial. Es de distribución abierta y por lo tanto tiene una
licencia de distribución pública, además cuneta con una inmensa cantidad de paquetes desarrollados para diferentes proyectos, y 
cuenta con una importante cantidad de documentos públicos de ayuda. Como estos que se apuntan en este documento.
Se les recomienda bajar e instalar la última versión de R [CRAN](https://cran.r-project.org/) en donde encontrarán las distribuciónes 
para Windows, Mac, y LINUX (Fedora, UBUNTU). Y para la interface gráfica instalar la ultima verisión libre de 
[RStudio desktop](https://www.rstudio.com/products/rstudio/).

## Librerias (packetes de R)  
Como ya se a dicho el elenguaje R cuenta con una cantidad de paquetes muy grande, que aumentan las capacidades del lenguaje original 
y permiten respondet a necesidades de todo tipo.  
Aquí enlisto una pequeña lista de [paquetes de R](https://fabarrios.github.io/ProbEstad/Presenta/Libraries) que más usamos en el curso.

## Material en Inglés  
La realidad es que al ser un proyecto global de "open code, open access, open science" el material de trabajo y ayuda para R por 
lo general está en inglés, es decir el material es en su gran mayoría en inglés, por lo que los invitamos a hacer un esfuerzo para 
trabajar los materiales relacionados en inglés, uno de estos sitios sin duda es la página principal de [CRAN](https://cran.r-project.org/). 
Y entre otras favoritas está la página abierta de documentación de [R package documentation](https://rdrr.io/) que tiene una
serie muy importante de recirsos para localizar packetes, sus manuales y documentos de R en general.
La página de R-coder está muy buena y muy adecuada para el nivel del curso que estamos dando, se las recomiendo mucho 
[R-coder](https://r-coder.com/r-introduction/). Esta ´¨ltima página tiene una versión en español por ser editada por grupo de español, pero les recomiendo que hagan un esfuerzo y se acostrumbren a la documentación en inglés. Continuaré revisando material en la red para hacer recomendaciones de este 
y otros sitios. Les sugiero que también ustedes hagan búsquedas de material referente a R.  Hay una cantidad muy importante de información 
y ejemplos del uso de R. Por ejemplo una página muy interesante para aprender a hacer gráficas con 
[ggplot](http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html), entre otras. En particular la página de `rstatix` está
muy bien explicada y sobre todo las llamadas de todas las funciones y ejemplos. Frecuentemente me encuentro en dicha página haciendo consultas 
y sobre todo en el `help` del ambiente, les recomiendo marcar la página de [rtatix](https://rpkgs.datanovia.com/rstatix/index.html) ya 
que hablaremos mucho de la idea de usar "pipelines" o tuberias en el uso de R.  

## Ligas en español  
La [liga](http://www.upm.es/sfs/Rectorado/Gabinete%20del%20Rector/Notas%20de%20Prensa/2015/05/documentos/Instrucciones%20de%20instalaci%C3%B3n%20de%20R%20y%20RStudio.pdf), contine una serie de instrucciones, paso a paso en español, para instalar la última versión de R y RStudio en
los sistemas Windows, LINUX (diferentes distribuciones, como UBUNTU entre otros) y MacOS. Y en esta liga hay un [vidéo de instalación](https://www.youtube.com/watch?v=1WXgaa2Spp0), que se puede consultar. Y la página al libro de [Introducción a R](https://bookdown.org/matiasandina/R-intro/) antes mencionada.

En mi página de GitHub hay copias de material en pdf, que es de acceso público, como un manual de introducción a R en español que bajé de CRAN.  
