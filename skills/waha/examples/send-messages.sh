#!/bin/bash
# Esempi WAHA: Invio messaggi

BASE_URL="http://localhost:3000"
API_KEY="YOUR_API_KEY"
CHAT_ID="393331234567@c.us"

# --- Inviare testo ---
curl -X POST "$BASE_URL/api/sendText" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"text\": \"Ciao! Questo e' un messaggio automatico.\"
  }"

# --- Inviare testo con risposta a messaggio ---
curl -X POST "$BASE_URL/api/sendText" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"text\": \"Risposta al tuo messaggio\",
    \"reply_to\": \"MESSAGE_ID_ORIGINALE\"
  }"

# --- Inviare immagine (Plus/Pro) ---
curl -X POST "$BASE_URL/api/sendImage" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"file\": {\"url\": \"https://example.com/image.jpg\"},
    \"caption\": \"Ecco la foto!\"
  }"

# --- Inviare video (Plus/Pro) ---
curl -X POST "$BASE_URL/api/sendVideo" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"file\": {\"url\": \"https://example.com/video.mp4\"},
    \"caption\": \"Guarda questo video!\"
  }"

# --- Inviare documento (Plus/Pro) ---
curl -X POST "$BASE_URL/api/sendFile" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"file\": {\"url\": \"https://example.com/document.pdf\"},
    \"caption\": \"Ecco il documento\"
  }"

# --- Inviare posizione ---
curl -X POST "$BASE_URL/api/sendLocation" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"latitude\": 45.4642,
    \"longitude\": 9.1900,
    \"title\": \"Milano\"
  }"

# --- Inviare contatto vCard ---
curl -X POST "$BASE_URL/api/sendContactVcard" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"contacts\": [{
      \"fullName\": \"Mario Rossi\",
      \"phoneNumber\": \"+393331234567\"
    }]
  }"

# --- Reagire a un messaggio ---
curl -X POST "$BASE_URL/api/reaction" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"messageId\": \"MESSAGE_ID\",
    \"reaction\": \"👍\"
  }"

# --- Segnare messaggi come letti ---
curl -X POST "$BASE_URL/api/sendSeen" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\"
  }"

# --- Inoltrare messaggio ---
curl -X POST "$BASE_URL/api/forwardMessage" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"DESTINATARIO@c.us\",
    \"messageId\": \"MESSAGE_ID\",
    \"fromChatId\": \"$CHAT_ID\"
  }"

# --- Verificare se numero esiste su WhatsApp ---
curl "$BASE_URL/api/checkNumberStatus?phone=393331234567&session=default" \
  -H "X-Api-Key: $API_KEY"

# --- Inviare vocale (Plus/Pro) ---
curl -X POST "$BASE_URL/api/sendVoice" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"file\": {\"url\": \"https://example.com/audio.ogg\"},
    \"convert\": true
  }"

# --- Aggiungere/rimuovere stella a messaggio ---
curl -X POST "$BASE_URL/api/star" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"messageId\": \"MESSAGE_ID\",
    \"star\": true
  }"

# --- Inviare link con anteprima personalizzata ---
curl -X POST "$BASE_URL/api/send/link-custom-preview" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"url\": \"https://example.com\",
    \"title\": \"Titolo Custom\",
    \"description\": \"Descrizione anteprima\",
    \"image\": {\"url\": \"https://example.com/preview.jpg\"}
  }"

# --- Inviare messaggio con pulsanti (WEBJS) ---
curl -X POST "$BASE_URL/api/send/buttons/reply" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\",
    \"text\": \"Scegli un'opzione:\",
    \"buttons\": [
      {\"id\": \"1\", \"text\": \"Opzione 1\"},
      {\"id\": \"2\", \"text\": \"Opzione 2\"},
      {\"id\": \"3\", \"text\": \"Opzione 3\"}
    ]
  }"

# --- Modificare messaggio inviato ---
curl -X PUT "$BASE_URL/api/default/chats/$CHAT_ID/messages/MESSAGE_ID" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{\"text\": \"Testo modificato\"}"

# --- Eliminare messaggio ---
curl -X DELETE "$BASE_URL/api/default/chats/$CHAT_ID/messages/MESSAGE_ID" \
  -H "X-Api-Key: $API_KEY"

# --- Mostrare indicatore "sta scrivendo" ---
curl -X POST "$BASE_URL/api/startTyping" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\"
  }"

# --- Fermare indicatore "sta scrivendo" ---
curl -X POST "$BASE_URL/api/stopTyping" \
  -H "Content-Type: application/json" \
  -H "X-Api-Key: $API_KEY" \
  -d "{
    \"session\": \"default\",
    \"chatId\": \"$CHAT_ID\"
  }"
