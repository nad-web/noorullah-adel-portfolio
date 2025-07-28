
# Tutorial: Funktionen

In diesem Tutorial werden Sie die grundlegende Funktionsweise von Funktionen kennenlernen. Dies beinhaltet das Erstellen und das Aufrufen von Funktionen mit sogenannten *positionellen* und *keyword*-Argumenten.

## Basic Syntax

Eine Funktion wird mit dem Schlüsselwort `def` definiert. Die grundlegende Syntax ist:


```python
def function_name(parameters):
    """docstring"""
    # code
    return result
```

- `function_name`: Der Name der Funktion. Mit diesem kann Sie in darauf folgendem Code verwendet werden. Er sollte die Aufgabe der Funktion passend beschreiben.
- `parameters`: Die Parameter, welche der Funktion übergeben werden. Diese sind optional, eine Funktion kann **keine** bis **unendlich viele** Parameter verwenden.
- `docstring`: (*Dokumentations-String*) Dieser wird verwendet, um die Funktion zu dokumentieren und ist optional, aber gerne gesehen.
- `code`: Der Code, welchen die Funktion ausführt, wenn diese aufgerufen wird.
- `return`: Die Variablen, welche die Funktion zurückgibt. Auch dies ist optional, eine Funktion muss keine Rückgabe haben.

## Positionelle und Schlüsselwort-Argumente

Betrachten Sie nun folgende Funktion, welche nichts bewirkt außer den Parameter zurückzugeben.


```python
def return_parameter(parameter):
    return(parameter)
```

Sie können diese Funktionen nun mit unterschiedlichen Argumenten aufrufen:


```python
x = 5
y = "Halloho"
z = [17, "siebzehen"]
return_parameter(x), return_parameter(y), return_parameter(z), return_parameter(return_parameter)
```

Hierbei ist klar, dass sich das Argument (`x`,`y` oder `z`) auf `parameter` bezieht. Sie können dies auf auch zusätzlich angeben:


```python
return_parameter(parameter=z)
```

Dies ist zum einen besser lesbar, wird aber besonders wichtig, wenn Sie eine Funktion mit mehreren Argumenten verwenden, beispielsweise mit dreien:


```python
def Glückwünsche(nachricht, empfänger, absender):
    return f"Von {absender} an {empfänger} : {nachricht}"
```


```python
Glückwünsche("Alles Gute!", "Oma", "Enkel")
```

Die *positionellen* Argumente müssen mit der Reihenfolge, in welcher Sie in der Funktion definiert wurden, übereinstimmen. Beim Aufruf dieser Funktion ist ohne die Angabe der Parameter-Namen nicht wirklich ersichtlich, welchen Sinn welches Argument hat. Ist "Oma" nun der Absender oder der "Empfänger"? Funktionen mit mehreren Argumenten werden durch diese rein *positionelle* Angabe schnell undurchsichtig. Daher lohnt es sich, die Argumente mit den *keywords* anzugeben.


```python
Glückwünsche(empfänger="Oma", absender="Enkel", nachricht="Alles Gute!")
```

Wie sie sehen, können Sie nun auch die Reihenfolge der Argumente ändern, da diese über den Schlüssel zugeordnet werden können. 

Es ist auch möglich, *positionelle* und *keyword*-Argumente zu vermischen, Hierbei können allerdings Fehlermeldungen auftreten. So muss es immer eindeutig sein, auf welchen Parameter Sie sich gerade beziehen. Daher können Sie nach der Verwendung von einem *keyword*-Argument **kein** positionelles mehr verwenden.


```python
Glückwünsche("Alles Gute!", empfänger="Oma", "Enkel")
```

Außerdem könnte einem Parameter sowohl ein *positionelles* als auch ein *keyword*-Argument zugeordnet werden. Auch das ist nicht zulässig:


```python
Glückwünsche("Alles Gute!", empfänger="Oma", nachricht="Enkel")
```

Die fehlerfreie Verwendung von *positionellen* und *keyword*-Argumenten sieht beispielsweise wie folgt aus:


```python
Glückwünsche("Alles Gute!", empfänger="Oma", absender="Enkel")
```

## Standardwerte

Während der Definition von einer Funktion haben Sie des Weiteren die Möglichkeit, Standardwerte (*default values*) für Parameter anzugeben. Ihre Funktion `Glückwünsche` soll beispielsweise die Nachricht "Herzlichen Glückwunsch" verwenden, wenn für `nachricht` kein Argument übergeben wird. Wichtig ist, dass Sie die Parameter mit Standardwert zuletzt definieren. Dies hat den Hintergrund, dass dann die Zuordnung der Argumente beim Funktionsaufruf mit rein positionellen Argumenten noch eindeutig bleibt.

Folgende Funktionsdefinition (Parameter mit Standardwert vor Parametern ohne Standardwert) ist also unzulässig:


```python
def Glückwünsche(nachricht="Herzlichen Glückwunsch!", empfänger, absender):
    return f"Von {absender}, an {empfänger} : {nachricht}"
```

Wenn der Parameter mit Standardwert am Ende steht, funktioniert es:


```python
def Glückwünsche(empfänger, absender, nachricht="Herzlichen Glückwunsch!"):
    return f"Von {absender} an {empfänger} : {nachricht}"
```


```python
Glückwünsche("Oma", "Enkel")
```

Die Funktion lässt sich ansonsten genauso aufrufen wie zuvor. Insbesondere lässt sich ein Wert für die Nachricht als positionelles Argument übergeben:


```python
Glückwünsche("Oma", "Enkel", "Alles Gute!")
```


```python
Glückwünsche(nachricht="Alles Gute!", empfänger="Oma", absender="Enkel")
```

## Ihre Aufgabe

Definieren Sie die Funktion `profil`. Diese soll ein kurzes Profil von einer Person erstellen können. Wie sie das macht, ist in dieser Aufgabe egal. Es soll nur darum gehen, dass sich die Funktion wie nun beschrieben aufrufen lässt:

Die Funktion kann mit vier Parametern aufgerufen werden: 
- `vorname`: Der erste Parameter der Funktion. Er repräsentiert den Vornamen der Person.
- `nachname`: Der zweite Parameter der Funktion. Er repräsentiert den Nachnamen der Person.
- `alter`: Der dritte Parameter der Funktion. Er repräsentiert das Alter der Person. **Dieser Parameter soll einen Standardwert (*default value*) von 0 haben.**
- `heimatland`: Der vierte Parameter der Funktion. Er repräsentiert das Heimatland der Funktion. **Dieser Parameter soll einen Standardwert (default value) von "Unbekannt" haben.**

Um die Funktion ohne wirklichen Codeblock anlegen zu können, können Sie `pass` verwenden. Ein Beispiel für eine solche Funktion ist:

```python
def do_nothing(parameter):
    pass
``` 

Einige Beispiele, durch welche sich die Funktion aufrufen lassen sollte: 
```python
profil("Alice", "Smith")  

profil("Bob", "Johnson", 30)  
profil("Bob", "Johnson", alter=30)

profil("Charlie", "Brown", 25, "USA")  
profil("Charlie", "Brown", alter=25, heimatland="USA")
```


```python
# Bitte schreiben Sie hier Ihren Programmcode.
```


```python
import pathlib

import pytest
from pytest_nbgrader import loader

loader.Submission.submit(profil)

args = ['-qq', '-x', '-W', 'ignore::_pytest.warning_types.PytestAssertRewriteWarning', '--cases']
subtask = "funktions_signatur"

assert pytest.main([*args, pathlib.Path('tests') / 'Funktionen' / 'funktions_signatur.yml']) is pytest.ExitCode.OK
```
