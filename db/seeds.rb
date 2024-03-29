users = [
    { 
    name: "La Repubblica", 
    surname: "", 
    username: "La Repubblica",
    email: "larepubblica@gmail.com",
    password: "password",
    verified: 1
    },
    {
    name: "Ansa", 
    surname: "", 
    username:  "Ansa",
    email: "ansa@gmail.com",
    password: "password",
    verified: 1
    },
    { 
    name: "Il Sole 24 Ore", 
    surname: "", 
    username:  "Il Sole 24 Ore",
    email: "ilsole24ore@gmail.com",
    password: "password",
    verified: 1

    },
    {
    name: "Football Italia", 
    surname: "", 
    username:  "Football Italia",
    email: "footballitalia@gmail.com",
    password: "password",
    verified: 1
    },
    { 
    name: "BBC News", 
    surname: "", 
    username:  "BBC News",
    email: "bbcnews@gmail.com",
    password: "password",
    verified: 1
    },
    { 
    name: "Mario Rossi", 
    surname: "", 
    username:  "mario_rossi",
    email: "mariorossi@gmail.com",
    password: "123456"
    },
    { 
    name: "admin", 
    surname: "", 
    username:  "admin",
    email: "admin@gmail.com",
    password: "123456"
    },
    {
    name: "Il Fatto Quotidiano", 
    surname: "", 
    username:  "Il Fatto Quotidiano",
    email: "ilfattoquotidiano@gmail.com",
    password: "123456",
    verified: 1
    }
]

users.each do |user_data|
    user = User.new(user_data)
    user.skip_confirmation!
    user.save!    
    case user.username
        when "La Repubblica"
            image_path = Rails.root.join("app/assets/images/repubblica.png")
        when "Ansa"
            image_path = Rails.root.join("app/assets/images/ansa.png")
        when "Il Sole 24 Ore"
            image_path = Rails.root.join("app/assets/images/sole24.png")
        when "Football Italia"
            image_path = Rails.root.join("app/assets/images/ball.png")
        when "BBC News"
            image_path = Rails.root.join("app/assets/images/bbc.png")
        when "mario_rossi"
            image_path = Rails.root.join("app/assets/images/mario.png")
        when "admin"
            image_path = Rails.root.join("app/assets/images/admin.jpg")
        when "Il Fatto Quotidiano"
            image_path = Rails.root.join("app/assets/images/fatto.jpg")
        end
        user.avatar.attach(io: File.open(Rails.root.join(image_path)), filename: File.basename(image_path), content_type: "image/png")
  end
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
    { 
    title: "Stipendi troppo bassi contro l'inflazione. La Germania paralizzata", 
    category: "Affari", 
    body: "AGI - Al via in Germania il mega-sciopero dei trasporti organizzato dai sindacati che chiedono aumenti salariali di fronte all'inflazione. I dipendenti di aeroporti, ferrovie, trasporti marittimi, compagnie autostradali, trasporti locali hanno iniziato a mezzanotte un'interruzione del lavoro di 24 ore. La mobilitazione si inserisce",
    url: "https://www.agi.it/estero/news/2023-03-27/germania_mega-sciopero_trasporti_salari_bassi_contro_inflazione-20684365/",
    rank: 35,
    img_test: "https://images.agi.it/pictures/agi/agi/2023/03/27/085202027-95b70955-f5ee-4a34-b1aa-a273b75132aa.jpg",
    user_id: 2
    },
    { 
    title: "UE e Germania, accordo sui carburanti sintetici. Si sblocca la norma sullo stop alle endotermiche dal 2035", 
    category: "Politica", 
    body: "Accordo raggiunto con la Germania sui carburanti sintetici, si sblocca l'approvazione della norma sullo stop alla vendita di endotermiche dal 2035. E c'è un grande sconfitto: il governo",
    url: "https://www.dmove.it/news/germania-e-fuel-accordo-unione-europea",
    rank: 18,
    img_test: "https://cdn.dmove.it/images/38259/Germany_Cover.jpeg",
    user_id: 8
    },
    {
    title: "Non solo pensioni, la Francia 'brucia': manifestante in fin di vita", 
    category: "Affari", 
    body: "Una battaglia che va avanti da anni in Francia, per la costruzione di un mega bacino per la raccolta idrica nell'est del Paese diventa il nuovo fronte di scontro fra manifestanti e",
    url: "https://europa.today.it/attualita/scontri-francia-polizia-manifestazioni-ecologisti-pensioni.html",
    rank: 42,
    img_test: "https://citynews-today.stgy.ovh/~media/horizontal-hi/3549548214790/proteste-ambientalisti-francia-lapresse.jpg",
    user_id: 3
    }
])

