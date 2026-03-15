# Configurazione Completa WAHA

## Docker - Avvio Rapido

### Core

```bash
docker run -d \
  --name waha \
  -p 3000:3000 \
  -e WHATSAPP_DEFAULT_ENGINE=NOWEB \
  -e WAHA_API_KEY=your-api-key \
  devlikeapro/waha
```

### Plus/Pro

```bash
docker run -d \
  --name waha-plus \
  -p 3000:3000 \
  -e WHATSAPP_DEFAULT_ENGINE=NOWEB \
  -e WAHA_API_KEY=your-api-key \
  -e WAHA_MEDIA_STORAGE=POSTGRESQL \
  -e WHATSAPP_SESSIONS_POSTGRESQL_URL=postgres://user:pass@db:5432/waha \
  -e WAHA_MEDIA_POSTGRESQL_URL=postgres://user:pass@db:5432/waha \
  devlikeapro/waha-plus
```

---

## Variabili Ambiente

### Server

| Variabile | Descrizione | Default |
|---|---|---|
| `WHATSAPP_API_PORT` | Porta HTTP | `3000` |
| `PORT` | Porta alternativa (Heroku) | `3000` |
| `WHATSAPP_API_HOSTNAME` | Hostname server | `localhost` |
| `WHATSAPP_API_SCHEMA` | Schema per media.url nei webhook | `https` |
| `WAHA_BASE_URL` | URL base per media.url | `{schema}://{hostname}:{port}` |
| `WAHA_PUBLIC_URL` | URL pubblico dashboard | - |
| `TZ` | Timezone container | `UTC` |
| `WAHA_DEBUG_MODE` | Abilita API di sviluppo | `false` |

### Engine

| Variabile | Descrizione | Default |
|---|---|---|
| `WHATSAPP_DEFAULT_ENGINE` | Engine da usare (WEBJS/NOWEB/GOWS/WPP) | `WEBJS` |
| `WAHA_WEBJS_PUPPETER_ARGS` | Argomenti Puppeteer WEBJS | `--single-process` |
| `GODEBUG` | Resolver DNS per GOWS | `netdns=cgo` |

### Logging

| Variabile | Descrizione | Default |
|---|---|---|
| `WAHA_LOG_FORMAT` | Formato log (PRETTY/JSON) | `PRETTY` |
| `WAHA_LOG_LEVEL` | Livello log (error/warn/info/debug/trace) | `info` |
| `WAHA_HTTP_LOG_LEVEL` | Log richieste HTTP | `info` |
| `DEBUG` | Shortcut per debug (`1` = debug) | - |

### Sessioni

| Variabile | Descrizione | Default |
|---|---|---|
| `WAHA_AUTO_START_DELAY_SECONDS` | Ritardo tra riavvii sessioni | `0` |
| `WAHA_PRINT_QR` | Stampa QR in console | `True` |
| `WAHA_WORKER_ID` | ID worker per ripristino sessioni | `waha1` |
| `WHATSAPP_RESTART_ALL_SESSIONS` | Riavvia tutte le sessioni al restart | `True` |
| `WAHA_WORKER_RESTART_SESSIONS` | Riavvia sessioni al restart worker | `True` |
| `WHATSAPP_START_SESSION` | Sessioni da avviare automaticamente (comma-separated) | - |
| `WAHA_CLIENT_DEVICE_NAME` | Nome dispositivo nei linked devices | - |
| `WAHA_CLIENT_BROWSER_NAME` | Nome browser visualizzato | `Chrome` |

### Namespace

| Variabile | Descrizione |
|---|---|
| `WAHA_NAMESPACE` | Namespace storage principale (raccomandato: `all`) |
| `WAHA_SESSION_NAMESPACE` | Namespace storage sessioni |

### Ignora Chat

| Variabile | Descrizione | Default |
|---|---|---|
| `WAHA_SESSION_CONFIG_IGNORE_STATUS` | Ignora status@broadcast | `false` |
| `WAHA_SESSION_CONFIG_IGNORE_GROUPS` | Ignora eventi gruppi | `false` |
| `WAHA_SESSION_CONFIG_IGNORE_CHANNELS` | Ignora eventi canali | `false` |
| `WAHA_SESSION_CONFIG_IGNORE_BROADCAST` | Ignora eventi broadcast | `false` |

### Presenza

| Variabile | Descrizione | Default |
|---|---|---|
| `WAHA_PRESENCE_AUTO_ONLINE` | Auto online | `False` |
| `WAHA_PRESENCE_AUTO_ONLINE_DURATION_SECONDS` | Durata auto online | `25` |

### Storage Sessioni

| Variabile | Descrizione | Default |
|---|---|---|
| `WAHA_LOCAL_STORE_BASE_DIR` | Directory storage locale | `/app/.sessions` |
| `WAHA_SQLITE_ENGINE` | Driver SQLite | `sqlite3` |
| `WHATSAPP_SESSIONS_POSTGRESQL_URL` | URL PostgreSQL sessioni (**Plus**) | - |
| `WHATSAPP_SESSIONS_MONGO_URL` | URL MongoDB sessioni (**Plus**, deprecato) | - |

### Storage Media

| Variabile | Descrizione | Default |
|---|---|---|
| `WHATSAPP_DOWNLOAD_MEDIA` | Abilita download media | `true` |
| `WHATSAPP_FILES_MIMETYPES` | Mimetypes da scaricare | tutti |
| `WHATSAPP_FILES_LIFETIME` | Secondi prima eliminazione (0=permanente) | `180` |
| `WHATSAPP_FILES_FOLDER` | Directory storage media | `/tmp/whatsapp-files` |
| `WAHA_MEDIA_STORAGE` | Backend media (S3/POSTGRESQL) | locale |
| `WAHA_MEDIA_POSTGRESQL_URL` | URL PostgreSQL media (**Plus**) | - |

### Storage S3 (Plus/Pro)

| Variabile | Descrizione |
|---|---|
| `WAHA_S3_REGION` | Regione AWS |
| `WAHA_S3_BUCKET` | Nome bucket |
| `WAHA_S3_ACCESS_KEY_ID` | Chiave accesso AWS |
| `WAHA_S3_SECRET_ACCESS_KEY` | Chiave segreta AWS |
| `WAHA_S3_ENDPOINT` | Endpoint personalizzato (MinIO) |
| `WAHA_S3_FORCE_PATH_STYLE` | Forza URL path-style |
| `WAHA_S3_PROXY_FILES` | Proxy file tramite WAHA vs URL pre-firmati |

### Proxy

| Variabile | Descrizione |
|---|---|
| `WHATSAPP_PROXY_SERVER` | Proxy singolo (`host:port`, senza http://) |
| `WHATSAPP_PROXY_SERVER_USERNAME` | Username proxy |
| `WHATSAPP_PROXY_SERVER_PASSWORD` | Password proxy |
| `WHATSAPP_PROXY_SERVER_LIST` | Lista proxy comma-separated (round-robin) |
| `WHATSAPP_PROXY_SERVER_INDEX_PREFIX` | Prefisso nome sessione per selezione proxy |

### Webhook Globali

| Variabile | Descrizione |
|---|---|
| `WHATSAPP_HOOK_URL` | URL endpoint webhook |
| `WHATSAPP_HOOK_EVENTS` | Eventi (comma-separated o `*` per tutti) |
| `WHATSAPP_HOOK_HMAC_KEY` | Chiave firma HMAC (**Plus**) |
| `WHATSAPP_HOOK_RETRIES_POLICY` | Politica retry (linear/exponential) |
| `WHATSAPP_HOOK_RETRIES_DELAY_SECONDS` | Ritardo retry (default: `2`) |
| `WHATSAPP_HOOK_RETRIES_ATTEMPTS` | Tentativi retry (default: `4`) |
| `WHATSAPP_HOOK_CUSTOM_HEADERS` | Header custom |

### Sicurezza

| Variabile | Descrizione |
|---|---|
| `WAHA_API_KEY` | Chiave API (plain o `sha512:{HASH}`) |
| `WAHA_NO_API_KEY` | Disabilita requisito chiave API |
| `WHATSAPP_API_KEY_EXCLUDE_PATH` | Path esclusi da autenticazione |

### Dashboard (Plus/Pro)

| Variabile | Descrizione | Default |
|---|---|---|
| `WAHA_DASHBOARD_ENABLED` | Abilita dashboard | `true` |
| `WAHA_DASHBOARD_USERNAME` | Username login | `waha` |
| `WAHA_DASHBOARD_PASSWORD` | Password login | `waha` |
| `WAHA_DASHBOARD_NO_PASSWORD` | Disabilita password | - |

### Swagger (Plus/Pro)

| Variabile | Descrizione | Default |
|---|---|---|
| `WHATSAPP_SWAGGER_ENABLED` | Abilita Swagger | `true` |
| `WHATSAPP_SWAGGER_USERNAME` | Username basic auth | - |
| `WHATSAPP_SWAGGER_PASSWORD` | Password basic auth | - |
| `WHATSAPP_SWAGGER_NO_PASSWORD` | Disabilita password | - |
| `WHATSAPP_SWAGGER_CONFIG_ADVANCED` | Configurazione avanzata | `true` |

### Health Check (Plus/Pro)

| Variabile | Descrizione | Default |
|---|---|---|
| `WHATSAPP_HEALTH_MEDIA_FILES_THRESHOLD_MB` | Soglia storage media | `100` |
| `WHATSAPP_HEALTH_SESSIONS_FILES_THRESHOLD_MB` | Soglia storage sessioni | `100` |
| `WHATSAPP_HEALTH_MONGODB_TIMEOUT` | Timeout check MongoDB (ms) | `5000` |

### Apps / Integrazioni

| Variabile | Descrizione |
|---|---|
| `WAHA_APPS_ENABLED` | Abilita funzionalita' Apps |
| `WAHA_APPS_ON` | App abilitate (comma-separated) |
| `WAHA_APPS_OFF` | App disabilitate (comma-separated) |
| `REDIS_URL` | URL Redis per background jobs |

### ChatWoot

| Variabile | Descrizione |
|---|---|
| `WAHA_CHATWOOT_COMMAND_PREFIX` | Prefisso comandi (default: `wa/`) |
| `WAHA_CHATWOOT_MESSAGE_CALENDAR_THRESHOLD_SECONDS` | Soglia icona calendario |
| `RACK_TIMEOUT_SERVICE_TIMEOUT` | Timeout ChatWoot (aumentare a `60`) |
| `CONVERSATION_MESSAGE_PER_MINUTE_LIMIT` | Limite messaggi/minuto |
| `RACK_ATTACK_LIMIT` | Limite richieste |
| `RACK_ATTACK_ALLOWED_IPS` | IP whitelist |

### Background Jobs

| Variabile | Descrizione | Default |
|---|---|---|
| `WAHA_APPS_JOBS_CONCURRENCY` | Job concorrenti | `50` |
| `WAHA_APPS_JOBS_ATTEMPTS` | Tentativi retry | `3` |
| `WAHA_APPS_JOBS_DELAY` | Ritardo prima del job (ms) | `0` |
| `WAHA_APPS_JOBS_BACKOFF_TYPE` | Strategia backoff | `exponential` |
| `WAHA_APPS_JOBS_BACKOFF_DELAY` | Ritardo base backoff (ms) | `1000` |

### Multi-Worker

| Variabile | Descrizione |
|---|---|
| `WAHA_WORKER_ID` | ID univoco per worker |
| `WAHA_WORKER_RESTART_SESSIONS` | Riavvia sessioni al restart worker |
