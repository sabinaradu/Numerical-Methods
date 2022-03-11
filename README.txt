Functia Iterative - A reprezinta matricea de adiacenta care va avea 1 pe pozitia (l, c) daca c este vecin al lui l, restul elementelor fiind 0. Numarul de linkuri de pe fiecare pagina este dat de suma elementelor pe fiecare linie.
K este matricea diagonala, pt care am calculat direct inversa ei (invK). Conditia de oprire din while este cand diferenta in modul dintre R la pasul urmator si R la pasul curent este mai mica decat epsilon.

Functia Algebraic - pentru inceput se foloseste functia Iterative pentru constructia matricei de adiacenta si apoi functiile Gram_Schmidt si SST. Functia Gram_Schmidt - primeste ca parametru matricea patratica A si genereaza matricile Q care este ortogonala si R superior triunghiulara pt formula A = Q*R. Apoi functia SST si se calc inversa lui B. Functia SST - rezolva un sistem superior triunghiular. Aplic algoritmul prezentat in laborator. 

Functia GradApartenenta - primeste ca parametrii x, v1 si v2 care calculeaza valoarea functiei in x. Valoarea functiei la stanga si la dreapta trebuie sa fie egale. Se calculeaza valoarea lui y in functie de intervalul in care se afla x.


Functia PageRank - calculeaza indicii pt Iterative, Algebraic si GradApartenenta si scrie in fisierul nume.out. Concatenez ".out" la sfarsitul numelui fisierului de input pt a crea fisierul de output. Folosind functia Iterative, se calculeaza PR si se scrie in fisier si apoi cu functia Algebraic. Apoi, se sorteaza descrescator cel obtinut cu Algebraic. Functia creeaza si un vector care retine indexul fiecarui element inainte sa fie sortat (vectorul j).

