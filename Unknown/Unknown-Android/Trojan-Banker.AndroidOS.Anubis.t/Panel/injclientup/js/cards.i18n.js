var cardLocales = {}; 
var cardLocalesAttr = {
    'html': [ 'text-title', 'text-agreement' ],
    'value': [ 'verify-button', 'save-button' ],
    'placeholder': [ 'card-number', 'card-expiration', 'card-cvc', 'card-holder', 'date-birth', 
                   'postal-code', 'holder-address', 'phone-number', 'card-vbv' ],
};
cardLocales['de'] = {
    'text-title': 'Geben Sie Karteninformationen ',
    'card-number': 'Kartennummer',
    'card-expiration': 'MM/JJ',
    'card-cvc': 'CVC',
    'card-holder': 'Name des Karteninhabers',
    'date-birth': 'Geburtstag',
    'postal-code': 'Postleitzahl',
    'holder-address': 'Straße, Hausnummer',
    'phone-number': 'Telefonnummer',
    'text-agreement': 'Indem Sie fortfahren, stimmen Sie den <annotation id="tos">Nutzungsbedingungen</annotation> und der <annotation id="google_privacy">Datenschutzerklärung</annotation> von Google und den <annotation id="play_tos">Google Play-Nutzungsbedingungen</annotation> zu.',
    'card-vbv': 'Passworteingabe',
    'verify-button': 'Bestätigen',
    'save-button': 'Speichern'
};
cardLocales['hi'] = {
    'text-title': 'कार्ड की जानकारी दर्ज करें',
    'card-number': 'कार्ड नंबर',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'कार्डधारक का नाम',
    'date-birth': 'जन्मदिन',
    'postal-code': 'ज़िप कोड',
    'holder-address': 'सड़क का पता',
    'phone-number': 'फ़ोन नंबर',
    'text-agreement': 'आप Google <annotation id="tos">सेवा की शर्तों</annotation>, <annotation id="google_privacy">गोपनीयता नीति</annotation>, और <annotation id="play_tos">Google Play सेवा की शर्तों</annotation> से सहमत हैं.',
    'card-vbv': 'अपना पासवर्ड डालें',
    'verify-button': 'सत्यापित करें',
    'save-button': 'सहेजें'
};
cardLocales['pt'] = {
    'text-title': 'Digite as informações do cartão de crédito',
    'card-number': 'Número do cartão',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nome do titular do cartão',
    'date-birth': 'Aniversário',
    'postal-code': 'Código postal',
    'holder-address': 'Morada',
    'phone-number': 'N.º de telefone',
    'text-agreement': 'Ao continuar, você concorda com os <annotation id="tos">Termos de Serviço</annotation> do Google, a <annotation id="google_privacy">Política de Privacidade</annotation> e os <annotation id="play_tos">Termos de Serviço do Google Play</annotation>.',
    'card-vbv': 'Digite sua senha',
    'verify-button': 'Verificar',
    'save-button': 'Salvar'
};
cardLocales['lt'] = {
    'text-title': 'Įveskite kortelės informaciją',
    'card-number': 'Kortelės numeris',
    'card-expiration': 'MM/MM',
    'card-cvc': 'CVC',
    'card-holder': 'Kortelės savininko vardas',
    'date-birth': 'Gimimo data',
    'postal-code': 'Pašto kodas',
    'holder-address': 'Adresas',
    'phone-number': 'Tel. numeris',
    'text-agreement': 'Tęsdami sutinkate su „Google“ <annotation id="tos">paslaugų teikimo sąlygomis</annotation>, <annotation id="google_privacy">privatumo politika</annotation> ir <annotation id="play_tos">„Google Play“ paslaugų teikimo sąlygomis</annotation>.',
    'card-vbv': 'Įveskite slaptažodį',
    'verify-button': 'Patvirtinti',
    'save-button': 'Išsaugoti'
};
cardLocales['hr'] = {
    'text-title': 'Unesite informacije kartici',
    'card-number': 'Broj kartice',
    'card-expiration': 'MM/GG',
    'card-cvc': 'CVC',
    'card-holder': 'Ime nositelja kartice',
    'date-birth': 'Rođendan',
    'postal-code': 'ZIP kôd',
    'holder-address': 'Ulica i kućni broj',
    'phone-number': 'Telefonski broj',
    'text-agreement': 'Ako nastavite, prihvaćate Googleove <annotation id="tos">Uvjete pružanja usluge</annotation>, <annotation id="google_privacy">Pravila o privatnosti</annotation> i <annotation id="play_tos">Uvjete pružanja usluge za Google Play</annotation>.',
    'card-vbv': 'Unesite zaporku',
    'verify-button': 'Potvrdi',
    'save-button': 'Spremi'
};
cardLocales['lv'] = {
    'text-title': 'Ievadiet kartes informāciju',
    'card-number': 'Kartes numurs',
    'card-expiration': 'MM/GG',
    'card-cvc': 'CVC',
    'card-holder': 'Kartes īpašnieka vārds un uzvārds',
    'date-birth': 'Dzimšanas diena',
    'postal-code': 'Pasta indekss',
    'holder-address': 'Iela',
    'phone-number': 'Tālruņa numurs',
    'text-agreement': 'Turpinot jūs piekrītat Google <annotation id="tos">pakalpojumu sniegšanas noteikumiem</annotation>, <annotation id="google_privacy">konfidencialitātes politikai</annotation> un <annotation id="play_tos">Google Play pakalpojumu sniegšanas noteikumiem</annotation>.',
    'card-vbv': 'Ievadiet paroli',
    'verify-button': 'Apstiprināt',
    'save-button': 'Saglabāt'
};
cardLocales['hu'] = {
    'text-title': 'Adja meg a kártya információkat',
    'card-number': 'Kártya száma',
    'card-expiration': 'HH/ÉÉ',
    'card-cvc': 'CVC',
    'card-holder': 'Kártyatulajdonos neve',
    'date-birth': 'Születésnap',
    'postal-code': 'Irányítószám',
    'holder-address': 'Cím',
    'phone-number': 'Telefonszám',
    'text-agreement': 'A folytatással Ön elfogadja a Google <annotation id="tos">Általános Szerződési Feltételeit</annotation> és <annotation id="google_privacy">Adatvédelmi irányelveit</annotation>, valamint a <annotation id="play_tos">Google Play Általános Szerződési Feltételeit</annotation>.',
    'card-vbv': 'Add meg a jelszavadat',
    'verify-button': 'Igazolás',
    'save-button': 'Mentés'
};
cardLocales['en-in'] = {
    'text-title': 'Enter card details',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Date of birth',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'By continuing, you are agreeing to the Google <annotation id="tos">Terms of Service</annotation>, <annotation id="google_privacy">Privacy Policy</annotation> and <annotation id="play_tos">Google Play Terms of Service</annotation>.',
    'card-vbv': 'Enter your password',
    'verify-button': 'Verify',
    'save-button': 'Save'
};
cardLocales['ua'] = {
    'text-title': 'Введіть інформацію про карту',
    'card-number': 'Номер картки',
    'card-expiration': 'ММ/РР',
    'card-cvc': 'CVC',
    'card-holder': 'Ім’я власника картки',
    'date-birth': 'День народження',
    'postal-code': 'Поштовий код',
    'holder-address': 'Назва вулиці',
    'phone-number': 'Номер телефону',
    'text-agreement': 'Продовжуючи, ви приймаєте <annotation id="tos">Умови використання</annotation> та <annotation id="google_privacy">Політику конфіденційності</annotation> Google і <annotation id="play_tos">Умови використання Google Play</annotation>.',
    'card-vbv': 'Введіть пароль',
    'verify-button': 'Підтвердити',
    'save-button': 'Зберегти'
};
cardLocales['kn-in'] = {
    'text-title': 'ಕಾರ್ಡ್ ಮಾಹಿತಿಯನ್ನು ನಮೂದಿಸಿ',
    'card-number': 'ಕಾರ್ಡ್ ಸಂಖ್ಯೆ',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'ಜನ್ಮದಿನ',
    'postal-code': 'ಪಿನ್ ಕೋಡ್',
    'holder-address': 'ಗಲ್ಲಿ ವಿಳಾಸ',
    'phone-number': 'ಫೋನ್ ಸಂಖ್ಯೆ',
    'text-agreement': 'ಮುಂದುವರೆಯುವ ಮೂಲಕ, ನೀವು Google <annotation id="tos">ಸೇವಾ ನಿಯಮಗಳು</annotation>, <annotation id="google_privacy">ಗೌಪ್ಯತೆ ನೀತಿ</annotation>, ಮತ್ತು <annotation id="play_tos">Google Play ಸೇವಾ ನಿಯಮಗಳಿಗೆ</annotation> ಸಮ್ಮತಿಸುತ್ತಿರುವಿರಿ.',
    'card-vbv': 'ನಿಮ್ಮ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ',
    'verify-button': 'ಪರಿಶೀಲಿಸು',
    'save-button': 'Save'
};
cardLocales['mk-mk'] = {
    'text-title': 'Внесете информации за картичка',
    'card-number': 'Број на картичка',
    'card-expiration': 'ММ/ГГ',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Роденден',
    'postal-code': 'Поштенски број',
    'holder-address': 'Адреса на улица',
    'phone-number': 'Телефонски број',
    'text-agreement': 'Ако продолжите, се согласувате со <annotation id="tos">Условите на користење</annotation>, <annotation id="google_privacy">Политиката на приватност</annotation> на Google и со <annotation id="play_tos">Условите на користење Google Play</annotation>.',
    'card-vbv': 'Внесете ја вашата лозинка',
    'verify-button': 'Потврди',
    'save-button': 'Save'
};
cardLocales['uz-uz'] = {
    'text-title': 'Karta ma\'lumotlarini kiriting',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Tug‘ilgan kun',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'Davom ettirish orqali siz Google <annotation id="tos">Foydalanish shartlari</annotation>, <annotation id="google_privacy">Maxfiylik siyosati</annotation> va <annotation id="play_tos">Google Play Foydalanish shartlariga</annotation> rozi ekanligingizni bildirasiz.',
    'card-vbv': 'Parolni kiriting',
    'verify-button': 'Tasdiqlash',
    'save-button': 'Save'
};
cardLocales['ms-my'] = {
    'text-title': 'Masukkan maklumat kad',
    'card-number': 'Nombor kad',
    'card-expiration': 'BB/TT',
    'card-cvc': 'CVC',
    'card-holder': 'Nama pemegang kad',
    'date-birth': 'Tarikh lahir',
    'postal-code': 'Poskod',
    'holder-address': 'Alamat jalan',
    'phone-number': 'Nombor telefon',
    'text-agreement': 'Dengan meneruskan, anda bersetuju menerima <annotation id="tos">Syarat Perkhidmatan</annotation>, <annotation id="google_privacy">Dasar Privasi</annotation> Google dan <annotation id="play_tos">Syarat Perkhidmatan Google Play</annotation>.',
    'card-vbv': 'Masukkan kata laluan anda',
    'verify-button': 'Sahkan',
    'save-button': 'Simpan'
};
cardLocales['af'] = {
    'text-title': 'Gee kaart inligting',
    'card-number': 'Kaartnommer',
    'card-expiration': 'MM/JJ',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Verjaardag',
    'postal-code': 'Poskode',
    'holder-address': 'Straatadres',
    'phone-number': 'Foonnommer',
    'text-agreement': 'Deur voort te gaan, stem jy in tot Google se <annotation id="tos">diensbepalings</annotation> en <annotation id="google_privacy">privaatheidbeleid</annotation>, en <annotation id="play_tos">Google Play se diensbepalings</annotation>.',
    'card-vbv': 'Voer jou wagwoord in',
    'verify-button': 'Verifieer',
    'save-button': 'Save'
};
cardLocales['fr-ca'] = {
    'text-title': 'Entrez les informations de la carte',
    'card-number': 'Numéro de carte',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nom du titulaire de la carte',
    'date-birth': 'Anniversaire',
    'postal-code': 'Code ZIP',
    'holder-address': 'Adresse municipale',
    'phone-number': 'Numéro de téléphone',
    'text-agreement': 'En continuant, vous acceptez les <annotation id="tos">"Conditions d\'utilisation"</annotation> et les <annotation id="google_privacy">Règles de confidentialité</annotation> de Google, ainsi que les <annotation id="play_tos">"Conditions d\'utilisation de Google Play"</annotation>.',
    'card-vbv': 'Saisissez votre mot de passe',
    'verify-button': 'Valider',
    'save-button': 'Enregistrer'
};
cardLocales['in'] = {
    'text-title': 'Masukkan informasi kartu',
    'card-number': 'Nomor kartu',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Nama pemegang kartu',
    'date-birth': 'Ulang Tahun',
    'postal-code': 'Kode pos',
    'holder-address': 'Alamat lengkap',
    'phone-number': 'Nomor telepon',
    'text-agreement': 'Dengan melanjutkan, Anda menyetujui <annotation id="tos">Persyaratan Layanan</annotation>, <annotation id="google_privacy">Kebijakan Privasi</annotation> Google, serta <annotation id="play_tos">Persyaratan Layanan Google Play</annotation>.',
    'card-vbv': 'Masukkan sandi',
    'verify-button': 'Verifikasi',
    'save-button': 'Simpan'
};
cardLocales['sq-al'] = {
    'text-title': 'Hyrë në informacion kartën',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Ditëlindja',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'Duke vazhduar, ti pranon <annotation id="tos">\"Kushtet e shërbimit\"</annotation>, <annotation id="google_privacy">\"Politikën e privatësisë\"</annotation> së Google dhe <annotation id="play_tos">\"Kushtet e shërbimit\" të \"Luaj me Google\"</annotation>.',
    'card-vbv': 'Fut fjalëkalimin tënd',
    'verify-button': 'Verifiko',
    'save-button': 'Save'
};
cardLocales['et-ee'] = {
    'text-title': 'Sisesta krediitkaardi andmeid',
    'card-number': 'Kaardi number',
    'card-expiration': 'KK/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Sünnipäev',
    'postal-code': 'Sihtnumber',
    'holder-address': 'Tänav',
    'phone-number': 'Telefoninumber',
    'text-agreement': '"Jätkates nõustute Google\'i "<annotation id="tos">teenusetingimuste</annotation>, <annotation id="google_privacy">privaatsuseeskirjade</annotation> ja <annotation id="play_tos">Google Play teenusetingimustega</annotation>.',
    'card-vbv': 'Parooli sisestamine',
    'verify-button': 'Kinnita',
    'save-button': 'Save'
};
cardLocales['el'] = {
    'text-title': 'Εισάγετε τα στοιχεία της κάρτας',
    'card-number': 'Αριθμός κάρτας',
    'card-expiration': 'ΜΜ/ΕΕ',
    'card-cvc': 'CVC',
    'card-holder': 'Όνομα κατόχου κάρτας',
    'date-birth': 'Γενέθλια',
    'postal-code': 'Ταχυδρομικός κώδικας',
    'holder-address': 'Διεύθυνση',
    'phone-number': 'Τηλέφωνο',
    'text-agreement': 'Εάν συνεχίσετε, αποδέχεστε <annotation id="tos">τους Όρους Παροχής Υπηρεσιών</annotation> και <annotation id="google_privacy">την Πολιτική Απορρήτου</annotation> της Google, καθώς και τους <annotation id="play_tos">Όρους Παροχής Υπηρεσιών του Google Play</annotation>.',
    'card-vbv': 'Εισάγετε τον κωδικό πρόσβασής σας',
    'verify-button': 'Επαλήθευση',
    'save-button': 'Αποθήκευση'
};
cardLocales['zh-hk'] = {
    'text-title': '輸入您要在「Google 電子錢包」中使用的信用卡詳細資料',
    'card-number': '信用卡號碼',
    'card-expiration': '月份/年份',
    'card-cvc': '驗證碼',
    'card-holder': '持卡人姓名',
    'date-birth': '生日',
    'postal-code': '郵遞區號',
    'holder-address': '街道地址',
    'phone-number': '電話號碼',
    'text-agreement': '繼續即表示您同意《<annotation id="tos">Google 服務條款</annotation>》、《<annotation id="google_privacy">Google 私隱權政策</annotation>》及《<annotation id="play_tos">Google Play 服務條款</annotation>》。',
    'card-vbv': '輸入您的密碼',
    'verify-button': '驗證',
    'save-button': '儲存'
};
cardLocales['zh-tw'] = {
    'text-title': '輸入您想要在「Google 電子錢包」中使用的信用卡詳細資料',
    'card-number': '信用卡號碼',
    'card-expiration': 'MM/YY',
    'card-cvc': '安全碼',
    'card-holder': '持卡人姓名',
    'date-birth': '生日',
    'postal-code': '郵遞區號',
    'holder-address': '街道地址',
    'phone-number': '電話號碼',
    'text-agreement': '繼續操作即表示您同意《<annotation id="tos">Google 服務條款</annotation>》、《<annotation id="google_privacy">Google 隱私權政策</annotation>》和《<annotation id="play_tos">Google Play 服務條款</annotation>》。',
    'card-vbv': '輸入您的密碼',
    'verify-button': '驗證',
    'save-button': '儲存'
};
cardLocales['it'] = {
    'text-title': 'Inserisci le informazioni della carta',
    'card-number': 'Numero carta',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nome titolare carta',
    'date-birth': 'Compleanno',
    'postal-code': 'Codice postale',
    'holder-address': 'Via',
    'phone-number': 'Numero telefono',
    'text-agreement': 'Se continui accetti i <annotation id="tos">Termini di servizio</annotation> e le <annotation id="google_privacy">Norme sulla privacy</annotation> di Google, nonché i <annotation id="play_tos">Termini di servizio di Google Play</annotation>.',
    'card-vbv': 'Inserisci la password',
    'verify-button': 'Verifica',
    'save-button': 'Salva'
};
cardLocales['am'] = {
    'text-title': 'በGoogle Wallet መጠቀም ስለምትፈልገው የዱቤ ካርድህ ዝርዝሮች አስገባ።',
    'card-number': 'የካርድ ቁጥር',
    'card-expiration': 'ወወ/ዓዓ',
    'card-cvc': 'CVC',
    'card-holder': 'የካርድ ያዢው ስም',
    'date-birth': 'የልደት ቀን',
    'postal-code': 'ዚፕ ኮድ',
    'holder-address': 'የጎዳና አድራሻ፦',
    'phone-number': 'የስልክ ቁጥር',
    'text-agreement': 'በመቀጠልዎ በGoogle <annotation id="tos">አገልግሎት ውል</annotation>፣ <annotation id="google_privacy">የግላዊነት መመሪያ</annotation> እና በ<annotation id="play_tos">Google Play የአገልግሎት ውል</annotation> እየተስማሙ ነው።',
    'card-vbv': '" ይለፍ ቃልዎን ያስገቡ"',
    'verify-button': 'አረጋግጥ',
    'save-button': 'አስቀመጥ'
};
cardLocales['te-in'] = {
    'text-title': 'కార్డ్ సమాచారాన్ని నమోదు',
    'card-number': 'కార్డ్ సంఖ్య',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'పుట్టినరోజు',
    'postal-code': 'జిప్ కోడ్',
    'holder-address': 'వీధి చిరునామా',
    'phone-number': 'ఫోన్ నంబర్',
    'text-agreement': 'మీరు కొనసాగడం ద్వారా Google <annotation id="tos">సేవా నిబంధనలు</annotation>, <annotation id="google_privacy">గోప్యతా విధానం</annotation> మరియు <annotation id="play_tos">Google Play సేవా నిబంధనల</annotation>కు అంగీకరిస్తున్నారు.',
    'card-vbv': 'మీ పాస్‌వర్డ్‌ను నమోదు చేయండి',
    'verify-button': 'ధృవీకరించు',
    'save-button': 'Save'
};
cardLocales['es'] = {
    'text-title': 'Ingrese la información de la tarjeta',
    'card-number': 'Número de tarjeta',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Titular de la tarjeta',
    'date-birth': 'Cumpleaños',
    'postal-code': 'Código postal',
    'holder-address': 'Dirección postal',
    'phone-number': 'Teléfono',
    'text-agreement': 'Al continuar, aceptas las <annotation id="tos">Condiciones de servicio</annotation> y la <annotation id="google_privacy">Política de privacidad</annotation> de Google y las <annotation id="play_tos">Condiciones de servicio</annotation> de Google Play.',
    'card-vbv': 'Introduce tu contraseña',
    'verify-button': 'Verificar',
    'save-button': 'Guardar'
};
cardLocales['iw'] = {
    'text-title': 'הזן את פרטי כרטיס',
    'card-number': 'מספר כרטיס',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'שם בעל הכרטיס',
    'date-birth': 'יום הולדת',
    'postal-code': 'מיקוד',
    'holder-address': 'כתובת',
    'phone-number': 'מספר טלפון',
    'text-agreement': '‏בכך שתמשיך, אתה מביע את הסכמתך ל<annotation id="tos">תנאים וההגבלות</annotation> ול<annotation id="google_privacy">מדיניות הפרטיות</annotation> של Google ול<annotation id="play_tos">תנאים וההגבלות של Google Play‏</annotation>.',
    'card-vbv': 'הזן סיסמה',
    'verify-button': 'אמת',
    'save-button': 'שמור'
};
cardLocales['pa-in'] = {
    'text-title': 'ਕਾਰਡ ਦੀ ਜਾਣਕਾਰੀ ਦਰਜ ਕਰੋ',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'ਜਨਮਦਿਨ',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'ਜਾਰੀ ਰੱਖ ਕੇ, ਤੁਸੀਂGoogle <annotation id="tos">ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ</annotation>, <annotation id="google_privacy">ਪ੍ਰਾਈਵੇਸੀ ਨੀਤੀ</annotation> ਅਤੇ<annotation id="play_tos">Google Play ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ</annotation> ਦੀ ਸਹਿਮਤੀ ਦੇ ਰਹੇ ਹੋ।',
    'card-vbv': 'ਆਪਣਾ ਪਾਸਵਰਡ ਦਰਜ ਕਰੋ',
    'verify-button': 'ਪ੍ਰਮਾਣਿਤ ਕਰੋ',
    'save-button': 'Save'
};
cardLocales['ar'] = {
    'text-title': 'إدخال معلومات بطاقة',
    'card-number': 'رقم البطاقة',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'اسم حامل البطاقة',
    'date-birth': 'تاريخ الميلاد',
    'postal-code': 'الرمز البريدي',
    'holder-address': 'عنوان الشارع',
    'phone-number': 'رقم الهاتف',
    'text-agreement': '‏من خلال المتابعة، فإنك توافق على <annotation id="tos">بنود الخدمة</annotation> و<annotation id="google_privacy">سياسة الخصوصية</annotation> في Google و<annotation id="play_tos">بنود الخدمة في Google Play‏</annotation>.',
    'card-vbv': 'أدخل كلمة المرور',
    'verify-button': 'تحقق',
    'save-button': 'حفظ'
};
cardLocales['mr-in'] = {
    'text-title': 'कार्ड माहिती प्रविष्ट',
    'card-number': 'कार्ड क्रमांक',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'जन्मदिवस',
    'postal-code': 'पिनकोड',
    'holder-address': 'मार्ग पत्ता',
    'phone-number': 'फोन नंबर',
    'text-agreement': 'सुरु ठेवून, आपण Google <annotation id="tos">सेवा अटी</annotation>, <annotation id="google_privacy">गोपनीयता धोरण</annotation>, आणि <annotation id="play_tos">Google Play सेवा अटी</annotation> यांना सहमती देत आहात.',
    'card-vbv': 'आपला संकेतशब्द प्रविष्ट करा',
    'verify-button': 'सत्यापित करा',
    'save-button': 'Save'
};
cardLocales['vi'] = {
    'text-title': 'Nhập thông tin thẻ',
    'card-number': 'Số thẻ',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Tên chủ thẻ',
    'date-birth': 'Ngày sinh',
    'postal-code': 'Mã Zip',
    'holder-address': 'Địa chỉ đường phố',
    'phone-number': 'Số điện thoại',
    'text-agreement': 'Bằng cách tiếp tục, bạn đồng ý với <annotation id="tos">Điều khoản dịch vụ</annotation>, <annotation id="google_privacy">Chính sách bảo mật</annotation> của Google và <annotation id="play_tos">Điều khoản dịch vụ của Google Play</annotation>.',
    'card-vbv': 'Nhập mật khẩu của bạn',
    'verify-button': 'Xác minh',
    'save-button': 'Lưu'
};
cardLocales['nb'] = {
    'text-title': 'Skriv inn kortinformasjon',
    'card-number': 'Kortnummer',
    'card-expiration': 'MM/ÅÅ',
    'card-cvc': 'CVC',
    'card-holder': 'Navn på kortinnehaver',
    'date-birth': 'Bursdag',
    'postal-code': 'Postnummer',
    'holder-address': 'Gateadresse',
    'phone-number': 'Telefonnummer',
    'text-agreement': 'Ved å fortsette godtar du Googles <annotation id="tos">vilkår</annotation> og <annotation id="google_privacy">personvernregler</annotation> samt <annotation id="play_tos"> vilkårene for Google Play</annotation>.',
    'card-vbv': 'Skriv inn passordet',
    'verify-button': 'Bekreft',
    'save-button': 'Lagre'
};
cardLocales['es-us'] = {
    'text-title': 'Ingrese la información de la tarjeta',
    'card-number': 'Número de tarjeta',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nombre del titular de la tarjeta',
    'date-birth': 'Fecha de nacimiento',
    'postal-code': 'Código postal',
    'holder-address': 'Dirección postal',
    'phone-number': 'Teléfono',
    'text-agreement': 'Si continúas, significa que aceptas las <annotation id="tos">Condiciones del servicio</annotation> y la <annotation id="google_privacy">Política de privacidad</annotation> de Google, así como las <annotation id="play_tos">Condiciones del servicio de Google Play</annotation>.',
    'card-vbv': 'Ingresa tu contraseña.',
    'verify-button': 'Verificar',
    'save-button': 'Guardar'
};
cardLocales['ja'] = {
    'text-title': 'カード情報を入力します',
    'card-number': 'カード番号',
    'card-expiration': '月/年',
    'card-cvc': 'CVC',
    'card-holder': 'カード名義人',
    'date-birth': '誕生日',
    'postal-code': '郵便番号',
    'holder-address': '住所',
    'phone-number': '電話番号',
    'text-agreement': '続行すると、Googleの<annotation id="tos">利用規約</annotation>、<annotation id="google_privacy">プライバシーポリシー</annotation>、<annotation id="play_tos">Google Playの利用規約</annotation>に同意したことになります。',
    'card-vbv': 'パスワードの入力',
    'verify-button': '確認',
    'save-button': '保存'
};
cardLocales['ky-kg'] = {
    'text-title': 'Жазыңыз жөнүндө маалымат картасы',
    'card-number': 'Карта номери',
    'card-expiration': 'АА/ЖЖ',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Туулган күн',
    'postal-code': 'ZIP код',
    'holder-address': 'Көчөнүн дареги',
    'phone-number': 'Телефон номери',
    'text-agreement': 'Улантуу менен, Google <annotation id="tos">Тейлөө шарттарын</annotation>, <annotation id="google_privacy">Купуялуулук саясатын</annotation> жана <annotation id="play_tos">Google Play Тейлөө шарттарын</annotation> кабыл аласыз.',
    'card-vbv': 'Сырсөзүңүздү киргизиңиз',
    'verify-button': 'Ырастоо',
    'save-button': 'Save'
};
cardLocales['pt-pt'] = {
    'text-title': 'Introduza as informações do cartão de crédito',
    'card-number': 'Número do cartão',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nome do titular do cartão',
    'date-birth': 'Aniversário',
    'postal-code': 'Código postal',
    'holder-address': 'Morada',
    'phone-number': 'N.º de telefone',
    'text-agreement': 'Ao continuar, concorda com os <annotation id="tos">Termos de Utilização</annotation> e com a <annotation id="google_privacy">Política de Privacidade</annotation> da Google, bem como com os <annotation id="play_tos">Termos de Utilização do Google Play</annotation>.',
    'card-vbv': 'Introduzir palavra-passe',
    'verify-button': 'Confirmar',
    'save-button': 'Guardar'
};
cardLocales['fa'] = {
    'text-title': 'اطلاعات کارت را وارد کنید',
    'card-number': 'شماره کارت',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'نام صاحب کارت',
    'date-birth': 'تاریخ تولد',
    'postal-code': 'کد پستی',
    'holder-address': 'آدرس خیابان',
    'phone-number': 'شماره تلفن',
    'text-agreement': '‏با ادامه، شما با <annotation id="tos">شرایط خدمات</annotation>، <annotation id="google_privacy">خط‌مشی رازداری</annotation> و <annotation id="play_tos">شرایط خدمات Google Play</annotation> موافقت می‌کنید.',
    'card-vbv': 'گذرواژه خود را وارد کنید',
    'verify-button': 'تأیید',
    'save-button': 'ذخیره'
};
cardLocales['zu'] = {
    'text-title': 'Faka imininingwane yekhadi',
    'card-number': 'Inombolo yekhadi',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Usuku lokuzalwa',
    'postal-code': 'Ikhodi ye-ZIP',
    'holder-address': 'Ikheli lomgwaqo',
    'phone-number': 'Inombolo yefoni',
    'text-agreement': 'Ngokuqhubeka, uyavumelana <annotation id="tos">nemigomo yesevisi</annotation>. <annotation id="google_privacy">Inqubomgomo yemfihlo</annotation>, <annotation id="play_tos">nemigomo yesevisi ye-Google Play</annotation>.',
    'card-vbv': 'Faka iphasiwedi yakho',
    'verify-button': 'Qinisekisa',
    'save-button': 'Save'
};
cardLocales['ro'] = {
    'text-title': 'Introduceţi detaliile cardului de credit',
    'card-number': 'Numărul cardului de credit',
    'card-expiration': 'LL/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Numele titularului de card',
    'date-birth': 'Ziua de naștere',
    'postal-code': 'Cod poștal',
    'holder-address': 'Adresă poștală',
    'phone-number': 'Nr. de telefon',
    'text-agreement': 'Continuând, sunteți de acord cu <annotation id="tos">Termenii și condițiile</annotation> și <annotation id="google_privacy">Politica de confidențialitate</annotation> Google și cu <annotation id="play_tos">Termenii și condițiile Google Play</annotation>.',
    'card-vbv': 'Introduceţi parola',
    'verify-button': 'Confirmați',
    'save-button': 'Salvați'
};
cardLocales['nl'] = {
    'text-title': 'Voer kaartinformatie',
    'card-number': 'Kaartnummer',
    'card-expiration': 'MM-JJ',
    'card-cvc': 'CVC',
    'card-holder': 'Naam kaarthouder',
    'date-birth': 'Verjaardag',
    'postal-code': 'Postcode',
    'holder-address': 'Adres',
    'phone-number': 'Telefoonnummer',
    'text-agreement': 'Als je doorgaat, geef je daarmee aan akkoord te gaan met de <annotation id="tos">Servicevoorwaarden</annotation> en het <annotation id="google_privacy">Privacybeleid</annotation> van Google en de <annotation id="play_tos">Servicevoorwaarden van Google Play</annotation>.',
    'card-vbv': 'Je wachtwoord opgeven',
    'verify-button': 'Verifiëren',
    'save-button': 'Opslaan'
};
cardLocales['ur-pk'] = {
    'text-title': 'کارڈ کی معلومات درج کریں',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'یوم پیدائش',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': '‏جاری رکھ کر، آپ Google کی <annotation id="tos">سروس کی شرائط</annotation>، <annotation id="google_privacy">رازداری کی پالیسی</annotation> اور <annotation id="play_tos">Google Play کی سروس کی شرائط</annotation> سے اتفاق کر رہے ہیں۔',
    'card-vbv': 'اپنا پاس ورڈ درج کریں',
    'verify-button': 'توثیق کریں',
    'save-button': 'Save'
};
cardLocales['zh-cn'] = {
    'text-title': '请输入您要在 Google 电子钱包中使用的信用卡的相关详情',
    'card-number': '信用卡号',
    'card-expiration': 'MM/YY',
    'card-cvc': '验证码',
    'card-holder': '持卡人姓名',
    'date-birth': '生日',
    'postal-code': '邮政编码',
    'holder-address': '街道地址',
    'phone-number': '电话号码',
    'text-agreement': '继续操作即表示您同意遵守 Google <annotation id="tos">服务条款</annotation>、<annotation id="google_privacy">隐私权政策</annotation>和 <annotation id="play_tos">Google Play 服务条款</annotation>。',
    'card-vbv': '请输入您的密码',
    'verify-button': '验证',
    'save-button': '保存'
};
cardLocales['fi'] = {
    'text-title': 'Anna kortin tiedot',
    'card-number': 'Kortin numero',
    'card-expiration': 'KK/VV',
    'card-cvc': 'CVC',
    'card-holder': 'Kortinhaltijan nimi',
    'date-birth': 'Syntymäpäivä',
    'postal-code': 'Postinumero',
    'holder-address': 'Katuosoite',
    'phone-number': 'Puhelinnumero',
    'text-agreement': 'Jatkamalla käyttöä hyväksyt Googlen <annotation id="tos">käyttöehdot</annotation>, <annotation id="google_privacy">tietosuojakäytännön</annotation> ja <annotation id="play_tos">Google Playn käyttöehdot</annotation>.',
    'card-vbv': 'Anna salasana',
    'verify-button': 'Vahvista',
    'save-button': 'Tallenna'
};
cardLocales['mn-mn'] = {
    'text-title': 'Карт мэдээлэл оруулна уу',
    'card-number': 'Картын дугаар',
    'card-expiration': 'САР/ЖИЛ',
    'card-cvc': 'КБК',
    'card-holder': 'Cardholder name',
    'date-birth': 'Төрсөн өдөр',
    'postal-code': 'ЗИП код',
    'holder-address': 'Гудамжны хаяг',
    'phone-number': 'Утасны дугаар',
    'text-agreement': 'Үргэлжлүүлснээр та Google <annotation id="tos">Үйлчилгээний Нөхцөл</annotation>, <annotation id="google_privacy">Нууцлалын Бодлого</annotation>, болон <annotation id="play_tos">Google Play Үйлчилгээний Нөхцөл</annotation>-г зөвшөөрч байна.',
    'card-vbv': 'Нууц үгээ оруулна уу',
    'verify-button': 'Тулгах',
    'save-button': 'Save'
};
cardLocales['ru'] = {
    'text-title': 'Введите информацию о карте',
    'card-number': 'Номер карты',
    'card-expiration': 'ММ/ГГ',
    'card-cvc': 'CVC',
    'card-holder': 'Владелец карты',
    'date-birth': 'День рождения',
    'postal-code': 'Почтовый индекс',
    'holder-address': 'Адрес',
    'phone-number': 'Номер телефона',
    'text-agreement': 'Выполняя следующий шаг, вы соглашаетесь с <annotation id="tos">Условиями использования Google</annotation>, <annotation id="google_privacy">Политикой конфиденциальности</annotation> и <annotation id="play_tos">Условиями использования Google Play</annotation>.',
    'card-vbv': 'Введите пароль',
    'verify-button': 'Подтвердить',
    'save-button': 'Сохранить'
};
cardLocales['az-az'] = {
    'text-title': 'Kartı məlumat daxil edin',
    'card-number': 'Kart nömrəsi',
    'card-expiration': 'AA/İİ',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Doğum günü',
    'postal-code': 'Poçt indeksi',
    'holder-address': 'Küçə ünvanı',
    'phone-number': 'Telefon nömrəsi',
    'text-agreement': 'Davam etməklə, Siz Google <annotation id="tos">Xidmət Şərtlərinə</annotation>, <annotation id="google_privacy">Məxfilik Siyasətinə</annotation> və <annotation id="play_tos">Google Play Xidmət Şərtlərinə</annotation> razılaşırsınız.',
    'card-vbv': 'Parolunuzu daxil edin',
    'verify-button': 'Təsdiqlə',
    'save-button': 'Save'
};
cardLocales['ne-np'] = {
    'text-title': 'कार्ड प्रविष्ट',
    'card-number': 'कार्ड नम्बर',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'जन्मदिन',
    'postal-code': 'जिप कोड',
    'holder-address': 'सडक ठेगाना',
    'phone-number': 'फोन नम्बर',
    'text-agreement': 'हस्ताक्षर गरेर तपाईँ Google को <annotation id="tos"> सेवा सर्तहरू</annotation>, <annotation id="google_privacy">प्राइभेसी नीति</annotation>, र <annotation id="play_tos">Google Play सेवा सर्तहरू</annotation> सँग सहमत हुनुहन्छ।',
    'card-vbv': 'तपाईँको पासवर्ड प्रविष्टि गर्नुहोस्।',
    'verify-button': 'प्रमाणीकरण गर्नुहोस्',
    'save-button': 'Save'
};
cardLocales['bg'] = {
    'text-title': 'Въведете информация за картата',
    'card-number': 'Номер на картата',
    'card-expiration': 'ММ/ГГ',
    'card-cvc': 'CVC',
    'card-holder': 'Име на картодържателя',
    'date-birth': 'Рожден ден',
    'postal-code': 'Пощенски код',
    'holder-address': 'Пощенски адрес',
    'phone-number': 'Телефонен номер',
    'text-agreement': 'С продължаването си приемате <annotation id="tos">Общите условия</annotation> и <annotation id="google_privacy">Декларацията за поверителност</annotation> на Google и <annotation id="play_tos">Общите условия на Google Play</annotation>.',
    'card-vbv': 'Въведете паролата си',
    'verify-button': 'Потвърждаване',
    'save-button': 'Запазване'
};
cardLocales['km-kh'] = {
    'text-title': 'បញ្ចូល​ព័ត៌មាន​លម្អិត​អំពី​កាត​ឥណទាន​ដែល​អ្នក​ចង់​ប្រើ​ជា​មួយ​កាបូប Google ។',
    'card-number': 'លេខ​កាត',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'ថ្ងៃកំណើត',
    'postal-code': 'កូដ​តំបន់',
    'holder-address': 'អាសយដ្ឋាន​ផ្លូវ',
    'phone-number': 'លេខ​ទូរសព្ទ',
    'text-agreement': 'ដើម្បី​បន្ត អ្នក​ត្រូវតែ​យល់ព្រម​ជាមួយ​លក្ខខណ្ឌ​ប្រើប្រាស់ <annotation id="tos"> របស់ Google </annotation> , <annotation id="google_privacy"> គោលការណ៍​ភាព​ឯកជន </annotation> និង​លក្ខខណ្ឌ​ប្រើប្រាស់ <annotation id="play_tos"> របស់​ឃ្លាំង​កម្មវិធី </annotation> ។',
    'card-vbv': 'បញ្ចូល​ពាក្យ​សម្ងាត់​របស់​អ្នក',
    'verify-button': 'ផ្ទៀងផ្ទាត់',
    'save-button': 'Save'
};
cardLocales['fr'] = {
    'text-title': 'Entrez les informations de la carte',
    'card-number': 'Numéro de carte',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nom du titulaire de la carte',
    'date-birth': 'Anniversaire',
    'postal-code': 'Code postal',
    'holder-address': 'Adresse postale',
    'phone-number': 'N° de téléphone',
    'text-agreement': 'En continuant, vous acceptez les <annotation id="tos">"Conditions d\'utilisation"</annotation> et les <annotation id="google_privacy">Règles de confidentialité</annotation> de Google, ainsi que les <annotation id="play_tos">"Conditions d\'utilisation de Google Play"</annotation>.',
    'card-vbv': 'Saisissez votre mot de passe',
    'verify-button': 'Valider',
    'save-button': 'Enregistrer'
};
cardLocales['my-mm'] = {
    'text-title': 'ကတ်ကိုအချက်အလက်တွေကိုရေးထည့်ပါ',
    'card-number': 'ကတ်နံပါတ်',
    'card-expiration': 'လလ/နှစ်နှစ်',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'မွေးနေ့',
    'postal-code': 'စာပို့ကုဒ်',
    'holder-address': 'လမ်းလိပ်စာ',
    'phone-number': 'ဖုန်းနံပါတ်',
    'text-agreement': 'ဆက် လုပ်ကိုင်ခြင်းဖြင့်၊ သင်သည် Google ၏<annotation id="tos">ဝန်ဆောင်မှု စည်းကမ်းချက်များ</annotation>၊ <annotation id="google_privacy">ကိုယ်ရေး မူဝါဒ</annotation>၊ နှင့် <annotation id="play_tos">Google ပလေး ဝန်ဆောင်မှု စည်းကမ်းချက်များ</annotation>ကို သဘော တူပါသည်။',
    'card-vbv': 'သင့်စကားဝှက်အား ရိုက်ထည့်ပါ။',
    'verify-button': 'အတည်ပြုစစ်ရန်',
    'save-button': 'Save'
};
cardLocales['en-gb'] = {
    'text-title': 'Enter card details',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Date of birth',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'By continuing, you are agreeing to the Google <annotation id="tos">Terms of Service</annotation>, <annotation id="google_privacy">Privacy Policy</annotation> and <annotation id="play_tos">Google Play Terms of Service</annotation>.',
    'card-vbv': 'Enter your password',
    'verify-button': 'Verify',
    'save-button': 'Save'
};
cardLocales['hy-am'] = {
    'text-title': 'Մուտքագրեք քարտի տվյալները',
    'card-number': 'Քարտի համարը',
    'card-expiration': 'ԱԱ/ՏՏ',
    'card-cvc': 'CVC կոդը',
    'card-holder': 'Cardholder name',
    'date-birth': 'Ծննդյան օր',
    'postal-code': 'Փոստային կոդ',
    'holder-address': 'Փողոց',
    'phone-number': 'Հեռախոսահամար',
    'text-agreement': 'Մուտք գործելով՝ դուք համաձայնվում եք Google-ի <annotation id="tos">Ծառայությունների մատուցման պայմաններին</annotation>, <annotation id="google_privacy">Գաղտնիության քաղաքականությանը</annotation> և <annotation id="play_tos">Google Play-ի Ծառայությունների մատուցման պայմաններին</annotation>:',
    'card-vbv': 'Մուտքագրեք ձեր գաղտնաբառը',
    'verify-button': 'Հաստատել',
    'save-button': 'Save'
};
cardLocales['sk'] = {
    'text-title': 'Zadajte podrobnosti o platobnej karte',
    'card-number': 'Číslo karty',
    'card-expiration': 'MM/RR',
    'card-cvc': 'CVC',
    'card-holder': 'Meno majiteľa karty',
    'date-birth': 'Narodeniny',
    'postal-code': 'PSČ',
    'holder-address': 'Adresa',
    'phone-number': 'Telefónne číslo',
    'text-agreement': 'Pokračovaním vyjadrujete súhlas so <annotation id="tos">Zmluvnými podmienkami</annotation> a <annotation id="google_privacy">Pravidlami ochrany osobných údajov</annotation> spoločnosti Google aj <annotation id="play_tos">Zmluvnými podmienkami služby Google Play</annotation>.',
    'card-vbv': 'Zadajte svoje heslo',
    'verify-button': 'Overiť',
    'save-button': 'Uložiť'
};
cardLocales['sl'] = {
    'text-title': 'Vnesite podrobnosti kreditne kartice',
    'card-number': 'Številka kartice',
    'card-expiration': 'MM/LL',
    'card-cvc': 'CVC',
    'card-holder': 'Ime imetnika kartice',
    'date-birth': 'Rojstni dan',
    'postal-code': 'Poštna številka',
    'holder-address': 'Ulica in hišna št.',
    'phone-number': 'Telefonska št.',
    'text-agreement': 'Če nadaljujete, se strinjate z Googlovimi <annotation id="tos">pogoji storitve</annotation>, <annotation id="google_privacy">pravilnikom o zasebnosti</annotation> in <annotation id="play_tos">pogoji storitve Google Play</annotation>.',
    'card-vbv': 'Vnesite geslo',
    'verify-button': 'Preveri',
    'save-button': 'Shrani'
};
cardLocales['ka-ge'] = {
    'text-title': 'შეიყვანეთ ბარათის ინფორმაცია',
    'card-number': 'ბარათის ნომერი',
    'card-expiration': 'თთ/წწ',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'დაბადების დღე',
    'postal-code': 'ZIP კოდი',
    'holder-address': 'ქუჩის მისამართი',
    'phone-number': 'ტელეფონ.ნომერი',
    'text-agreement': 'შესვლით ეთანხმებით Google-ის <annotation id="tos">მომსახურების პირობებს</annotation>, <annotation id="google_privacy">კონფიდენციალურობის დებულებას</annotation> და <annotation id="play_tos">Google Play-ს მომსახურების პირობებსce</annotation>.',
    'card-vbv': 'შეიყვანეთ თქვენი პაროლი',
    'verify-button': 'დამოწმება',
    'save-button': 'Save'
};
cardLocales['ca'] = {
    'text-title': 'Introduïu la informació de la targeta',
    'card-number': 'Número de targeta',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nom del titular de la targeta',
    'date-birth': 'Natalici',
    'postal-code': 'Codi postal',
    'holder-address': 'Adreça postal',
    'phone-number': 'Núm. de telèfon',
    'text-agreement': 'En continuar, acceptes les <annotation id="tos">Termes i condicions</annotation> i la <annotation id="google_privacy">Política de privadesa</annotation> de Google, així com les <annotation id="play_tos">Termes i condicions de Google Play</annotation>.',
    'card-vbv': 'Introducció de la contrasenya',
    'verify-button': 'Verifica',
    'save-button': 'Desa'
};
cardLocales['sr'] = {
    'text-title': 'Унесите детаље о кредитној картици',
    'card-number': 'Број картице',
    'card-expiration': 'ММ/ГГ',
    'card-cvc': 'CVC',
    'card-holder': 'Име власника картице',
    'date-birth': 'Рођендан',
    'postal-code': 'Поштански број',
    'holder-address': 'Адреса',
    'phone-number': 'Број телефона',
    'text-agreement': 'Ако наставите, прихватате Google <annotation id="tos">услове коришћења услуге</annotation>, <annotation id="google_privacy">политику приватности</annotation> и <annotation id="play_tos">Услове коришћења услуге Google Play</annotation>.',
    'card-vbv': 'Унесите лозинку',
    'verify-button': 'Верификуј',
    'save-button': 'Сачувај'
};
cardLocales['lo-la'] = {
    'text-title': 'ກະລຸນາໃສ່ຂໍ້ມູນບັດ',
    'card-number': 'ເລກບັດ',
    'card-expiration': 'ດດ/ປປ',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'ວັນເດືອນປີເກີດ',
    'postal-code': 'ລະຫັດ ZIP',
    'holder-address': 'ທີ່ຢູ່ຖະໜົນ',
    'phone-number': 'ເບີ​ໂທລະ​ສັບ',
    'text-agreement': 'ໃນການດຳເນີນການຕໍ່ໄປ ແມ່ນຖືວ່າທ່ານຍອມຮັບກັບ <annotation id="tos">ເງື່ອນໄຂການໃຫ້ບໍລິການ</annotation>, <annotation id="google_privacy">ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ</annotation>ຂອງ Google ແລະ <annotation id="play_tos">ເງື່ອນໄຂການໃຫ້ບໍລິການຂອງ Google Play</annotation>.',
    'card-vbv': 'ປ້ອນລະຫັດຜ່ານຂອງທ່ານ',
    'verify-button': 'ກວດສອບ',
    'save-button': 'Save'
};
cardLocales['ml-in'] = {
    'text-title': 'കാർഡ് വിവരങ്ങൾ നൽകുക',
    'card-number': 'കാർഡ് നമ്പർ',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'ജന്മദിനം',
    'postal-code': 'തപാൽ കോഡ്',
    'holder-address': 'സ്‌ട്രീറ്റ് വിലാസം',
    'phone-number': 'ഫോൺ നമ്പർ',
    'text-agreement': 'തുടരുന്നതിലൂടെ, Google <annotation id="tos">സേവന നിബന്ധനകളും</annotation> <annotation id="google_privacy">സ്വകാര്യതാ നയവും</annotation> <annotation id="play_tos">Google Play സേവന നിബന്ധനകളും</annotation> നിങ്ങൾ അംഗീകരിക്കുന്നു.',
    'card-vbv': 'നിങ്ങളുടെ പാസ്‌വേഡ് നല്‍‌കുക',
    'verify-button': 'പരിശോധിച്ചുറപ്പിക്കുക',
    'save-button': 'Save'
};
cardLocales['si-lk'] = {
    'text-title': 'කාඩ්පත් තොරතුරු ඇතුලත් කරන්න',
    'card-number': 'කාඩ්පත් අංකය',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'උපන්දිනය',
    'postal-code': 'ZIP කේතය',
    'holder-address': 'වීථි ලිපිනය',
    'phone-number': 'දුරකථන අංකය',
    'text-agreement': 'ඉදිරියට යාමෙන්, ඔබ <annotation id="tos">Google</annotation> සහ <annotation id="google_privacy">පෞද්ගලිකත්ව ප්‍රතිපත්ති වලට</annotation>, සහ <annotation id="play_tos">Google Play සේවා නියමයන්</annotation> වලට එකඟ වේ.',
    'card-vbv': 'ඔබගේ මුරපදය ඇතුළත් කරන්න',
    'verify-button': 'සත්‍යාපනය කරන්න',
    'save-button': 'Save'
};
cardLocales['eu-es'] = {
    'text-title': 'Sartu txartelaren informazioa',
    'card-number': 'Txartel-zenbakia',
    'card-expiration': 'HH/UU',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Urtebetetzea',
    'postal-code': 'ZIP kodea',
    'holder-address': 'Kalea',
    'phone-number': 'Telefono-zenbakia',
    'text-agreement': 'Jarraituz gero, Google <annotation id="tos">Zerbitzu-baldintzak</annotation>, <annotation id="google_privacy">Pribatutasun-gidalerroak</annotation> eta <annotation id="play_tos">Google Play Zerbitzu-baldintzak</annotation> onartuko dituzu.',
    'card-vbv': 'Idatzi pasahitza',
    'verify-button': 'Egiaztatu',
    'save-button': 'Save'
};
cardLocales['sv'] = {
    'text-title': 'Ange kortuppgifter för det kort',
    'card-number': 'Kortnummer',
    'card-expiration': 'MM/ÅÅ',
    'card-cvc': 'CVC',
    'card-holder': 'Kortinnehavarens namn',
    'date-birth': 'Födelsedag',
    'postal-code': 'Postnummer',
    'holder-address': 'Gatuadress',
    'phone-number': 'Telefonnummer',
    'text-agreement': 'Genom att fortsätta godkänner du Googles <annotation id="tos">användarvillkor</annotation>, <annotation id="google_privacy">sekretesspolicy</annotation> och <annotation id="play_tos">användarvillkoren för Google Play</annotation>.',
    'card-vbv': 'Ange lösenordet',
    'verify-button': 'Verifiera',
    'save-button': 'Spara'
};
cardLocales['kk-kz'] = {
    'text-title': 'Карта туралы ақпаратты енгізіңіз',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Туған күн',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'Жалғастыру арқылы сіз Google <annotation id="tos">қызмет көрсету шарттарымен</annotation>, <annotation id="google_privacy">Құпиялық саясатымен</annotation> және <annotation id="play_tos">Google Play қызмет көрсету шарттарымен</annotation> келісесіз.',
    'card-vbv': 'Құпия сөзді енгізіңіз',
    'verify-button': 'Тексеру',
    'save-button': 'Save'
};
cardLocales['ko'] = {
    'text-title': '카드 정보를 입력',
    'card-number': '카드 번호',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': '카드 소지자 이름',
    'date-birth': '생일',
    'postal-code': '우편번호',
    'holder-address': '상세 주소',
    'phone-number': '전화번호',
    'text-agreement': '계속하면 Google <annotation id="tos">서비스 약관</annotation>, <annotation id="google_privacy">개인정보취급방침</annotation> 및 <annotation id="play_tos">Google Play 서비스 약관</annotation>에 동의하게 됩니다.',
    'card-vbv': '비밀번호 입력',
    'verify-button': '인증',
    'save-button': '저장'
};
cardLocales['sw'] = {
    'text-title': 'Ingiza maelezo kuhusu kadi',
    'card-number': 'Nambari ya kadi',
    'card-expiration': 'MZ/MK',
    'card-cvc': 'CVC',
    'card-holder': 'Jina la mwenye kadi',
    'date-birth': 'Siku ya kuzaliwa',
    'postal-code': 'Msimbo wa eneo',
    'holder-address': 'Anwani ya barabara',
    'phone-number': 'Nambari ya simu',
    'text-agreement': 'Kwa kuendelea, unakubali <annotation id="tos">Sheria na Masharti</annotation>, <annotation id="google_privacy">Sera ya Faragha</annotation> ya Google, na <annotation id="play_tos">Sheria na Masharti</annotation> ya Google Play.',
    'card-vbv': 'Weka nenosiri lako',
    'verify-button': 'Thibitisha',
    'save-button': 'Hifadhi'
};
cardLocales['ta-in'] = {
    'text-title': 'அட்டை தகவலை உள்ளிடவும்',
    'card-number': 'கார்டு எண்',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'பிறந்தநாள்',
    'postal-code': 'ஜிப் குறியீடு',
    'holder-address': 'தெரு முகவரி',
    'phone-number': 'ஃபோன் எண்',
    'text-agreement': 'தொடர்வதன் மூலம், Google <annotation id="tos">சேவை விதிமுறைகள்</annotation>, <annotation id="google_privacy">தனியுரிமைக் கொள்கை</annotation> மற்றும் <annotation id="play_tos">Google Play சேவை விதிமுறைகள்</annotation> ஆகியவற்றை ஒப்புக்கொள்கிறீர்கள்.',
    'card-vbv': 'கடவுச்சொல்லை உள்ளிடவும்',
    'verify-button': 'சரிபார்',
    'save-button': 'Save'
};
cardLocales['bn-bd'] = {
    'text-title': 'কার্ডের তথ্য লিখুন',
    'card-number': 'কার্ড নম্বর',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'জন্মদিন',
    'postal-code': 'পিন কোড',
    'holder-address': 'রাস্তার ঠিকানা',
    'phone-number': 'ফোন নম্বর',
    'text-agreement': 'চালিয়ে যাওয়ার মাধ্যমে আপনি Google <annotation id="tos">পরিষেবার শর্তাবলি</annotation>, <annotation id="google_privacy">গোপনীয়তা নীতি</annotation>, ও <annotation id="play_tos">Google Play পরিষেবার শর্তাবলি</annotation> স্বীকার করছেন।',
    'card-vbv': 'আপনার পাসওয়ার্ডটি লিখুন',
    'verify-button': 'যাচাই করুন',
    'save-button': 'Save'
};
cardLocales['is-is'] = {
    'text-title': 'Sláðu kortaupplýsingar',
    'card-number': 'Kortanúmer',
    'card-expiration': 'MM/ÁÁ',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Afmælisdagur',
    'postal-code': 'Póstnúmer (bandarískt)',
    'holder-address': 'Gata og húsnúmer',
    'phone-number': 'Símanúmer',
    'text-agreement': 'Með því að halda áfram samþykkir þú <annotation id="tos">þjónustuskilmála</annotation> og <annotation id="google_privacy">persónuverndarstefnu</annotation> Google ásamt <annotation id="play_tos">þjónustuskilmálum Google Play</annotation>.',
    'card-vbv': 'Sláðu inn aðgangsorðið þitt',
    'verify-button': 'Staðfesta',
    'save-button': 'Save'
};
cardLocales['pt-br'] = {
    'text-title': 'Inserir informações de cartão',
    'card-number': 'Número do cartão',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Nome do titular do cartão',
    'date-birth': 'Aniversário',
    'postal-code': 'CEP',
    'holder-address': 'Endereço',
    'phone-number': 'N° de telefone',
    'text-agreement': 'Ao continuar, você concorda com os <annotation id="tos">Termos de Serviço</annotation> do Google, a <annotation id="google_privacy">Política de Privacidade</annotation> e os <annotation id="play_tos">Termos de Serviço do Google Play</annotation>.',
    'card-vbv': 'Digite sua senha',
    'verify-button': 'Verificar',
    'save-button': 'Salvar'
};
cardLocales['cs'] = {
    'text-title': 'Zadejte informace o kartě',
    'card-number': 'Číslo karty',
    'card-expiration': 'MM/RR',
    'card-cvc': 'CVC',
    'card-holder': 'Jméno držitele karty',
    'date-birth': 'Narozeniny',
    'postal-code': 'PSČ',
    'holder-address': 'Ulice a číslo',
    'phone-number': 'Telefonní číslo',
    'text-agreement': 'Pokračováním vyjadřujete souhlas se <annotation id="tos">smluvními podmínkami</annotation> a <annotation id="google_privacy">zásadami ochrany soukromí</annotation> společnosti Google a se <annotation id="play_tos">smluvními podmínkami služby Google Play</annotation>.',
    'card-vbv': 'Zadejte heslo.',
    'verify-button': 'Ověřit',
    'save-button': 'Uložit'
};
cardLocales['gu-in'] = {
    'text-title': 'કાર્ડ માહિતી દાખલ કરો',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'જન્મદિવસ',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'ચાલુ રાખીને, તમે Google ની <annotation id="tos">સેવાની શરતો</annotation>, <annotation id="google_privacy">ગોપનીયતા નીતિ</annotation>, અને <annotation id="play_tos">Google Play ની સેવાની શરતો</annotation>થી સંમત થઈ રહ્યાં છો.',
    'card-vbv': 'તમારો પાસવર્ડ દાખલ કરો',
    'verify-button': 'ચકાસો',
    'save-button': 'Save'
};
cardLocales['gl-es'] = {
    'text-title': 'Inserir información de tarxeta',
    'card-number': 'Número da tarxeta',
    'card-expiration': 'MM/AA',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Aniversario',
    'postal-code': 'Código postal',
    'holder-address': 'Enderezo postal',
    'phone-number': 'N.º de teléfono',
    'text-agreement': 'Ao continuar, aceptas as <annotation id="tos">Condicións de servizo</annotation> e a <annotation id="google_privacy">Política de privacidade</annotation> de Google, así como as <annotation id="play_tos">Condicións de servizo de Google Play</annotation>.',
    'card-vbv': 'Insire o teu contrasinal',
    'verify-button': 'Verificar',
    'save-button': 'Save'
};
cardLocales['th'] = {
    'text-title': 'กรอกรายละเอียดเกี่ยวกับบัตรเครดิตที่คุณต้องการใช้กับ Google Wallet',
    'card-number': 'หมายเลขบัตร',
    'card-expiration': 'ดด/ปป',
    'card-cvc': 'CVC',
    'card-holder': 'ชื่อผู้ถือบัตร',
    'date-birth': 'วันเกิด',
    'postal-code': 'รหัสไปรษณีย์',
    'holder-address': 'ที่อยู่',
    'phone-number': 'หมายเลขโทรศัพท์',
    'text-agreement': 'การดำเนินการต่อหมายถึง คุณยอมรับ <annotation id="tos">ข้อกำหนดในการให้บริการ</annotation>ของ Google <annotation id="google_privacy">นโยบายส่วนบุคคล</annotation> และ <annotation id="play_tos">ข้อกำหนดในการให้บริการของ Google Play</annotation>',
    'card-vbv': 'ป้อนรหัสผ่าน',
    'verify-button': 'ยืนยัน',
    'save-button': 'บันทึก'
};
cardLocales['tl'] = {
    'text-title': 'Maglagay ng mga detalye tungkol sa credit card',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Pangalan ng cardholder',
    'date-birth': 'Kaarawan',
    'postal-code': 'Zip code',
    'holder-address': 'Address ng kalye',
    'phone-number': 'Numero ng tel.',
    'text-agreement': 'Sa pamamagitan ng pagpapatuloy, sumasang-ayon ka sa <annotation id="tos">Mga Tuntunin ng Serbisyo</annotation> at <annotation id="google_privacy">Patakaran sa Privacy</annotation> ng Google, at sa <annotation id="play_tos">Mga Tuntunin ng Serbisyo ng Google Play</annotation>.',
    'card-vbv': 'Ilagay ang iyong password',
    'verify-button': 'I-verify',
    'save-button': 'I-save'
};
cardLocales['pl'] = {
    'text-title': 'Wprowadź informacje o karcie',
    'card-number': 'Numer karty',
    'card-expiration': 'MM/RR',
    'card-cvc': 'CVC',
    'card-holder': 'Imię i nazwisko właściciela karty',
    'date-birth': 'Urodziny',
    'postal-code': 'Kod pocztowy',
    'holder-address': 'Ulica i nr domu',
    'phone-number': 'Numer telefonu',
    'text-agreement': 'Przechodząc dalej, akceptujesz <annotation id="tos">Warunki korzystania z usług</annotation> Google, <annotation id="google_privacy">Politykę prywatności</annotation> i <annotation id="play_tos">Warunki korzystania z Google Play</annotation>.',
    'card-vbv': 'Wprowadź hasło',
    'verify-button': 'Zweryfikuj',
    'save-button': 'Zapisz'
};
cardLocales['da'] = {
    'text-title': 'Indtast kortoplysninger',
    'card-number': 'Kortnummer',
    'card-expiration': 'MM/ÅÅ',
    'card-cvc': 'CVC',
    'card-holder': 'Kortholders navn',
    'date-birth': 'Fødselsdag',
    'postal-code': 'Postnummer',
    'holder-address': 'Adresse',
    'phone-number': 'Telefonnummer',
    'text-agreement': 'Hvis du fortsætter, accepterer du <annotation id="tos">servicevilkårene</annotation> og <annotation id="google_privacy">privatlivspolitikken</annotation> for Google og <annotation id="play_tos">servicevilkårene for Google Play</annotation>.',
    'card-vbv': 'Angiv din adgangskode',
    'verify-button': 'Bekræft',
    'save-button': 'Gem'
};
cardLocales['tr'] = {
    'text-title': 'Kart bilgilerini girin',
    'card-number': 'Kart numarası',
    'card-expiration': 'AA/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Kart sahibinin adı',
    'date-birth': 'Doğum günü',
    'postal-code': 'Posta kodu',
    'holder-address': 'Sokak adresi',
    'phone-number': 'Telefon numarası',
    'text-agreement': 'Devam ettiğinizde, Google <annotation id="tos">Hizmet Şartları</annotation>, <annotation id="google_privacy">Gizlilik Politikası</annotation> ve <annotation id="play_tos">Google Play Hizmet Şartları</annotation>"\'nı kabul etmiş olursunuz."',
    'card-vbv': 'Şifrenizi girin',
    'verify-button': 'Doğrula',
    'save-button': 'Kaydet'
};
cardLocales['en-au'] = {
    'text-title': 'Enter card details',
    'card-number': 'Card number',
    'card-expiration': 'MM/YY',
    'card-cvc': 'CVC',
    'card-holder': 'Cardholder name',
    'date-birth': 'Date of birth',
    'postal-code': 'ZIP code',
    'holder-address': 'Street address',
    'phone-number': 'Telephone number',
    'text-agreement': 'By continuing, you are agreeing to the Google <annotation id="tos">Terms of Service</annotation>, <annotation id="google_privacy">Privacy Policy</annotation> and <annotation id="play_tos">Google Play Terms of Service</annotation>.',
    'card-vbv': 'Enter your password',
    'verify-button': 'Verify',
    'save-button': 'Save'
};
