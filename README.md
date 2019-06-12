# OrderingScores

Con este ejemplo podemos calcular empates y lugares de un arreglo previamente ordenado 

Las variables de entrada serían: 

```swift
let scores = [(name: String, position: Int, points: Int)]()
```

Con esto podríamos tener un tablero preliminar (sólo con los 3 primeros lugares), con empates. Por ejemplo dado:

```swift
let scoreIni = [(name: "vale1", position: 1, points: 85),
                      (name: "vale2", position: 2, points: 85),
                      (name: "vale3", position: 3, points: 85),
                      (name: "vale4", position: 4, points: 80),
                      (name: "vale5", position: 5, points: 80),
                      (name: "vale6", position: 6, points: 80),
                      (name: "vale7", position: 7, points: 80)]
                      
ordenedFirstThirdPlaces(scores: scoreIni)                      
```

Obtendríamos algo como esto:

```
globalScores:  []

Places to break:  [(name: "vale1", position: 1, points: 85), 
                   (name: "vale2", position: 1, points: 85),
                   (name: "vale3", position: 1, points: 85)]
```

Donde `globalScores` son los puntajes que dentro de los 3 primeros lugares no tienen empate

Y `Places to break` los puntajes que empataron

## Desempates

Como lo vimos en el resultado anterior, hubo un empate por la primera posición, para ello modificaremos *sólo* la puntuación:

```swift
let tie = [(name: "vale1", position: 1, points: 75), 
           (name: "vale2", position: 1, points: 85),
           (name: "vale3", position: 1, points: 95)]
           
acomodatePlacesWithTie(scores: tie)
```

Dando resultado
```
globalScores:  [(name: "vale3", position: 1, points: 95),
                (name: "vale2", position: 2, points: 85),
                (name: "vale1", position: 3, points: 75)]

Places to break:  []
```

#### Empates multiples

Dado:
```swift
let tie = [(name: "vale1", position: 1, points: 70),
           (name: "vale2", position: 1, points: 70),
           (name: "vale3", position: 1, points: 70),
           (name: "vale4", position: 1, points: 80)]
           
acomodatePlacesWithTie(scores: tie)
```

Dará resultado:
```
globalScores:  [(name: "vale4", position: 1, points: 80)]

Places to break:  [(name: "vale1", position: 2, points: 70), 
                   (name: "vale2", position: 2, points: 70), 
                   (name: "vale3", position: 2, points: 70)]
```

Dónde uno pudo desempatar y se coloca en la posición 1 y los demás siguen empatando pero por la posición 2

### Caso especial

En el ejemplo anterior pudimos ver como desempatar puntuaciones distintas, pero ahora tenemos otro tipo de empate

```swift
let tie = [(name: "vale1", position: 1, points: 80),
           (name: "vale2", position: 1, points: 60),
           (name: "vale3", position: 3, points: 100),
           (name: "vale4", position: 3, points: 70),
           (name: "vale5", position: 3, points: 70),
           (name: "vale6", position: 3, points: 70),
           (name: "vale7", position: 3, points: 70)]

           
acomodatePlacesWithTie(scores: tie)
```

Como se puede ver 2 lugares empatan por la posición 1 y los demás por la posición 3

El resultado será:

```
globalScores:  [(name: "vale3", position: 3, points: 100), 
                (name: "vale1", position: 1, points: 80), 
                (name: "vale2", position: 2, points: 60)]

Places to break:  []
```

Como podemos ver, aunque "vale3" tiene un mayor puntaje éste iba por la posición 3
