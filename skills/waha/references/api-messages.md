# API Invio Messaggi

## Messaggi Base

| Metodo | Endpoint | Descrizione | Versione |
|---|---|---|---|
| `POST` | `/api/sendText` | Invia messaggio di testo | Core |
| `POST` | `/api/sendImage` | Invia immagine | **Plus** |
| `POST` | `/api/sendVideo` | Invia video | **Plus** |
| `POST` | `/api/sendVoice` | Invia messaggio vocale | **Plus** |
| `POST` | `/api/sendFile` | Invia documento/file | **Plus** |
| `POST` | `/api/sendLocation` | Invia posizione GPS | Core |
| `POST` | `/api/sendContactVcard` | Invia contatto vCard | Core |
| `POST` | `/api/sendPoll` | Invia sondaggio | Core |
| `POST` | `/api/sendList` | Invia messaggio lista interattiva | **Plus** |

## Azioni sui Messaggi

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/sendSeen` | Segna messaggi come letti |
| `POST` | `/api/reaction` | Aggiungi reazione emoji |
| `POST` | `/api/star` | Aggiungi/rimuovi stella |
| `POST` | `/api/forwardMessage` | Inoltra messaggio |
| `PUT` | `/api/{session}/chats/{chatId}/messages/{messageId}` | Modifica messaggio inviato |
| `DELETE` | `/api/{session}/chats/{chatId}/messages/{messageId}` | Elimina messaggio |

## Messaggi Speciali

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/send/link-custom-preview` | Link con anteprima personalizzata |
| `POST` | `/api/send/buttons/reply` | Messaggio con pulsanti (WEBJS) |
| `POST` | `/api/sendButtons` | Menu con pulsanti (NOWEB) |
| `POST` | `/api/startTyping` | Mostra "sta scrivendo..." |
| `POST` | `/api/stopTyping` | Ferma indicatore digitazione |

## Conversione Media

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/media/convert/voice` | Converti audio in formato opus |
| `POST` | `/api/{session}/media/convert/video` | Converti video in formato supportato |

## Altre Operazioni

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/checkNumberStatus` | Verifica se numero e' su WhatsApp |
| `GET` | `/api/messages` | Recupera cronologia messaggi |

## Parametri Comuni

- `session`: nome sessione WAHA
- `chatId`: ID chat destinatario (formato `NUMERO@c.us`)
- `file`: oggetto con `url` (URL) o `data` (base64)
- `caption`: didascalia per media
- `reply_to`: ID messaggio per risposta
- `convert`: flag per conversione automatica formato
- `mentions`: array di ID da menzionare. Usare `["all"]` per menzionare tutti nel gruppo

## Modifica Messaggi

L'endpoint PUT `/api/{session}/chats/{chatId}/messages/{messageId}` permette di modificare:
- Testo del messaggio
- Didascalie (caption) di immagini e video

## Note Media

- Video: richiede MP4 con codec libx264. Usa endpoint conversione se necessario.
- Audio vocale: richiede `audio/ogg; codecs=opus`. Usa endpoint conversione.
