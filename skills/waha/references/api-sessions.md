# API Sessioni

## Gestione Sessioni

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/sessions` | Crea nuova sessione |
| `GET` | `/api/sessions` | Lista sessioni attive (`?all=true` per includere ferme) |
| `GET` | `/api/sessions/{session}` | Dettagli sessione |
| `PUT` | `/api/sessions/{session}` | Aggiorna configurazione |
| `DELETE` | `/api/sessions/{session}` | Elimina sessione |

## Controllo Sessione

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/sessions/{session}/start` | Avvia sessione |
| `POST` | `/api/sessions/{session}/stop` | Ferma sessione (senza logout) |
| `POST` | `/api/sessions/{session}/restart` | Riavvia sessione |
| `POST` | `/api/sessions/{session}/logout` | Logout e cancella dati auth |

## Autenticazione WhatsApp

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/auth/qr` | Ottieni QR code (`?format=raw\|image`) |
| `POST` | `/api/{session}/auth/request-code` | Richiedi codice pairing (auth via telefono) |
| `GET` | `/api/sessions/{session}/me` | Info account autenticato |
| `GET` | `/api/screenshot` | Screenshot sessione (solo WEBJS/WPP) |
