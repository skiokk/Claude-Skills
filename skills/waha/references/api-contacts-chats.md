# API Contatti e Chat

## Contatti

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/contacts/all` | Lista tutti i contatti (`?limit=&offset=&sortBy=&sortOrder=`) |
| `GET` | `/api/contacts` | Dettagli singolo contatto (`?contactId=&session=`) |
| `PUT` | `/api/{session}/contacts/{chatId}` | Modifica contatto (firstName, lastName) |
| `GET` | `/api/contacts/check-exists` | Verifica se telefono e' su WhatsApp |
| `GET` | `/api/contacts/about` | Ottieni stato/about del contatto |
| `GET` | `/api/contacts/profile-picture` | Ottieni foto profilo (`?refresh=true`) |
| `POST` | `/api/contacts/block` | Blocca contatto |
| `POST` | `/api/contacts/unblock` | Sblocca contatto |

### LID (Linked Identifier)

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/lids` | Lista mappature LID-telefono |
| `GET` | `/api/{session}/lids/count` | Conteggio mappature LID |
| `GET` | `/api/{session}/lids/{lid}` | Mappa LID a numero telefono |
| `GET` | `/api/{session}/lids/pn/{phoneNumber}` | Mappa numero a LID |

---

## Chat

### Gestione Chat

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/chats` | Lista tutte le chat |
| `GET` | `/api/{session}/chats/overview` | Panoramica chat con ultimi messaggi |
| `POST` | `/api/{session}/chats/overview` | Panoramica (POST per filtri grandi >400) |
| `GET` | `/api/{session}/chats/{chatId}/picture` | Foto profilo chat |
| `POST` | `/api/{session}/chats/{chatId}/archive` | Archivia chat |
| `POST` | `/api/{session}/chats/{chatId}/unarchive` | Ripristina chat archiviata |
| `POST` | `/api/{session}/chats/{chatId}/unread` | Segna come non letta |
| `DELETE` | `/api/{session}/chats/{chatId}` | Elimina chat |

### Messaggi nella Chat

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/chats/{chatId}/messages` | Messaggi della chat |
| `GET` | `/api/{session}/chats/{chatId}/messages/{messageId}` | Messaggio specifico |
| `POST` | `/api/{session}/chats/{chatId}/messages/read` | Segna messaggi come letti |
| `PUT` | `/api/{session}/chats/{chatId}/messages/{messageId}` | Modifica messaggio |
| `POST` | `/api/{session}/chats/{chatId}/messages/{messageId}/pin` | Fissa messaggio |
| `POST` | `/api/{session}/chats/{chatId}/messages/{messageId}/unpin` | Rimuovi fissaggio |
| `DELETE` | `/api/{session}/chats/{chatId}/messages/{messageId}` | Elimina messaggio |
| `DELETE` | `/api/{session}/chats/{chatId}/messages` | Elimina tutti i messaggi |

### Filtri Messaggi

- `downloadMedia`: scarica media allegati
- `filter.timestamp.lte`, `filter.timestamp.gte`: filtro per data
- `filter.fromMe`: solo messaggi inviati
- `filter.ack`: filtro per stato conferma

### Parametri Paginazione

- `limit`, `offset`: paginazione
- `sortBy`: `messageTimestamp`, `id`, `name`
- `sortOrder`: `asc`, `desc`
