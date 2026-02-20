# TezAtlas

**AI ile akademik tez yazan öğrenciler için açık kaynaklı yardımcı sistem.**

TezAtlas, bir yüksek lisans veya doktora öğrencisinin tezini AI ile birlikte yazmasını sağlar. Sıfırdan başlayıp savunmaya hazır bir teze kadar her adımı yönlendirir: konu belirleme, kaynak bulma, okuma, yapı tasarımı ve bölüm yazımı.

> **⚠️ Beta — Gerçek tez projelerinde henüz test edilmemiştir.**
> Deneyimlerinizi, hatalarınızı ve önerilerinizi [Issues](https://github.com/baristiran/tezatlas/issues) üzerinden paylaşırsanız sistem gelişir.

---

## Neden Bu Mimari?

Monolitik tek-dosya yaklaşımları (10.000–20.000 satır prompt) pratikte üç soruna yol açıyor: AI tüm context'i tek oturumda tüketiyor, dosya güncellenmez hale geliyor, öğrenci neyin nerede olduğunu bulamıyor.

TezAtlas aynı işlevselliği birbirine bağlı ~80 satırlık node'lara böler. AI her seferinde yalnızca o an gerekli 5–7 node'u yükler (~400–600 token), hepsini değil. Sistem bu tasarım kararının test edilmesi amacıyla açık kaynak olarak yayınlanmıştır — gerçek kullanım geri bildirimleri mimarinin olgunlaşmasını sağlayacak.

---

## Kimler İçin?

- Tez yazmaya yeni başlayan yüksek lisans / doktora öğrencileri
- AI'ı tez sürecinde nasıl kullanacağını bilmeyenler
- Claude Code, ChatGPT, Gemini veya bilgisayarında çalışan yerel AI kullananlar
- Bilgisayar bilgisi gerektirmez — yalnızca temel dosya işlemleri yeterlidir

---

## Başlamadan Önce Ne Gerekiyor?

**Zorunlu:**
- Bir AI aracı (birini seç):
  - **Claude Code** (önerilir — en iyi entegrasyon)
  - ChatGPT, Gemini veya benzeri bir web AI
  - Bilgisayarında çalışan yerel AI (Ollama vb.)
- İnternet bağlantısı (kurulum için)

**Gerekmez:**
- GitHub hesabı
- Programlama bilgisi
- Komut satırı deneyimi (yalnızca birkaç basit komut yeterli)

---

## Kurulum — Adım Adım

### Yöntem A: Claude Code Kullananlar İçin (Önerilir)

**Adım 1 — TezAtlas'ı bilgisayarına indir**

Sağ üstteki yeşil "Code" düğmesine tıkla → "Download ZIP" seç → İndirilen dosyayı aç.

Ya da terminali açıp şunu yaz:
```bash
git clone https://github.com/baristiran/tezatlas.git
```

**Adım 2 — Kurulum scriptini çalıştır**

Mac veya Linux kullanıyorsan terminali aç ve şunu yaz:
```bash
cd tezatlas
./scripts/install.sh
```

Windows kullanıyorsan Git Bash veya WSL terminali aç, aynı komutu çalıştır.

Ekranda şu mesajı görürsen kurulum tamamdır:
```
[BASARILI] TezAtlas basariyla kuruldu!
```

> **install.sh ne yapıyor?** Yalnızca birkaç komut dosyasını `~/.claude/commands/` klasörüne kopyalıyor. Sisteminizde hiçbir değişiklik yapmaz, hiçbir yazılım yüklemez.

**Adım 3 — Tez projen için bir klasör oluştur**

Belgelerim veya Masaüstü'nde yeni bir klasör oluştur. Adını tezin konusuyla ilgili bir şey yap. Örnek: `hukuk-tezim`

**Adım 4 — Kaynaklar klasörü oluştur**

Az önce oluşturduğun klasörün içine `kaynaklar` adında bir alt klasör oluştur. PDF kaynaklarını buraya koyacaksın.

```
hukuk-tezim/
└── kaynaklar/       ← PDF'lerin buraya gidecek
```

**Adım 5 — Claude Code'u tez klasöründe aç**

Claude Code'u aç → "Open Folder" → az önce oluşturduğun tez klasörünü seç.

**Adım 6 — Başlat**

Claude Code'da yazı yazma alanına şunu yaz ve Enter'a bas:
```
/tez-baslat
```

İngilizce kullanıyorsan:
```
/thesis-start
```

Claude sana sorular sormaya başlayacak. Cevapla, başlasın.

---

### Yöntem B: Claude Code Olmadan (ChatGPT, Gemini, Web AI)

**Adım 1 — TezAtlas'ı indir**

GitHub sayfasında yeşil "Code" → "Download ZIP" → dosyayı aç.

**Adım 2 — Başlangıç dosyasını bul**

İndirdiğin klasörde şu dosyayı aç:
```
tezatlas/.claude/commands/tez-baslat.md
```

**Adım 3 — AI'ya dosyayı ver**

Bu dosyanın tüm içeriğini kopyala → kullandığın AI'nın sohbet kutusuna yapıştır → Enter.

AI, sanki `/tez-baslat` yazılmış gibi süreci başlatacak.

**Adım 4 — Sonraki oturumlarda**

Her yeni oturumda AI'na şunu söyle:
> "tezatlas/skills/core/context-management.md dosyasını oku ve talimatları uygula. Tez projem: [MEMORY.md ve DURUM_OZETI.md dosyalarının içeriğini buraya yapıştır]"

---

### Yöntem C: Yerel AI (Ollama, LM Studio vb.)

**Minimum gereksinim:** Qwen 2.5 72B veya Llama 3.1 70B (daha küçük modeller çalışır ama kalite düşer)

**Başlatmak için:**
```
"tezatlas/.claude/commands/tez-baslat.md dosyasını oku ve içindeki talimatları uygula"
```

**Context window küçükse (8K altı):** Her alt bölümü ayrı oturumda işle. Oturum başında MEMORY.md ve DURUM_OZETI.md'yi yapıştır.

---

## İlk Kullanımda Ne Olur? — Adım Adım

### AI sana sorular sorar, sen cevaplarsın

`/tez-baslat` yazdıktan sonra AI şu bilgileri senden ister:

| Soru | Örnek cevap |
|------|-------------|
| Hangi üniversite? | "Ankara Üniversitesi" |
| Hangi enstitü ve program? | "Sosyal Bilimler Enstitüsü, Kamu Hukuku YL" |
| Danışman adı? | "Prof. Dr. Ahmet Yılmaz" |
| Tez dili? | "Türkçe" |
| Atıf sistemi? | "Chicago" (bilmiyorsan "danışmanım söylemedi" de, AI önerir) |
| Teslim tarihi? | "Haziran 2026" |
| Konu hakkında ne düşünüyorsun? | Birkaç cümle, istediğin kadar kısa olabilir |

Bunları cevapladıktan sonra AI süreci başlatır.

---

## 8 Faz — Tezin Nasıl İlerler

TezAtlas tez sürecini 8 adıma böler. Her adım tamamlanmadan sonrakine geçilmez.

---

### Faz 0 — Kimlik Toplama
**Süre:** 15-30 dakika

AI senden temel bilgileri toplar ve `proje_kimlik.md` dosyasını oluşturur. Bu dosya üniversitene, programına, danışmanına ve atıf sistemine özel kuralları içerir.

**Sen ne yaparsın:** Soruları cevapla.
**AI ne üretir:** `proje_kimlik.md`

---

### Faz 1 — Konu Keşfi ve Başlık
**Süre:** 1-3 oturum

AI sana 5 farklı tez başlığı alternatifi sunar. Her biri için şunları gösterir:
- Araştırma sorusu ("Bu tez ne soruyor?")
- Tez iddiası ("Bu tez ne savunuyor?")
- Önerilen yöntem
- Gerçekçilik analizi (6-8 ayda tamamlanabilir mi?)

**Sen ne yaparsın:** 5 alternatiften birini seçersin, istersen birleştirirsin veya kendi başlığını söylersin. AI kesinleştirir.

**Önemli:** Başlığı danışmanına göster ve onayını al. Onay olmadan bir sonraki adıma geçme.

**AI ne üretir:** `konu_kesfi.md`

---

### Faz 2 — Kaynak Toplama
**Süre:** 2-5 oturum

**Önce sen yaparsın:**
1. Elinde varsa, konuyla ilgili PDF'leri `kaynaklar/` klasörüne kopyala
2. Dosya adlarını şu formata göre değiştir: `Yazar_Yil_KisaBaslik.pdf`
   - Örnek: `Teziç_2003_Anayasa_Hukuku.pdf`
   - Örnek: `Locke_1690_Two_Treatises.pdf`
   - Türkçe karakter kullanma, boşluk yerine alt çizgi koy

**Sonra AI devam eder:**
- `kaynaklar/` klasörünü tarar, elindeki kaynakları listeler
- Eksik kaynak türlerini belirler
- Anna's Archive üzerinden eksik kaynakları bulmaya çalışır
- Bulamazsa: "Şu kaynağı bulamadım, üniversite kütüphanesinden indirebilir misiniz?" der

**AI ne üretir:** `KAYNAK_ENVANTERI.md` (tüm kaynakların listesi)

---

### Faz 3 — Okuma ve Not Alma
**Süre:** Kaynakların kalabalığına göre 2-8 hafta

Bu aşama bir **döngüdür** — otur, devam et, bir sonraki oturumda kaldığın yerden devam et.

**Her oturumda ne olur:**
1. AI bir PDF'i okur
2. Sayfa numaralı notlar çıkarır
3. Her kaynak için değerlendirme yapar: "Bu kaynak tezi destekliyor mu, karşı argüman mı, sadece arka plan mı?"
4. PDF'in dipnotlarından yeni kaynak önerileri çıkarır (kartopu örnekleme)
5. `OKUMA_RAPORU.md`'yi günceller

**Hangi PDF'in okunduğunu nasıl görürsün?**
`OKUMA_RAPORU.md` dosyasını aç. Tablo halinde şunları görürsün:
- ✅ TAMAMLANDI — o PDF okundu, notlar çıkarıldı
- ⏳ SIRA BEKLİYOR — sıraya alındı
- 🔄 DEVAM EDİYOR — şu an okunuyor

Her 5 kaynaktan sonra AI "doygunluk kontrolü" yapar: yeni kavram ve kaynak azaldıysa "Faz 4'e geçebiliriz" der.

**AI ne üretir:** `_notlar.md` dosyaları + `OKUMA_RAPORU.md`

---

### Faz 4 — Yapı Tasarımı
**Süre:** 2-4 oturum

AI, okuduğu notlardan tezin yapısını çıkarır. **Yapıyı senden önce belirlemez** — önce okur, sonra yapıyı önerir.

**AI ne yapar:**
- Notlardaki temaları gruplar
- Bölüm başlıkları önerir
- Her bölüme hangi kaynakların gideceğini belirler
- Her bölüm için kelime hedefi verir (örn. Giriş: 3.000, Bölüm 1: 8.000...)
- Hangi bölümün önce yazılacağını önerir

**Sen ne yaparsın:** "Bu yapı mantıklı mı?" diye düşün. Değilse söyle, AI yeniden düzenler.

**Önemli:** Bu yapıyı danışmanına göster ve onayını al. **Danışman onayı olmadan Faz 5'e geçme.**

**AI ne üretir:** `yapi_taslagi.md`, `KAYNAK_HARITASI.md`

---

### Faz 5 — Proje Protokolü
**Süre:** 1 oturum

AI, tüm bilgileri bir araya getirerek projeye özgü çalışma dosyaları oluşturur. Bu dosyalar bundan sonra **her oturumun başında okunur**.

| Dosya | Ne işe yarar |
|-------|-------------|
| `tezprotokol.md` | Tüm kurallar, yapı, hedefler — projenin anayasası |
| `CLAUDE.md` | AI'nın her oturum başında okuduğu talimatlar |
| `MEMORY.md` | Sayısal ilerleme (kaçıncı bölüm, kaç kelime, hangi dipnot) |
| `DURUM_OZETI.md` | Sana okunabilir ilerleme özeti |
| `TERMINOLOJI.md` | Projene özel terimler sözlüğü |
| `DERSLER.md` | Danışman veya senden gelen düzeltmeler birikir |

Bu dosyalar sayesinde oturumu kapatıp açsan bile AI tam olarak nerede kaldığını bilir.

**AI ne üretir:** Yukarıdaki 6 dosya

---

### Faz 6 — Yazım
**Süre:** Tezin uzunluğuna göre 4-16 hafta

Burada gerçek tez yazılır. Her oturumda bir alt bölüm hedeflenir.

**Temel kural: Kaynak yoksa cümle yazılmaz.**

Eğer bir paragraf için `kaynaklar/` klasöründe PDF yoksa AI şunu yapar:
```
[KAYNAK BEKLENİYOR: Ana egemenlik teorisi için Bodin'in Six Books of the Republic
 eseri gerekli. Anna's Archive'da arandı, bulunamadı.
 Lütfen bu kaynağı temin edip kaynaklar/ klasörüne ekleyin.]
```
O paragrafı bekletir, başka paragraftan devam eder.

**Her paragrafın yapısı:**
1. Konu cümlesi → 2. Argüman → 3. Kaynak ve sayfa → 4. Dipnot → 5. Geçiş

**Oturum sonu zorunluları:**
- `MEMORY.md` güncellenir
- `DURUM_OZETI.md` güncellenir
- Git commit atılır (otomatik)

**AI ne üretir:** `chapter_X_Y.md` dosyaları

---

### Faz 7 — Bitiriş ve Savunma
**Süre:** 1-2 hafta

Tüm bölümler yazıldıktan sonra:

**1. Tutarlılık kontrolü:**
- Girişteki sorular sonuçta cevaplanmış mı?
- Dipnot numaraları sıralı mı?
- Terminoloji baştan sona tutarlı mı?
- Bekleyen kaynak etiketi kaldı mı?

**2. AI sana sorular sorar, sen cevaplarsın:**
> "Tezinizin kaç ana argümanı var?" → cevapla
> "Bu argümana jüri ne itiraz edebilir?" → cevapla
> "Bu itiraza hangi kaynakla yanıt verirsiniz?" → cevapla

Cevaplarından `KARSI_ARGUMANLAR.md` ve `SAVUNMA_SORULARI.md` dosyaları oluşturulur.

**AI ne üretir:** `KARSI_ARGUMANLAR.md`, `SAVUNMA_SORULARI.md`, `TUTARLILIK_KONTROLU.md`

---

## Oturum Aralarında Ne Olur?

**AI her şeyi "unutur" — ama TezAtlas bunu çözer.**

Her oturumun başında AI şu dosyaları okur:
1. `tezprotokol.md` — projenin kuralları
2. `MEMORY.md` — sayısal ilerleme (hangi bölüm, kaç dipnot, nerede kaldı)
3. `DURUM_OZETI.md` — son oturumda ne yapıldı
4. `DERSLER.md` — daha önce yapılan hatalar ve düzeltmeler
5. `TERMINOLOJI.md` — projeye özel terimler

Bu sayede yeni oturumda "geçen sefer neredeydiniz?" sorusu olmaz. AI tam olarak nerede kaldığını bilir.

---

## Kaynak İndirme

TezAtlas kaynakları bulmak için önce kendi dener, bulamazsa senden ister.

**AI'nın denediği sıra:**
```
1. /kaynaklar/ klasörüne bak (zaten var mı?)
2. Anna's Archive'da ara
3. CORE, arXiv, SSRN, ResearchGate, Unpaywall'da ara
4. Bulamazsa: "Bu kaynağı üniversite kütüphanesinden indirir misiniz?" der
```

**Anna's Archive API anahtarı (isteğe bağlı):**

API anahtarı varsa AI daha hızlı indirir. Yoksa yine çalışır ama bazı kaynaklar için tarayıcıya yönlendirir.

Anahtarı güvenli kaydetmek için:
```bash
cd tezatlas
./scripts/annas_archive_helper.sh setup-api-key
```

Sihirbaz soruları sorar, anahtarı güvenli bir yere kaydeder. Git'e gitmez.

---

## Demir Kurallar

Bunlar değiştirilemez. AI bu kurallara her zaman uyar:

| Kural | Ne demek |
|-------|----------|
| **Kaynaksız yazım yasak** | `/kaynaklar/` klasöründe PDF yoksa o cümle yazılmaz |
| **Kartopu zorunlu** | Her kaynağın dipnotları taranır, yeni kaynaklar keşfedilir |
| **Kaynak uydurma yasak** | AI hiçbir zaman kafadan kaynak uyduramaz |
| **Danışman onayı atlanamaz** | Başlık (Faz 1) ve yapı (Faz 4) danışman olmadan ilerlemez |
| **Oturum sonu commit** | Her oturum sonunda değişiklikler kaydedilir |

---

## Sıkça Sorulan Sorular

**GitHub hesabı gerekiyor mu?**
Hayır. ZIP olarak indirip kullanabilirsin. GitHub hesabı yalnızca repoyu güncellemek istersen gerekir.

**Her oturumda ne kadar süre harcamalıyım?**
Faz 3 ve 6 için 90-120 dakikalık oturumlar idealdir. Context window dolmadan kapattığında AI kaldığı yeri kaydeder.

**Danışmanım bu sistemi bilmek zorunda mı?**
Hayır. Danışmanın gördüğü şey: sana gelen dosyalar (bölüm taslakları, yapı planı). TezAtlas'ı kullandığını bilmesi gerekmiyor.

**AI tezi benim yerime mi yazıyor?**
Hayır — her iddia, her argüman, her kaynak seçimi senindir. AI yapıyı kurar, kaynakları bulur, notları düzenler ve kuralları uygular. Ama "ne savunuyorsun" sorusuna sen cevap verirsin.

**Tezim çok farklı bir disiplindeyse?**
TezAtlas 8 disiplini destekler: Hukuk, Sosyal Bilimler, Mühendislik, Fen Bilimleri, Tıp, İşletme, Eğitim, Beşeri Bilimler. Faz 0'da disiplinini söylediğinde o disipline özgü kurallar yüklenir.

**Atıf sistemimi bilmiyorum?**
Faz 0'da "bilmiyorum" de. AI danışmanının muhtemelen beklediği sistemi önerir, onaylatmana yardım eder.

**Türkçe-İngilizce karışık tez yazabilir miyim?**
Evet. Faz 0'da tez dilini belirtirsin. Sistem bilingual çalışır.

---

## Desteklenen Yapılandırmalar

| Kategori | Seçenekler |
|----------|-----------|
| **AI Araçları** | Claude Code, Claude API, ChatGPT, Gemini, Ollama (Qwen 2.5 72B+) |
| **İşletim Sistemi** | macOS, Linux, Windows (Git Bash / WSL) |
| **Disiplinler** | Hukuk, Sosyal Bilimler, Mühendislik, Fen Bilimleri, Tıp, İşletme, Eğitim, Beşeri Bilimler |
| **Atıf Sistemleri** | Chicago Notes-Bibliography, APA 7, Harvard, IEEE, OSCOLA, Vancouver |
| **Üniversiteler** | ODTÜ, İTÜ, Boğaziçi, Hacettepe, Ankara Üniversitesi, Ankara Sosyal Bilimler |
| **Tez Türleri** | Yüksek Lisans, Doktora |
| **Tez Dilleri** | Türkçe, İngilizce, Almanca |

---

## Katkı

Yeni üniversite formatı, disiplin modülü veya atıf sistemi eklemek için `CONTRIBUTING.md` dosyasına bakın.

---

## Lisans

MIT — Serbestçe kullanabilir, değiştirebilir, paylaşabilirsiniz.
