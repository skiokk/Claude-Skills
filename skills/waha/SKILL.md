---
name: WAHA - WhatsApp HTTP API
description: Questa skill dovrebbe essere usata quando l'utente chiede di interagire con WhatsApp tramite WAHA (WhatsApp HTTP API), ad esempio "invia un messaggio WhatsApp con WAHA", "configura sessione WAHA", "gestisci gruppi WhatsApp via API", "imposta webhook WAHA", "automatizza WhatsApp", "configura Docker WAHA", "come evitare il ban WhatsApp", "anti-ban WAHA". Copre sessioni, invio/ricezione messaggi, gruppi, canali, stati, contatti, chat, presenza, sondaggi, etichette, chiamate, profilo, eventi calendario, chiavi API, webhook, configurazione completa e best practice anti-ban.
version: 1.0.0
---

# WAHA - WhatsApp HTTP API

WAHA e' un'API HTTP REST self-hosted per WhatsApp. Si installa su server proprio via Docker e permette di automatizzare WhatsApp tramite chiamate HTTP.

## Flusso di Lavoro Tipico

1. **Avviare WAHA** con Docker (vedi `references/configuration.md` per il comando)
2. **Creare sessione** con `POST /api/sessions` includendo webhook
3. **Autenticare** scansionando il QR code da `GET /api/{session}/auth/qr`
4. **Inviare messaggi** con `POST /api/sendText` (o sendImage, sendVideo, ecc.)
5. **Ricevere messaggi** tramite webhook configurati (evento `message`)

## Versioni

| Caratteristica | Core (Gratis) | Plus (~$19/mese) | Pro (~$99/mese) |
|---|---|---|---|
| Sessioni | Solo `default` | Illimitate | Illimitate |
| Sessioni raccomandate | 1 | 2-100 | 100+ |
| Invio media (immagini, video, audio) | NO | SI | SI |
| Ricezione media | SI | SI | SI |
| Storage | Solo file | File + PostgreSQL + MongoDB + S3 | File + PostgreSQL + MongoDB + S3 |
| Dashboard UI | NO | SI | SI |
| Swagger protezione password | NO | SI | SI |
| Proxy support | NO | SI | SI |
| HMAC webhook security | NO | SI | SI |
| Health check endpoint | NO | SI | SI |
| Foto profilo (set/delete) | NO | SI (solo WPP) | SI (solo WPP) |
| Docker image | `devlikeapro/waha` | `devlikeapro/waha-plus` | `devlikeapro/waha-plus` |
| Codice sorgente | Pubblico | NO | SI (GitHub privato) |
| Supporto prioritario | NO | NO | SI |
| Licenza | Nessuna scadenza | Nessuna scadenza | Nessuna scadenza |

## Motori (Engines)

| Engine | Browser | CPU/RAM | Note |
|---|---|---|---|
| **WEBJS** | Si (Chromium) | Alto | Piu' completo, screenshot |
| **WPP** | Si (Chromium) | Alto | Completo, screenshot |
| **NOWEB** | No (WebSocket) | Basso | Leggero, senza browser |
| **GOWS** | No (WebSocket Go) | Basso | Leggero, in crescita |

Variabile: `WHATSAPP_DEFAULT_ENGINE=WEBJS|NOWEB|GOWS|WPP`
Se qualcosa non funziona con un engine, provare un altro.

## Autenticazione API

Header: `X-Api-Key: YOUR_API_KEY`
Formati chiave: plain text o `sha512:{HASH}` (raccomandato)

## Formato ID Chat

- Utente: `NUMERO@c.us` (es. `393331234567@c.us`)
- Gruppo: `NUMERO@g.us`
- Canale: `NUMERO@newsletter`
- Stato: `status@broadcast`
- LID: `NUMERO@lid`

Il `@` negli URL va codificato come `%40`.

## Riepilogo API per Categoria

### Sessioni
Creare, avviare, fermare, riavviare, eliminare sessioni. Autenticazione via QR code o pairing code.
Per i dettagli degli endpoint, consultare `references/api-sessions.md`.

### Invio Messaggi
Testo (Core), immagini/video/audio/file (**Plus**), posizione, contatti, sondaggi, liste, pulsanti, reazioni, stelle, inoltro, modifica, eliminazione. Conversione media per formati non supportati.
Per i dettagli degli endpoint, consultare `references/api-messages.md`.
Per esempi curl, consultare `examples/send-messages.sh`.

### Gruppi
Creare, eliminare, uscire, unirsi. Gestire partecipanti, admin, impostazioni sicurezza, link invito, immagine profilo.
Per i dettagli degli endpoint, consultare `references/api-groups.md`.
Per esempi curl, consultare `examples/group-management.sh`.

### Canali (Newsletter)
Creare, eliminare, cercare canali pubblici. Inviare messaggi con chatId formato `NUMERO@newsletter`.
Per i dettagli, consultare `references/api-channels-status.md`.

### Stati (Storie)
Pubblicare stati testo (Core), immagine/video/audio (**Plus**). Eliminare stati.
Per i dettagli, consultare `references/api-channels-status.md`.

### Contatti
Lista, dettagli, modifica, verifica esistenza, foto profilo, blocco/sblocco. Mappatura LID.
Per i dettagli, consultare `references/api-contacts-chats.md`.

### Chat
Lista, panoramica, archiviazione, messaggi, modifica, pin, eliminazione. Filtri e paginazione.
Per i dettagli, consultare `references/api-contacts-chats.md`.

### Presenza
Impostare stato (online, offline, typing, recording, paused). Monitorare presenza altrui. Iscriversi ad aggiornamenti.
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

### Sondaggi
Creare sondaggi e votare. Risposte singole o multiple.
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

### Etichette (WhatsApp Business)
CRUD etichette, assegnazione a chat. Attenzione: PUT etichette chat richiede lista COMPLETA.
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

### Chiamate
Rifiutare chiamate in arrivo tramite `POST /api/{session}/calls/reject`.
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

### Profilo
Ottenere/modificare nome, stato/about, foto profilo. Set/delete foto solo **Plus** con engine WPP.
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

### Eventi Calendario
Inviare eventi calendario con `POST /api/{session}/events` (solo WEBJS/WPP).
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

### Chiavi API
CRUD chiavi API con `GET/POST/PUT/DELETE /api/keys`.
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

### Server / Monitoraggio
`GET /ping`, `/api/server/version`, `/api/server/status`, `/api/server/environment`.
Health check disponibile in Plus/Pro.
Per i dettagli, consultare `references/api-presence-polls-labels-calls.md`.

## Webhook ed Eventi

25 tipi di eventi disponibili organizzati per categoria: sessione, messaggi, chat, gruppi, presenza, sondaggi, etichette, eventi calendario, chiamate.
Per la lista completa degli eventi, la configurazione webhook e la struttura dei payload, consultare `references/webhooks-events.md`.

## Configurazione e Docker

Per il comando Docker di avvio rapido (Core e Plus/Pro) e la lista completa di tutte le variabili d'ambiente (server, logging, sessioni, storage, proxy, webhook, sicurezza, dashboard, Swagger, health check, apps, ChatWoot, background jobs, multi-worker), consultare `references/configuration.md`.

## Anti-Ban: Evitare il Blocco dell'Account

Regole fondamentali per non farsi bannare da WhatsApp:

1. **Non iniziare MAI conversazioni per primo** - il bot deve solo rispondere a messaggi ricevuti
2. **Riscaldare il numero** per almeno 10 giorni prima di usarlo via API
3. **Simulare comportamento umano**: sendSeen -> startTyping -> pausa casuale -> stopTyping -> sendText
4. **Limiti**: max 20 nuovi contatti/giorno, max 4 messaggi/contatto/ora, pause 30-60 sec tra messaggi
5. **Personalizzare** ogni messaggio, mai inviare lo stesso testo a tutti
6. **5-10 segnalazioni spam = ban** dell'account
7. Offrire sempre opzione di **disiscrizione** nelle newsletter

Per la guida completa anti-ban con checklist, protocollo di invio, esempio di codice e strategia di targeting, consultare `references/anti-ban.md`.

## Note Importanti

1. **WAHA Core** supporta solo la sessione `default`. Per sessioni multiple serve **Plus/Pro**.
2. **L'invio di media** richiede **Plus/Pro**. La ricezione funziona in tutte le versioni.
3. I video devono essere **MP4 con codec libx264**. L'audio vocale deve essere **audio/ogg; codecs=opus**. Usare gli endpoint di conversione se necessario.
4. WAHA non e' affiliato con WhatsApp. L'uso di client non ufficiali puo' comportare il blocco dell'account.
5. Preferire i **webhook** rispetto al polling con `GET /api/messages` per evitare problemi di performance.
6. Il **Dashboard UI** e' disponibile solo in Plus/Pro all'URL base del server WAHA.
7. **Non esporre** l'API WAHA su reti pubbliche senza protezione API key e firewall.
