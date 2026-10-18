# HIKAYE — Eklemelerin hikâyeye etkisi

## Kısa cevap

Eklentiler oyunu **isimsiz bir canavarlı ev hikâyesinden**, **iki kardeş ve kalıtsal bir
hastalık üzerine spesifik bir trajediye** dönüştürdü. Ama **zorunlu oyun akışı hiç
değişmedi**: hâlâ orman → ev → keypad → bodrum → ateş → menü. Yeni olan her şey
opsiyonel. Üç son var ama hiçbiri hikâyeye zorunlu bağlı değil.

---

## Zorunlu akış değişmedi

Orijinal oyunun omurgası aynen duruyor:

```
orman (forest_s1..s4) → eve giriş (hallWay1_s1) → fener (F)
  → floor2key → Kat2 → hospitalKey → room2 → kaset
  → TV flashback → accessCard → keypad kodu → bodrum açılır
  → koltuk → T1-T4 → rüya → Happy Kitchen → bodrum final modu
  → tabanca → canavar kalkar → 2 vuruş → karartma → menü
```

Bu zincirin **hiçbir halkasına** yeni bir koşul, yeni bir eşya ya da yeni bir bayrak
eklenmedi. `tv.gd`'de orijinal kaset akışının sonuna dokunuldu ama yalnızca
`interaction_locked = false` ve `CollisionShape3D.disabled = false` geri alındı — yani
zincir **daha az** kilitleniyor, daha çok değil.

Oyuncu eklenen 30 düğümün **hiçbirine bakmadan** oyunu bitirebilir ve orijinal deneyimi
birebir yaşar. Tek fark, SON A'da karartmadan önce iki satır (`ending_letgo_1`,
`ending_letgo_2`) oynaması.

---

## Ne değişti: canavarın kimliği

**Önce:** hafızasını kaybetmiş bir adam, musallat olmuş bir ev, adı olmayan bir canavar.
Canavar bir tehditti; bir karakter değil.

**Sonra:** canavar **ağabey**. Bunu söyleyen tek bir satır yok; oyuncu parçaları birleştirir:

| Kanıt | Kaynak | Satır |
|---|---|---|
| Çizelge üzerindeki doz sayıları | `room3 → doseChart` | *"…The ticks stop on March 14th."* |
| Tıp kitapları, evin kütüphanesinde | `Library → medBooks` | `Lib_3` |
| Yatağa cıvatalanmış zincirler | `room3 → chains3` | `room3_4` |
| Kapının **iç** tarafındaki tırmık izleri | `room3 → doorInside` | `room3_3` |
| Araştırma kasetleri | `tv.gd → TAPE-01/02` | `tape1_1..2`, `tape2_1..3` |
| Canavarın getirdiği kuş | `hallWay → giftBird` | `monster_gift` |
| Duvar yazısı | `Basement → wallWriting` | `monster_word` |

Ağabey **kendi evinde zincirlenmiş**, kendi elleriyle yaptığı kuşu kardeşine hediye olarak
getiriyor. Bu, canavarı bir "musallat" olmaktan çıkarıp bir "hasta" yapıyor.

## Ne değişti: anlatıcının kimliği

**Önce:** hafıza kaybı bir oyun mekaniğiydi, açıklaması yoktu.

**Sonra:** hafıza kaybı **inkâr**. Ve bir zaman döngüsü var:

- `phone2_1`: *"That crying… it's me. That's my voice on the machine. I called this house
  for help, from inside this house."*
  → Telefonu arayan kişi kendisi. Kayıt evin **içinden** yapılmış.
- `ending_leave_2`: *"no. No, I have said this before"*
  → SON C'de evden çıkan oyuncu ormana döner ve bu cümleyi daha önce de kurduğunu fark eder.
- `lucid_1` (bodrum final modu girişi): ilk **berrak** rüya anı — anlatıcı ilk kez nerede
  olduğunu biliyor.
- `hallway_frame` (boş fotoğraf çerçevesi): duvarda bir fotoğraf olması gereken yerde yok.

Anlatıcı küçük kardeş. Orman açılışı bir "giriş" değil, bir **tekrar**.

## Ne değişti: Mart 14

Oyunda zaten bir keypad kodu vardı: `"0314"`. Bu kod **orijinal içerikti**, anlamı yoktu.
Eklentiler onu geriye dönük olarak doldurdu:

- `newspaper_1` (mutfaktaki gazete): *"…the date is circled in red. March 14th."*
- `room3_5` (doz çizelgesi): *"…The ticks stop on March 14th."*

Artık kod bir bulmaca değil, bir **tarih**: çizelgedeki tiklerin durduğu gün. İki bağımsız
ipucu aynı güne çıkıyor, oyuncu gazeteyi hiç bulmasa da çizelge yetiyor.

## Ne değişti: üç kuş = hikâyenin tezi

Üç tahta kuş üç ayrı sahnede, ortak bir sayaçla bağlı. Üçüncüsünde `bird_all` oynar:

> *"Three birds. One he made for a child, one he never finished, one he carved as a monster.
> Same hands. Always the same hands."*

Bu oyunun ana cümlesi. **Aynı eller**: bir çocuğa oyuncak yapan, yarım kalan bir kuşu
bırakan ve sonunda kendini bir canavar olarak oyduğu heykel — hepsi ağabeyin elleri.
Canavar ile kurban arasındaki ayrım burada çöküyor.

Kuşların dağılımı da tesadüfî değil:
1. `storageRoom → woodenBird` — depo, en erken bulunabilen
2. `attic → bird2` — çatı katı, boy çizgilerinin ve oyma aletlerinin yanındaki **yarım kuş**
3. `hallWay → giftBird` — **canavarın getirdiği** hediye; yalnızca TAPE-02 izlendikten sonra görünür

## Ne değişti: belirtiler

Üç "semptom" anı, anlatıcının **kendi** hastalığını işaret eder:

| # | Tetikleyici | Anahtar | İçerik |
|---|---|---|---|
| 1 | Mutfağa 2. giriş | `symptom_1` | İlk fark ediş |
| 2 | Aynaya 2. bakış | `symptom_2` | Kendine bakış |
| 3 | **Tabanca alınışı** | `symptom_3` | *"Look at that. For the first time since the forest, my hands are completely steady."* |

Üçüncüsü en önemlisi: eller ilk kez **sakin**. Yani titreme ormandan beri var ve
silahı eline aldığında geçiyor. Hastalık kalıtsal — ağabeyde olan şey kardeşte başlıyor.

`Basement → baseBox` bunun nesnel hâli: üzerinde *"FOR WHEN YOUR HANDS START SHAKING"* yazan
bir kutu. **Açılmıyor.** Sadece monolog veriyor. Devam oyununa bırakılmış bir tohum.

## Ne değişti: üç son

| Son | Nasıl | Anahtarlar | Bayrak |
|---|---|---|---|
| **A — Bırakmak** | Canavara ateş et (orijinal yol) | `ending_letgo_1`, `ending_letgo_2` | `ending_letgo_done` |
| **B — Tutunmak** | Şırınga **cebinde** canavarla etkileş (ateş etme) | `ending_holdon_1..3` | `ending_holdon_done` |
| **C — Gitmek** | `frontKey` + ön kapı kolu → orman | `door_leave_1`, `ending_leave_1`, `ending_leave_2` | `ending_leave_done` |

- **SON A orijinal sondur.** Sadece iki satır eklendi. Her oyuncu bunu görür.
- **SON B tamamen opsiyonel** ve tek bir koşula bağlı: banyodaki `syringeBox`'ı almış olmak.
  `monster.gd → interact()` ateş yoluna girmeden önce `syringe_found`'a bakar; şırınga varsa
  ateş **edilemez**, onun yerine kardeşinin yanına gidersin. Bu bir "iyi son" değil, bir
  "zor son": `ending_holdon_3`'te o elini tanıyor.
- **SON C tamamen opsiyonel.** `room2`'deki `frontKey` + `floor1hallWay`'deki ön kapı.
  Evden çıkarsın — ve ormana, döngünün başına dönersin. `ending_leave_2` bunu söyler.
  Kaçış bir kurtuluş değil.

Üç son da `main_menu.tscn`'ye döner. **Hiçbirinin epilogsu yok** — `epi_1`, `epi_a`,
`epi_b`, `epi_3`, `garden_1`, `garden_2` anahtarları `lang.csv`'de yazılı ama hiçbir yere
bağlı değil (G27 bunu bağlayacak).

`garden_1` / `garden_2` yazılmış kapanış:
> *"Her garden, gone wild. He kept it alive for years after her. Even sick, even shaking,
> he watered what she planted."*
> *"Two stones now. I carved his marker myself. One wing, like everything he left me."*

## Ne değişmedi

- Karakter isimleri yok. Hiçbir yerde "ağabey" ya da "kardeş" kelimesi geçmiyor;
  ilişki yalnızca nesnelerden çıkarılıyor.
- Canavarın modeli, animasyonları, sesleri, davranışı ve öldürme/yakalama mantığı **aynen** duruyor.
- Zorunlu eşya zinciri, keypad kodu, kaset/TV flashback akışı, koltuk-rüya-Happy Kitchen
  zinciri, bodrum final modu — hepsi orijinal.
- `Scripts/player.gd` ve `Scripts/FadeLayer.gd`'ye hiç dokunulmadı.
- `sofaScene.gd` ve `dream_happy_kitchen.gd`'deki kırılgan zamanlayıcılara dokunulmadı
  (yalnızca başa/sona ekleme yapıldı).
- Mevcut tutarsız adlar bilerek **olduğu gibi** yeniden kullanıldı: `MosterShows`, `handel`,
  `casset_putted`.

---

## Dürüst uyarı

Hikâye **metinde** tutarlı. Ama şu an **oyunda** büyük ölçüde görünmez:

1. Eklenen 30 düğümün hepsi **10 cm'lik emissive placeholder kutular**. Gerçek mesh yok.
   Oyuncu bir "tahta kuş" değil, parlayan bir küp görüyor.
2. Koordinatlar tahmin. Bir kısmı duvarın içinde ya da erişilemeyen yükseklikte olabilir.
3. `Objectives` autoload'u yeni içeriğin **hiçbirine** işaret etmiyor. Oyuncu kuşları,
   günlükleri, kasetleri arayacağını bilmiyor.
4. Günlük zinciri sıraya zorlanmıyor ve sıradaki sayfayı işaret eden bir ipucu yok (G24).
5. SON B'nin tek anahtarı tek bir belirsiz kutu. Kaçırılırsa oyuncu bir sonu kaybettiğini
   **bilmiyor** (G26 + G23).
6. TAPE-01/02, `phone2_1`, `phone_last` için **ses kaydı yok** — sadece altyazı oynuyor (G29).
7. Epilog hiç bağlı değil (G27).

Bu altı madde G21–G31 görev listesinin tamamının sebebi.
