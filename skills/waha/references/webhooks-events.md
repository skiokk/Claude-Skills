# Webhook ed Eventi

## Configurazione Webhook

I webhook si configurano alla creazione della sessione:

```json
{
  "name": "default",
  "config": {
    "webhooks": [{
      "url": "https://your-server.com/webhook",
      "events": ["message", "session.status"],
      "hmac": {
        "key": "your-hmac-key"
      }
    }]
  }
}
```

Oppure tramite variabili ambiente globali:

| Variabile | Descrizione |
|---|---|
| `WHATSAPP_HOOK_URL` | URL endpoint webhook |
| `WHATSAPP_HOOK_EVENTS` | Eventi (comma-separated o `*` per tutti) |
| `WHATSAPP_HOOK_HMAC_KEY` | Chiave firma HMAC (**Plus**) |
| `WHATSAPP_HOOK_RETRIES_POLICY` | Politica retry (linear/exponential) |
| `WHATSAPP_HOOK_RETRIES_DELAY_SECONDS` | Ritardo retry (default: `2`) |
| `WHATSAPP_HOOK_RETRIES_ATTEMPTS` | Tentativi retry (default: `4`) |
| `WHATSAPP_HOOK_CUSTOM_HEADERS` | Header custom (`Header:Value;Header2:Value2`) |

---

## Lista Completa Eventi

### Sessione

| Evento | Descrizione |
|---|---|
| `session.status` | Cambio stato sessione (STOPPED, STARTING, SCAN_QR_CODE, WORKING, FAILED) |
| `engine.event` | Evento engine a basso livello (debug) |

### Messaggi

| Evento | Descrizione |
|---|---|
| `message` | Messaggio in arrivo (testo/audio/file) |
| `message.any` | Tutti i messaggi, inclusi quelli inviati da te |
| `message.reaction` | Reazione emoji a un messaggio |
| `message.ack` | Conferma ricezione/lettura/riproduzione |
| `message.ack.group` | Conferma in chat di gruppo |
| `message.waiting` | "In attesa del messaggio..." |
| `message.edited` | Messaggio modificato |
| `message.revoked` | Messaggio eliminato dal mittente |

### Chat

| Evento | Descrizione |
|---|---|
| `chat.archive` | Chat archiviata/ripristinata |

### Gruppi

| Evento | Descrizione |
|---|---|
| `group.v2.join` | Unione a un gruppo |
| `group.v2.leave` | Uscita da un gruppo |
| `group.v2.participants` | Cambio partecipanti |
| `group.v2.update` | Aggiornamento info gruppo |

### Presenza

| Evento | Descrizione |
|---|---|
| `presence.update` | Aggiornamento presenza utente |

### Sondaggi

| Evento | Descrizione |
|---|---|
| `poll.vote` | Voto ricevuto |
| `poll.vote.failed` | Errore decrittazione voto |

### Etichette

| Evento | Descrizione |
|---|---|
| `label.upsert` | Etichetta creata/aggiornata |
| `label.deleted` | Etichetta eliminata |
| `label.chat.added` | Etichetta applicata a chat |
| `label.chat.deleted` | Etichetta rimossa da chat |

### Eventi Calendario

| Evento | Descrizione |
|---|---|
| `event.response` | Risposta a evento (GOING, NOT_GOING, MAYBE) |
| `event.response.failed` | Errore decrittazione risposta evento |

### Chiamate

| Evento | Descrizione |
|---|---|
| `call.received` | Chiamata in arrivo |
| `call.accepted` | Chiamata accettata su altro dispositivo |
| `call.rejected` | Chiamata rifiutata/terminata |

---

## Struttura Payload Messaggio

```json
{
  "event": "message",
  "session": "default",
  "payload": {
    "id": "message_id",
    "timestamp": 1234567890,
    "from": "393331234567@c.us",
    "to": "393337654321@c.us",
    "body": "Testo del messaggio",
    "hasMedia": false,
    "replyTo": "original_message_id",
    "media": {
      "url": "http://localhost:3000/api/files/...",
      "mimetype": "image/jpeg",
      "filename": "photo.jpg",
      "error": null
    }
  }
}
```

**Download media**: includere header `X-Api-Key` nella richiesta al `media.url`.
