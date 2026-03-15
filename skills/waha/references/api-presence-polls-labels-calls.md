# API Presenza, Sondaggi, Etichette, Chiamate

## Presenza

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/presence` | Imposta presenza (online, offline, typing, recording, paused) |
| `GET` | `/api/{session}/presence` | Presenza di tutte le chat |
| `GET` | `/api/{session}/presence/{chatId}` | Presenza singola chat |
| `POST` | `/api/{session}/presence/{chatId}/subscribe` | Iscriviti ad aggiornamenti presenza |

### Valori Presenza

- `online` - Online
- `offline` - Offline
- `typing` - Sta scrivendo
- `recording` - Sta registrando audio
- `paused` - In pausa

---

## Sondaggi

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/sendPoll` | Crea e invia sondaggio |
| `POST` | `/api/sendPollVote` | Vota in un sondaggio |

### Parametri sendPoll

- `session`: nome sessione
- `chatId`: ID chat destinatario
- `poll.name`: domanda del sondaggio
- `poll.options`: array di risposte
- `poll.multipleAnswers`: booleano per risposte multiple

### Parametri sendPollVote

- `session`: nome sessione
- `chatId`: ID chat dove si trova il sondaggio
- `pollMessageId`: ID del messaggio sondaggio
- `pollServerId` (opzionale): server ID per messaggi canale
- `votes`: array di opzioni selezionate

---

## Etichette (Labels) - WhatsApp Business

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/labels` | Lista tutte le etichette |
| `POST` | `/api/{session}/labels` | Crea nuova etichetta (name, color 0-19) |
| `PUT` | `/api/{session}/labels/{labelId}` | Modifica etichetta |
| `DELETE` | `/api/{session}/labels/{labelId}` | Elimina etichetta |
| `GET` | `/api/{session}/labels/{labelId}/chats` | Chat con etichetta specifica |
| `GET` | `/api/{session}/labels/chats/{chatId}/` | Etichette di una chat |
| `PUT` | `/api/{session}/labels/chats/{chatId}/` | Assegna etichette a chat |

### Parametri Label

- `name`: nome etichetta
- `color`: intero 0-19 (mappatura colore interna)
- `colorHex`: codice colore esadecimale (es. `#64c4ff`)
- `id`: identificativo univoco

**Nota**: quando aggiorni le etichette di una chat con PUT, fornire la lista COMPLETA. Le etichette non incluse vengono automaticamente rimosse.

---

## Chiamate

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/calls/reject` | Rifiuta chiamata in arrivo |

Body: `{"from": "NUMERO@c.us", "id": "CALL_ID"}`

I valori `from` e `id` provengono dall'evento webhook `call.received`.

---

## Profilo

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/profile` | Ottieni info profilo (ID, nome, foto) |
| `PUT` | `/api/{session}/profile/name` | Modifica nome visualizzato |
| `PUT` | `/api/{session}/profile/status` | Modifica stato/about |
| `PUT` | `/api/{session}/profile/picture` | Imposta foto profilo (**Plus**, solo WPP) |
| `DELETE` | `/api/{session}/profile/picture` | Rimuovi foto profilo (**Plus**, solo WPP) |

---

## Eventi Calendario (Event Messages)

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/events` | Invia evento calendario (solo WEBJS/WPP) |

### Parametri Evento

- `chatId`: ID chat destinatario
- `reply_to` (opzionale): ID messaggio per threading
- `event.name`: titolo evento
- `event.description`: dettagli evento
- `event.startTime`: timestamp Unix in secondi
- `event.endTime` (opzionale): timestamp Unix in secondi
- `event.location.name` (opzionale): nome luogo
- `event.extraGuestsAllowed`: booleano per ospiti extra

---

## Chiavi API (Security)

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/keys` | Lista chiavi API |
| `POST` | `/api/keys` | Crea nuova chiave API |
| `PUT` | `/api/keys/{id}` | Aggiorna chiave API |
| `DELETE` | `/api/keys/{id}` | Elimina chiave API |

Le chiavi supportano accesso admin o restrizioni per sessione specifica.

---

## Server / Monitoraggio

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/ping` | Verifica disponibilita' servizio (liveness) |
| `GET` | `/health` | Health check con stato storage e DB (**Plus**) |
| `GET` | `/api/server/version` | Versione installata e dettagli engine |
| `GET` | `/api/server/status` | Uptime e timestamp avvio |
| `GET` | `/api/server/environment` | Variabili configurazione |

Health check restituisce: `ok`, `error`, `shutting_down`.
