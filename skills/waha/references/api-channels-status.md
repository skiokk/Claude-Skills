# API Canali e Stati

## Canali (Newsletter)

### Gestione Canali

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/channels` | Lista canali (`?role=OWNER\|ADMIN\|SUBSCRIBER`) |
| `POST` | `/api/{session}/channels` | Crea nuovo canale |
| `GET` | `/api/{session}/channels/{id}` | Dettagli canale per ID |
| `GET` | `/api/{session}/channels/{inviteCode}` | Dettagli canale per codice invito |
| `DELETE` | `/api/{session}/channels/{id}` | Elimina canale (solo OWNER) |

### Ricerca Canali

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/channels/search/by-view` | Cerca canali pubblici per visualizzazione |
| `POST` | `/api/{session}/channels/search/by-text` | Cerca canali pubblici per testo |
| `GET` | `/api/{session}/channels/search/views` | Opzioni di visualizzazione disponibili |
| `GET` | `/api/{session}/channels/search/countries` | Lista paesi per filtro ricerca |
| `GET` | `/api/{session}/channels/search/categories` | Lista categorie disponibili |
| `GET` | `/api/{session}/channels/{invite}/messages/preview` | Anteprima messaggi canale pubblico |

### Invio Messaggi ai Canali

Usa gli stessi endpoint di invio messaggi (`/api/sendText`, `/api/sendImage`, ecc.) con `chatId` nel formato `NUMERO@newsletter`.

---

## Stati (Storie)

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/status/text` | Pubblica stato testo |
| `POST` | `/api/{session}/status/image` | Pubblica stato immagine (**Plus**) |
| `POST` | `/api/{session}/status/video` | Pubblica stato video (**Plus**) |
| `POST` | `/api/{session}/status/voice` | Pubblica stato vocale (**Plus**) |
| `POST` | `/api/{session}/status/delete` | Elimina stato |
| `GET` | `/api/{session}/status/new-message-id` | Ottieni nuovo ID messaggio stato |

### Parametri Status

- `text`: testo dello stato
- `backgroundColor`: colore sfondo (es. `#FF5733`)
- `font`: tipo font (intero)
- `contacts` (array, opzionale): destinatari specifici (solo NOWEB/GOWS)
- `file`: URL o base64 per media
- `caption`: didascalia per immagini
- `convert`: flag per conversione automatica formato
- Video: richiede MP4 con codec libx264
- Audio: richiede `audio/ogg; codecs=opus`
