#!/bin/bash
# Esempi WAHA: Gestione gruppi

BASE_URL="http://localhost:3000"
API_KEY="YOUR_API_KEY"
SESSION="default"

# --- Creare gruppo ---
curl -X POST "$BASE_URL/api/$SESSION/groups" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{
    "name": "Gruppo Test",
    "participants": [
      {"id": "393331234567@c.us"},
      {"id": "393337654321@c.us"}
    ]
  }'

# --- Lista gruppi ---
curl "$BASE_URL/api/$SESSION/groups?limit=50&offset=0&sortBy=subject&sortOrder=asc" \
  -H "X-Api-Key: $API_KEY"

# --- Dettagli gruppo ---
curl "$BASE_URL/api/$SESSION/groups/120363012345678901%40g.us" \
  -H "X-Api-Key: $API_KEY"

# --- Aggiungere partecipanti ---
curl -X POST "$BASE_URL/api/$SESSION/groups/120363012345678901%40g.us/participants/add" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{"participants": [{"id": "393339876543@c.us"}]}'

# --- Rimuovere partecipanti ---
curl -X POST "$BASE_URL/api/$SESSION/groups/120363012345678901%40g.us/participants/remove" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{"participants": [{"id": "393339876543@c.us"}]}'

# --- Promuovere ad admin ---
curl -X POST "$BASE_URL/api/$SESSION/groups/120363012345678901%40g.us/admin/promote" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{"participants": [{"id": "393331234567@c.us"}]}'

# --- Modificare nome gruppo ---
curl -X PUT "$BASE_URL/api/$SESSION/groups/120363012345678901%40g.us/subject" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{"subject": "Nuovo Nome Gruppo"}'

# --- Ottenere codice invito ---
curl "$BASE_URL/api/$SESSION/groups/120363012345678901%40g.us/invite-code" \
  -H "X-Api-Key: $API_KEY"

# --- Unirsi a gruppo tramite invito ---
curl -X POST "$BASE_URL/api/$SESSION/groups/join" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{"code": "INVITE_CODE"}'

# --- Creare sondaggio in gruppo ---
curl -X POST "$BASE_URL/api/sendPoll" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d '{
    "session": "default",
    "chatId": "120363012345678901@g.us",
    "poll": {
      "name": "Dove ci vediamo?",
      "options": ["Bar Centro", "Pizzeria Roma", "Casa mia"],
      "multipleAnswers": false
    }
  }'
