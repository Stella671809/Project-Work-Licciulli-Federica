-- query.sql

-- Ricerca Biglietti Disponibili per una Tratta
SELECT B.CodiceBiglietto, B.Prezzo, B.PostoAssegnato
FROM Biglietto B
INNER JOIN Volo V ON B.CodiceVolo = V.CodiceVolo
INNER JOIN Tratta T ON V.CodiceTratta = T.CodiceTratta
WHERE T.AeroportoPartenza = 'Roma' 
  AND T.AeroportoArrivo = 'Milano' 
  AND V.DataOraPartenza > CURRENT_TIMESTAMP;

-- Storico Prenotazioni di un Cliente
SELECT P.CodicePrenotazione, V.CodiceVolo, V.DataOraPartenza, T.AeroportoPartenza, T.AeroportoArrivo
FROM Prenotazione P
INNER JOIN Biglietto B ON P.CodiceBiglietto = B.CodiceBiglietto
INNER JOIN Volo V ON B.CodiceVolo = V.CodiceVolo
INNER JOIN Tratta T ON V.CodiceTratta = T.CodiceTratta
WHERE P.CodicePasseggero = 12345;

-- Verifica Validità di un Biglietto
SELECT B.CodiceBiglietto, B.StatusPagamento, V.DataOraPartenza
FROM Biglietto B
INNER JOIN Volo V ON B.CodiceVolo = V.CodiceVolo
WHERE B.CodiceBiglietto = 1001
  AND B.StatusPagamento = 'Pagato'
  AND V.DataOraPartenza > CURRENT_TIMESTAMP;

-- Numero di Passeggeri per Volo
SELECT V.CodiceVolo, COUNT(B.CodiceBiglietto) AS NumeroPasseggeri
FROM Biglietto B
INNER JOIN Volo V ON B.CodiceVolo = V.CodiceVolo
WHERE V.CodiceVolo = 101
GROUP BY V.CodiceVolo;

-- Elenco Voli Disponibili per una Tratta
SELECT V.CodiceVolo, V.DataOraPartenza, V.DataOraArrivo
FROM Volo V
INNER JOIN Tratta T ON V.CodiceTratta = T.CodiceTratta
WHERE T.AeroportoPartenza = 'Roma' 
  AND T.AeroportoArrivo = 'Milano'
  AND V.DataOraPartenza > CURRENT_TIMESTAMP
ORDER BY V.DataOraPartenza;
