# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

rails 4 per query e api
metà bdd per cucumber
deployment per heroku e distribuziuone


Ripartire con can/cannot

la-repubblica
ansa
il-sole-24-ore
google-news-it
football-italia
bbc-news

Da fare:

quando si mette like/dislike non si deve ricaricare pagina

commit ale:

in goog_news.rb n si decremente in ogni if e quindi solo se l'articolo viene aggiunto, 
a differenza di prima che si decrementava ad ogni iterazione; in questo modo possiamo mostrare
facilmente nella presentazione che con up e down i post si spostano, altrimenti poteva succedere che ci fosse un articolo con -77 e il precedente con -55, e servivano molti account oer farlo scalare.
Ora la prima testata parte da 60, la seconda da 59 e la terza da 58 ed ognuna scala di -3 ad ogni articolo aggiunto. In questo modo il feed è variegato e tutte e 3 le testate si alternano 
(salvo modifiche con up e down).

