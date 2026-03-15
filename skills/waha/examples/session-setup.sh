#!/bin/bash
# Esempi WAHA: Creazione e gestione sessioni

BASE_URL="http://localhost:3000"
API_KEY="YOUR_API_KEY"

# --- Creare sessione con webhook ---
curl -X POST "$BASE_URL/api/sessions" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{
    "name": "default",
    "config": {
      "webhooks": [{
        "url": "https://your-webhook.example.com/waha",
        "events": ["message", "session.status"]
      }]
    }
  }'

# --- Creare sessione con proxy (Plus/Pro) ---
curl -X POST "$BASE_URL/api/sessions" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{
    "name": "session-proxy",
    "config": {
      "proxy": {
        "server": "proxy-host:3128",
        "username": "proxy-user",
        "password": "proxy-pass"
      },
      "webhooks": [{
        "url": "https://your-webhook.example.com/waha",
        "events": ["*"]
      }]
    }
  }'

# --- Ottenere QR code per autenticazione ---
curl "$BASE_URL/api/default/auth/qr" \
  -H "X-Api-Key: $API_KEY"

# --- Richiedere codice pairing (auth via telefono) ---
curl -X POST "$BASE_URL/api/default/auth/request-code" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{"phoneNumber": "393331234567"}'

# --- Lista sessioni ---
curl "$BASE_URL/api/sessions" \
  -H "X-Api-Key: $API_KEY"

# --- Lista sessioni incluse quelle ferme ---
curl "$BASE_URL/api/sessions?all=true" \
  -H "X-Api-Key: $API_KEY"

# --- Info account autenticato ---
curl "$BASE_URL/api/sessions/default/me" \
  -H "X-Api-Key: $API_KEY"

# --- Fermare sessione ---
curl -X POST "$BASE_URL/api/sessions/default/stop" \
  -H "X-Api-Key: $API_KEY"

# --- Riavviare sessione ---
curl -X POST "$BASE_URL/api/sessions/default/restart" \
  -H "X-Api-Key: $API_KEY"

# --- Logout (cancella dati autenticazione) ---
curl -X POST "$BASE_URL/api/sessions/default/logout" \
  -H "X-Api-Key: $API_KEY"

# --- Eliminare sessione ---
curl -X DELETE "$BASE_URL/api/sessions/default" \
  -H "X-Api-Key: $API_KEY"
