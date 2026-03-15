# API Gruppi

## Gestione Gruppi

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/groups` | Crea nuovo gruppo |
| `GET` | `/api/{session}/groups` | Lista gruppi (`?limit=&offset=&sortBy=&sortOrder=`) |
| `GET` | `/api/{session}/groups/count` | Conteggio gruppi |
| `GET` | `/api/{session}/groups/{groupId}` | Dettagli gruppo |
| `DELETE` | `/api/{session}/groups/{groupId}` | Elimina gruppo |
| `POST` | `/api/{session}/groups/{groupId}/leave` | Esci dal gruppo |
| `POST` | `/api/{session}/groups/join` | Unisciti tramite codice/URL invito |
| `GET` | `/api/{session}/groups/join-info` | Info gruppo prima di unirsi |
| `POST` | `/api/{session}/groups/refresh` | Aggiorna gruppi dal server WhatsApp |

## Impostazioni Gruppo

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `PUT` | `/api/{session}/groups/{groupId}/subject` | Modifica nome gruppo |
| `PUT` | `/api/{session}/groups/{groupId}/description` | Modifica descrizione |
| `GET` | `/api/{session}/groups/{groupId}/picture` | Ottieni immagine profilo |
| `PUT` | `/api/{session}/groups/{groupId}/picture` | Imposta immagine (**Plus**) |
| `DELETE` | `/api/{session}/groups/{groupId}/picture` | Rimuovi immagine (**Plus**) |

## Sicurezza Gruppo

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/groups/{groupId}/settings/security/info-admin-only` | Verifica impostazione solo admin modifica info |
| `PUT` | `/api/{session}/groups/{groupId}/settings/security/info-admin-only` | Abilita/disabilita solo admin modifica info |
| `GET` | `/api/{session}/groups/{groupId}/settings/security/messages-admin-only` | Verifica restrizione messaggi |
| `PUT` | `/api/{session}/groups/{groupId}/settings/security/messages-admin-only` | Limita messaggi ai soli admin |

## Partecipanti

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/groups/{groupId}/participants` | Lista partecipanti |
| `GET` | `/api/{session}/groups/{groupId}/participants/v2` | Lista partecipanti (formato normalizzato) |
| `POST` | `/api/{session}/groups/{groupId}/participants/add` | Aggiungi partecipanti |
| `POST` | `/api/{session}/groups/{groupId}/participants/remove` | Rimuovi partecipanti |

## Amministrazione

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `POST` | `/api/{session}/groups/{groupId}/admin/promote` | Promuovi ad admin |
| `POST` | `/api/{session}/groups/{groupId}/admin/demote` | Rimuovi admin |

## Link Invito

| Metodo | Endpoint | Descrizione |
|---|---|---|
| `GET` | `/api/{session}/groups/{groupId}/invite-code` | Ottieni codice invito |
| `POST` | `/api/{session}/groups/{groupId}/invite-code/revoke` | Invalida codice invito corrente |
