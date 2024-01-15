    Pentru implementarea functiilor din aceasta tema am utilizat informatiile invatate
la curs si laborator, precum si tutoriale si informatii de pe internet.
    La primul task, pentru a cripta textul dat, am folosit registrele esi si edi,
pentru sursa si destinatie. Am folosit cunostintele invatate despre memorie pentru
a manipula adresele si valorile aferente pentru a cripta caracter cu caracter.
In limbajul C acest cod ar fi fost echivalent cu un for de la inceputul la sfarsitul
string-ului, iar enc_string[i] = plain[i] + step. Pentru a cripta textul corect,
fiecare caracter trebuia transformat intr-o majuscula, daca nu era deja.
    Pentru cel de-al doilea task, am calculat distantele respective si apoi
le-am stocat in adresa data din vector. Am apelat functia points_distance in
cadrul functiei road, folosind extern si call. Instructiunile din fisierul 
points_distance.asm sunt echivalente unui if imbricat care verifica directia
pe care segmentul format de doua puncte este paralel cu o axa.
    Nu am reusit sa lucrez si la restul task-urilor deoarece nu am avut timp,
dar tematica acestei teme mi-a placut si mi s-a parut foarte interesanta. In
acelasi timp m-a ajutat sa inteleg mai bine lucrul cu memoria si scrierea codului
in limbajul assembly.