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
