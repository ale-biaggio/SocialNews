User.create!([
    { 
    name: "La Repubblica", 
    surname: "", 
    username: "La Repubblica",
    email: "larepubblica@gmail.com",
    password: "password"
    },
    {
    name: "Ansa", 
    surname: "", 
    username:  "Ansa",
    email: "ansa@gmail.com",
    password: "password"
    },
    { 
    name: "Il Sole 24 Ore", 
    surname: "", 
    username:  "Il Sole 24 Ore",
    email: "ilsole24ore@gmail.com",
    password: "password"
    },
    {
    name: "Football Italia", 
    surname: "", 
    username:  "Football Italia",
    email: "footballitalia@gmail.com",
    password: "password"
    },
    { 
    name: "BBC News", 
    surname: "", 
    username:  "BBC News",
    email: "bbcnews@gmail.com",
    password: "password"
    },
    { 
    name: "nome_prova", 
    surname: "", 
    username:  "utente_prova",
    email: "11@1",
    password: "123456"
    },
    { 
    name: "admin", 
    surname: "", 
    username:  "admin",
    email: "admin@gmail.com",
    password: "123456",
    },
    {
    name: "Il Fatto Quotidiano", 
    surname: "", 
    username:  "Il Fatto Quotidiano",
    email: "ilfattoquotidiano@gmail.com",
    password: "123456"
    }
])

Post.create!([
    { 
    title: "Informatico in Spagna. “In Italia non sopportavo più la maleducazione. Valencia è il miglior compromesso al mondo”", 
    category: "Cultura", 
    body: "“Il mio percorso non è lineare, ho fatto diversi studi e lavori. E oggi sono felice”. Luciano Canosa ha 48 anni ed è un informatico: da sei anni vive in Spagna, a Valencia, dopo esser stato in Messico per quasi",
    url: "https://www.ilfattoquotidiano.it/2023/03/26/informatico-in-spagna-in-italia-non-sopportavo-piu-la-maleducazione-valencia-e-il-miglior-compromesso-al-mondo/7106534/",
    rank: 32,
    img_test: "https://st.ilfattoquotidiano.it/wp-content/uploads/2023/03/23/valencia-1200-690x362.jpg",
    user_id: 8
    },
    { 
    title: "Qualificazioni Euro2024: Spagna e Svizzera iniziano al meglio, pari per la Croazia", 
    category: "Sport", 
    body: "Inizia nel migliore dei modi l'avventura di Luis de la Fuente sulla panchina della Spagna, con Morata capitano: le Furie Rosse sconfiggono 3-0 la Norvegia, coi gol di Dani Olmo (13') e Joselu, che entra e segna una doppietta in due minuti. Il Galles riacciuffa la Croazia sull'1-1, sorridono la Turchia di Calhanoglu e la Svizzera, che travolge la Bielorussia con un perentorio 5-0. Vittorie per Romania e Scozia. Prai tra",
    url: "https://www.sportmediaset.mediaset.it/calcio/qualificazioni-euro-2024/qualificazioni-euro2024-spagna-e-svizzera-iniziano-al-meglio-pari-per-la-croazia_62695895-202302k.shtml",
    rank: 23,
    img_test: "https://img-prod.sportmediaset.mediaset.it/images/2023/03/25/210630968-1b42e577-24d5-4655-8eb2-71240f5c50f7.jpg",
    user_id: 4
    },
    { 
    title: "C'è stata una grossa perdita di petrolio a Poole Harbour, nel Regno Unito", 
    category: "Affari", 
    body: "Domenica c'è stata una grossa perdita di petrolio nel porto naturale di Poole Harbour, nel Dorset, nel sud del Regno Unito: a causa di un incidente avvenuto nel giacimento petrolifero di Wytch Farm, si è riversato in mare",
    url: "https://www.ilpost.it/2023/03/26/regno-unito-perdita-di-petrolio/",
    rank: 43,
    img_test: "https://www.ilpost.it/wp-content/uploads/2023/03/26/400x200/1679864822-poole-harbour.jpg?x64713",
    user_id: 3
    },
    { 
    title: "La politica estera del Regno Unito ha bisogno di una strategia, non di slogan", 
    category: "Politica", 
    body: "L'ex ministro degli Esteri conservatore Douglas Hurd affermò negli anni '90 che il Regno Unito era stato in grado di “superare il proprio peso” nel dopoguerra, nonostante non fosse più una grande potenza. Questa affermazione potrebbe",
    url: "https://lindro.it/la-politica-estera-del-regno-unito-ha-bisogno-di-una-strategia-non-di-slogan/",
    rank: 15,
    img_test: "https://lindro.it/wp-content/uploads/2023/03/Regno-Unito-Gran-Bretagna--696x522.jpg",
    user_id: 3
    },
])

