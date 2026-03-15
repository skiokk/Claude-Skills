# Claude Skills

Raccolta di skill personalizzate per [Claude Code](https://claude.com/claude-code).

Le skill sono basi di conoscenza che Claude attiva automaticamente in base al contesto della conversazione, fornendo documentazione API, best practice e esempi pronti all'uso.

## Skill Disponibili

| Skill | Descrizione | Versione |
|---|---|---|
| [WAHA](#waha---whatsapp-http-api) | API completa per WhatsApp tramite WAHA | 1.0.0 |

---

## WAHA - WhatsApp HTTP API

Skill completa per [WAHA](https://waha.devlike.pro/) - WhatsApp HTTP API self-hosted. Copre tutte e tre le versioni: **Core** (gratis), **Plus** (~$19/mese) e **Pro** (~$99/mese).

### Cosa copre

- **Sessioni** - Creazione, avvio, stop, autenticazione QR/pairing
- **Messaggi** - Invio/ricezione testo, media, posizione, contatti, sondaggi, pulsanti, reazioni
- **Gruppi** - CRUD, partecipanti, admin, sicurezza, inviti
- **Canali** - Newsletter WhatsApp, ricerca, gestione
- **Stati** - Storie WhatsApp (testo, immagine, video, audio)
- **Contatti** - Gestione, blocco, verifica, LID mapping
- **Chat** - Panoramica, archiviazione, pin, cronologia messaggi
- **Presenza** - Online/offline/typing/recording
- **Sondaggi** - Creazione e voto
- **Etichette** - WhatsApp Business labels
- **Chiamate** - Rifiuto chiamate in arrivo
- **Profilo** - Nome, stato, foto profilo
- **Eventi Calendario** - Invio eventi
- **Chiavi API** - Gestione sicurezza
- **Server/Monitoraggio** - Health check, versione, stato
- **Webhook** - 25 tipi di eventi con payload
- **Configurazione** - 90+ variabili ambiente, Docker, storage, proxy
- **Anti-Ban** - Best practice, warm-up, limiti, protocollo human-like, checklist

### Struttura File

```
skills/waha/
├── SKILL.md                                    # Guida principale con overview
├── references/
│   ├── api-sessions.md                         # Endpoint sessioni e autenticazione
│   ├── api-messages.md                         # Endpoint invio messaggi e media
│   ├── api-groups.md                           # Endpoint gestione gruppi
│   ├── api-channels-status.md                  # Endpoint canali e stati
│   ├── api-contacts-chats.md                   # Endpoint contatti e chat
│   ├── api-presence-polls-labels-calls.md      # Presenza, sondaggi, etichette, chiamate, profilo, eventi, chiavi API, server
│   ├── webhooks-events.md                      # 25 eventi webhook + struttura payload
│   ├── configuration.md                        # Docker + tutte le variabili ambiente
│   └── anti-ban.md                             # Best practice anti-ban + checklist
└── examples/
    ├── session-setup.sh                        # Esempi creazione/gestione sessioni
    ├── send-messages.sh                        # Esempi invio messaggi di ogni tipo
    └── group-management.sh                     # Esempi gestione gruppi
```

### Installazione

Copia la cartella della skill nella directory globale di Claude Code:

```bash
mkdir -p ~/.claude/skills/waha
cp -r skills/waha/* ~/.claude/skills/waha/
```

La skill si attivera' automaticamente quando menzioni WAHA, WhatsApp API, o argomenti correlati in qualsiasi conversazione Claude Code.

### Trigger Automatici

La skill si attiva con query come:
- "Invia un messaggio WhatsApp con WAHA"
- "Configura sessione WAHA"
- "Gestisci gruppi WhatsApp via API"
- "Imposta webhook WAHA"
- "Come evitare il ban WhatsApp"
- "Configura Docker WAHA"

### Versioni WAHA Supportate

| Caratteristica | Core (Gratis) | Plus (~$19/mese) | Pro (~$99/mese) |
|---|---|---|---|
| Sessioni | Solo `default` | Illimitate | Illimitate |
| Invio media | No | Si | Si |
| Storage | Solo file | File + PostgreSQL + MongoDB + S3 | File + PostgreSQL + MongoDB + S3 |
| Dashboard UI | No | Si | Si |
| Proxy/HMAC | No | Si | Si |
| Health check | No | Si | Si |

---

## Come Creare una Nuova Skill

1. Creare una directory in `skills/<nome-skill>/`
2. Aggiungere un file `SKILL.md` con frontmatter YAML:
   ```yaml
   ---
   name: Nome Skill
   description: Quando attivare questa skill...
   version: 1.0.0
   ---
   ```
3. Aggiungere file di riferimento in `references/` ed esempi in `examples/`
4. Copiare in `~/.claude/skills/<nome-skill>/` per installazione globale

## Licenza

MIT
