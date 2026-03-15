# Anti-Ban: Come Evitare il Blocco dell'Account WhatsApp

## Principio Fondamentale

**Non iniziare MAI conversazioni per primo.** Il bot deve rispondere solo a messaggi ricevuti. Gli utenti possono contattarti tramite link `wa.me`: `https://wa.me/39XXXXXXXXXX?text=Ciao`.

---

## Warm-Up del Numero (Primi 10 Giorni)

1. **Non scansionare il QR subito** dopo aver registrato un nuovo numero su WhatsApp. Attendere almeno 24 ore prima di collegare il numero alla versione web/API.
2. **Nei primi 10 giorni** non inviare messaggi tramite API e non creare gruppi.
3. **Usare il numero manualmente** per qualche giorno: inviare e ricevere messaggi con contatti reali prima di collegarlo a WAHA.
4. **Compilare il profilo**: impostare foto profilo, nome e stato. Un profilo vuoto sembra un bot.

---

## Limiti Messaggi

| Periodo | Limite Raccomandato |
|---|---|
| Primi 10 giorni | Non inviare messaggi via API |
| Nuovi contatti per giorno | Max 20 |
| Messaggi per contatto/ora | Max 4 |
| Tra un messaggio e l'altro | 30-60 secondi di pausa casuale |
| Invio continuo | MAI inviare 24/7, fare pause sostanziali |
| Orari di invio | Variare, non usare orari fissi |

---

## Protocollo Anti-Ban per Messaggi

Per apparire umani, seguire questa sequenza per ogni messaggio:

```
1. POST /api/sendSeen         → Segna come letto
2. POST /api/startTyping      → Mostra "sta scrivendo..."
3. Attendere un intervallo casuale (proporzionale alla lunghezza del messaggio)
4. POST /api/stopTyping       → Ferma indicatore
5. POST /api/sendText         → Invia il messaggio
```

### Esempio di implementazione

```python
import time
import random

def send_human_like(session, chat_id, text, api_url, api_key):
    headers = {
        "Content-Type": "application/json",
        "X-Api-Key": api_key
    }

    # 1. Segna come letto
    requests.post(f"{api_url}/api/sendSeen", json={
        "session": session, "chatId": chat_id
    }, headers=headers)

    # 2. Inizia a "scrivere"
    requests.post(f"{api_url}/api/startTyping", json={
        "session": session, "chatId": chat_id
    }, headers=headers)

    # 3. Pausa casuale (simula scrittura umana)
    typing_time = len(text) * 0.05 + random.uniform(1.0, 3.0)
    time.sleep(typing_time)

    # 4. Ferma "sta scrivendo"
    requests.post(f"{api_url}/api/stopTyping", json={
        "session": session, "chatId": chat_id
    }, headers=headers)

    # 5. Invia messaggio
    requests.post(f"{api_url}/api/sendText", json={
        "session": session, "chatId": chat_id, "text": text
    }, headers=headers)

    # 6. Pausa tra messaggi
    time.sleep(random.uniform(30, 60))
```

---

## Contenuto dei Messaggi

### Da Fare

- Personalizzare ogni messaggio con il nome del destinatario
- Inviare un solo messaggio breve quando si inizia una conversazione
- Variare la formattazione dei messaggi (spaziature, struttura)
- Usare URL shortener per i link
- Usare solo link HTTPS
- Offrire sempre opzione di disiscrizione (es. "Scrivi STOP per non ricevere piu' messaggi")

### Da NON Fare

- Non inviare lo stesso messaggio identico a molti contatti
- Non inviare messaggi lunghi o multipli senza consenso
- Non inviare link gia' segnalati come spam su WhatsApp
- Non usare link non-HTTPS
- Non usare frequentemente termini finanziari ("pagamento", "carta di credito", "bonifico") che vengono associati a truffe
- Non inviare contenuti non richiesti

---

## Sistema di Conseguenze WhatsApp

WhatsApp funziona con un sistema a punti:

- **Engagement** (risposte, conversazioni) = punti positivi
- **Segnalazioni spam/blocco** = punti negativi

Quando invii un messaggio a qualcuno che non ha il tuo numero in rubrica, WhatsApp mostra le opzioni "Aggiungi ai contatti" o "Blocca e Segnala".

**Essere segnalati come spam 5-10 volte porta al ban dell'account.**

---

## Strategia di Targeting

1. **Raggruppare i contatti per prefisso telefonico** corrispondente alla regione del tuo numero
2. **Contattare solo persone che hanno interagito** con te in precedenza
3. **Preferire conversazioni individuali** rispetto ai broadcast
4. **Non usare numeri virtuali/VoIP** - preferire SIM fisiche
5. **Usare proxy** (Plus/Pro) per instradare il traffico attraverso server geograficamente vicini al numero

---

## Uso del Proxy (Plus/Pro)

Il proxy aiuta soprattutto con numeri di certi paesi (India, Brasile) dove la scansione QR puo' fallire. Instradare il traffico tramite un proxy nella regione del numero riduce il rischio di blocco.

```json
{
  "name": "session-safe",
  "config": {
    "proxy": {
      "server": "proxy-regionale:3128",
      "username": "user",
      "password": "pass"
    }
  }
}
```

---

## Checklist Anti-Ban

- [ ] Profilo completo (foto, nome, stato)
- [ ] Numero "riscaldato" per almeno 10 giorni
- [ ] Bot risponde solo a messaggi ricevuti (non inizia conversazioni)
- [ ] Ritardi casuali tra messaggi (30-60 sec)
- [ ] Sequenza sendSeen -> startTyping -> pausa -> stopTyping -> sendText
- [ ] Messaggi personalizzati e variati
- [ ] Max 20 nuovi contatti/giorno
- [ ] Max 4 messaggi/contatto/ora
- [ ] Opzione di disiscrizione in ogni newsletter
- [ ] Nessun invio 24/7, pause regolari
- [ ] Link solo HTTPS, nessun link spam
- [ ] Proxy regionale configurato (Plus/Pro)
- [ ] Nessun termine finanziario sospetto
