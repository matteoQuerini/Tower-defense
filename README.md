# Relazione Tower Defense - Matteo Querini

## Obbiettivi del progetto

L'obiettivo di questo progetto è quello di sviluppare un software che permetta di giocare al gioco di tower defense mediante un'interfaccia grafica realizzata con Processing. Questo gioco non è progettato con una condizione di vittoria, bensì sfida il giocatore a resistere il più possibile a un'ondata prestabilita di nemici. Il software deve garantire un'esperienza di gioco non solo coinvolgente ma anche intuitiva e bilanciata, mediante una corretta gestione delle meccaniche di gioco.

---

## Requisiti funzionali

- **Gestione dei nemici**
  - I nemici seguono un percorso predefinito sulla griglia di gioco.
  - Esistono tipi di nemici differenti:
    - **Fase enemy**: velocità alta e bassa resistenza.
    - **Tank enemy**: bassa velocità e molta vita.
  - I nemici subiscono danni dalle torri.
  - Numero massimo di nemici generabili per partita.

- **Gestione delle torri**
  - I giocatori possono posizionare le torri cliccando sulle celle libere della griglia.
  - Le torri attaccano automaticamente i nemici nel loro raggio.
  - Limite massimo di torri posizionabili.

- **Percorso e griglia di gioco**
  - La griglia di gioco viene visualizzata a schermo.
  - La griglia include un percorso fisso per il transito dei nemici.
  - Sulle celle del percorso non è possibile posizionare torri.

- **Gestione del gioco**
  - Transizioni tra sezioni: menu iniziale, schermata di gioco e game over.
  - Generazione casuale di nemici con intervalli temporali.
  - Controllo delle vite del giocatore.

- **Controllo sistema audio**
  - Transizioni di colonne sonore per le tre fasi del gioco.

---

## Requisiti non funzionali

- **Usabilità**
  - Interfaccia intuitiva con pulsanti chiari.
  - Feedback in tempo reale (es. movimento nemici, eliminazioni).

- **Grafica**
  - Stile semplice ma efficace, con colori distintivi per torri, nemici e percorso.

- **Scalabilità**
  - Codice strutturato per facilitare l'aggiunta di nuove classi o funzionalità.

---

## Flusso del gioco

- **Menu iniziale**
  - Sfondo e colonna sonora in loop.
  - Opzioni: "Gioca" (inizia partita) e "Esci" (chiude il gioco).

- **Fasi di gioco**
  - **Colonna sonora e sfondo dinamici** (adattati alla fase).
  - **Posizionamento torri**: limite massimo di torri posizionabili.
  - **Ondate di nemici**: generazione casuale e periodica dei due tipi di nemici.
  - **Combattimento**: le torri attaccano automaticamente i nemici nel loro raggio.

- **Sconfitta**
  - Schermata di game over con colonna sonora e sfondo dedicati.
  - Pulsante per uscire dal gioco.

---

## Piano di sviluppo

1. **Analisi dei requisiti**
2. **Prototipazione**
   - Diagramma UML delle classi.
   - Progettazione delle schermate.
3. **Implementazione**
   - Logica del movimento dei nemici.
   - Gestione audio e transizioni.
   - Generazione nemici con limiti.
4. **Testing e debugging**
   - Bilanciamento danni/resistenza.
   - Verifica posizionamento torri e percorso.
   - Correzione errori nel movimento dei nemici.

---

## Sistema audio

- Colonne sonore per:
  - Menu iniziale.
  - Fase di gioco.
  - Game over.

---

## Tecnologie utilizzate

- **Processing**: per la creazione dell'interfaccia grafica.
- **OOP**: strutturazione del codice in classi.
- **GitHub**: versionamento e collaborazione.

---

## Problemi riscontrati

- **Movimento dei nemici**
  - Inizialmente, i nemici saltavano alcuni punti del percorso.
- **Posizionamento delle torri**
  - Torri potevano essere posizionate sul percorso (risolto con controlli aggiuntivi).

---

## Conclusione

Il progetto ha raggiunto gli obiettivi iniziali, offrendo un'esperienza bilanciata e coinvolgente. L'uso di OOP e la separazione tra logica e grafica hanno semplificato l'implementazione e future espansioni. Nonostante le difficoltà tecniche, il gioco garantisce un equilibrio tra difficoltà e divertimento, arricchito da effetti audio immersivi.
