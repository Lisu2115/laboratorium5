# PAwChO - Laboratorium 5: Docker Multi-stage Build

## Opis projektu
Projekt został przygotowany w ramach laboratorium nr 5 z przedmiotu Programowanie Aplikacji w Chmurze Obliczeniowej. Celem zadania było stworzenie zoptymalizowanego obrazu Docker przy użyciu budowania wieloetapowego (**multi-stage build**).

### Funkcjonalność aplikacji:
Aplikacja to lekka strona monitorująca, która wyświetla:
* **Adres IP** serwera, na którym pracuje kontener.
* **Nazwę serwera** (hostname).
* **Wersję aplikacji** wstrzykiwaną podczas procesu budowania obrazu.

## Struktura Dockerfile
Plik `Dockerfile` składa się z dwóch etapów:
1. **Etap 1 (builder):** Wykorzystuje obraz `alpine:3.19`. Na tym etapie kopiowane są pliki źródłowe, a za pomocą instrukcji `sed` wstrzykiwana jest wartość wersji aplikacji zdefiniowana przez instrukcję `ARG`.
2. **Etap 2 (runtime):** Wykorzystuje obraz `nginx:alpine`. Kopiowane są do niego jedynie gotowe pliki statyczne z etapu pierwszego. Skonfigurowano również mechanizm `HEALTHCHECK`.

## Instrukcja obsługi

### 1. Budowanie obrazu
Aby zbudować obraz i nadać aplikacji konkretną wersję, należy użyć argumentu `--build-arg`:
```bash
docker build --build-arg VERSION=1.2.4-stable -t lab5-app .

2. Uruchominie kontenera

docker run -d -p 8080:80 --name monitor-lab5 lab5-app

3. Weryfikacja działania

Otwarcie przegladarki i wpisanie adresu curl http://localhost:8080

