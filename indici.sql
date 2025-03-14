-- indici.sql

CREATE INDEX idx_passeggero_email ON Passeggero (Email);

CREATE INDEX idx_biglietto_volo ON Biglietto (CodiceVolo, CodiceBiglietto);

CREATE INDEX idx_volo_codice ON Volo (CodiceVolo);

CREATE INDEX idx_tratta ON Tratta (CodiceTratta);

CREATE INDEX idx_prenotazione_passeggero ON Prenotazione (CodicePasseggero, CodiceVolo);
