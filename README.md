# TezAtlas

**Akademik tez yazımı için AI destekli skill graph sistemi.**

TezAtlas, yüksek lisans ve doktora öğrencilerinin AI (Claude, GPT, Gemini veya yerel LLM'ler) ile birlikte tez yazmasına yardımcı olan açık kaynaklı bir çerçevedir. Monolitik bir prompt dosyası yerine, birbirine bağlı **skill node**'larından oluşur — AI yalnızca o an gereken bilgiyi yükler.

---

## Hızlı Başlangıç

```bash
# Repoyu klonla
git clone https://github.com/baristiran/tezatlas.git
cd tezatlas

# Kurulum (slash command'ları yükler)
./scripts/install.sh

# Tez projen için yeni bir klasör oluştur
mkdir ~/tezim && cd ~/tezim

# Başlat
# Claude Code kullanıyorsan:
/tez-baslat

# Yerel LLM / başka bir AI kullanıyorsan:
# "tez-baslat.md dosyasını oku ve içindeki talimatları uygula" de
```

**Yerel LLM Kullanıcıları:** TezAtlas platform-agnostiktir. Önerilen minimum: Ollama + Qwen 2.5 72B veya Llama 3.1 70B. Context window < 8K ise her alt bölümü ayrı oturumda işle.

---

## Sistem Nasıl Çalışır

### Skill Graph Mimarisi

TezAtlas, birbirine wikilink'lerle bağlı markdown dosyalarından oluşur:

```
skills/INDEX.md               ← harita
  ├── skills/moc/             ← navigasyon merkezi (5 MOC)
  ├── skills/core/            ← her zaman aktif (Demir Kurallar, Kaynak Politikası vb.)
  ├── skills/phases/          ← 8 faz (0-7)
  ├── skills/techniques/      ← teknikler (kartopu, eleştirel okuma, argüman değerlendirme vb.)
  ├── skills/templates/       ← dosya şablonları
  └── skills/tooling/         ← araçlar (Anna's Archive, veritabanı erişimi, git)
```

Her node dosyası bir YAML frontmatter ile başlar. AI tam dosyayı okumadan tarama yapabilir, yalnızca gerekli ~5-7 node yükler (~400-600 token) — 1000+ satırlık monolitik bir prompt dosyası yerine.

### Oturum Başında AI Ne Yapar?

Her oturumun başında AI şu dosyaları okur:
1. `tezprotokol.md` — projeye özgü kural ve hedefler
2. `MEMORY.md` — sayısal ilerleme (makine okunabilir)
3. `DURUM_OZETI.md` — anlatısal ilerleme (insan okunabilir)
4. `DERSLER.md` — önceki oturumlardan öğrenilen dersler
5. `TERMINOLOJI.md` — proje terminoloji sözlüğü

Ardından hedef bölümün `_notlar.md` dosyasını okur ve çalışmaya başlar.

---

## 8 Faz — Adım Adım Tez Süreci

### Faz 0 — Kimlik Toplama

**Kullanıcı yapar:** AI `tez-baslat.md` protokolüyle sorular sorar; kullanıcı cevaplar.

**Ne sorulur:**
- Hangi üniversite? Hangi enstitü? Hangi program? (YL / Doktora)
- Danışman adı, teslim tarihi, kelime limiti
- Tez dili (TR / EN / DE)
- Atıf sistemi (Chicago, APA 7, Harvard, IEEE, OSCOLA, Vancouver)
- Disiplin (Hukuk, Sosyal Bilimler, Mühendislik, Fen Bilimleri, Tıp, İşletme, Eğitim, Beşeri Bilimler)

**AI yapar:** Cevapları `proje_kimlik.md` dosyasına kaydeder. Üniversiteye özgü format kurallarını yükler.

**Çıktı:** `proje_kimlik.md`

---

### Faz 1 — Konu Keşfi ve Başlık

**Ne olur:** AI sana 5 farklı tez başlığı alternatifi sunar. Sen birini seçersin veya birleştirirsin.

**AI ne yapar:**
1. Disiplinindeki güncel tartışmaları ve boşlukları listeler
2. Her başlık alternatifi için: araştırma sorusu, hipotez/tez iddiası, metodoloji önerisi ve çalışabilirlik analizi (6 ay / 1 yıl kapsamı) üretir
3. Sen seçtikten sonra kesinleştirir

**Başlık kriterleri:**
- Netlik: okuyucu konuyu tek cümlede anlayabilmeli
- Özgünlük: mevcut literatürde boşluk doldurmalı
- Kapsamlılık: YL için 6-8 ay, Doktora için 2-3 yıl gerçekçi
- Danışman uyumluluğu: danışmanın uzmanlık alanıyla örtüşmeli

**Çıktı:** `konu_kesfi.md` (5 alternatif + seçim gerekçesi + kesinleşmiş başlık)

**⚠️ Faz Geçiş Koşulu:** Danışman başlığı onaylamadan Faz 2'ye geçilmez.

---

### Faz 2 — Çekirdek Kaynak Avı

**Ne olur:** Tezin için minimum kaynak tabanı oluşturulur.

**Kullanıcı ne yapar:**
1. Elindeki PDF'leri `/kaynaklar/` klasörüne kopyalar
2. Dosya adlarını standartlaştırır: `Yazar_Yil_KisaBaslik.pdf`
   - Örnek: `Bodin_1576_Six_Books.pdf`, `Aristoteles_BC350_Politika.pdf`
3. AI, `/kaynaklar/` klasörünü tarar ve mevcut kaynakları `KAYNAK_ENVANTERI.md`'ye kaydeder

**AI ne yapar:**
1. Mevcut kaynakları değerlendirir (hakemli mi? ne kadar güncel? disipline uygun mu?)
2. Eksik kaynak türlerini belirler
3. Anna's Archive üzerinden eksik kaynakları aramaya çalışır
4. Bulunamazsa: SSRN → arXiv → CORE → ResearchGate → Unpaywall zincirini dener
5. Hâlâ bulunamazsa: kurumsal VPN bağlantısı için yönlendirme mesajı verir

**Minimum kaynak hedefleri:**
- YL: en az 30 kaynak (≥15 hakemli makale)
- Doktora: en az 60 kaynak (≥30 hakemli makale)

**Çıktı:** `KAYNAK_ENVANTERI.md` (tüm kaynaklar, kalite notu, durum)

**⚠️ Faz Geçiş Koşulu:** Minimum sayı karşılanmadan Faz 3'e geçilmez.

---

### Faz 3 — Okuma ve Kartopu Keşif (DÖNGÜ)

**Bu faz bir döngüdür.** Doygunluk kriterine ulaşılana kadar tekrar eder.

**Döngü nasıl işler:**

```
Kaynak kuyruğundan PDF seç
  ↓
PDF'i oku → sayfa numaralı notlar çıkar → _notlar.md'ye yaz
  ↓
Eleştirel değerlendirme:
  • Kaynak güvenilirliği puanı (1-15)
  • "Bu kaynakla hemfikirim / değilim çünkü..."
  • Tezdeki konumu: Destek / Karşı / Arka plan
  ↓
Dipnotları tara → yeni kaynaklar keşfet → kuyruğa ekle
  ↓
OKUMA_RAPORU.md güncelle
  ↓
Her 5 kaynakta bir: Doygunluk kontrolü
  ├─ Doygunluk YOK (yeni kavram ve kaynak geliyor) → döngüye devam
  └─ Doygunluk VAR → Faz 4'e geç
```

**Kullanıcı ne görür?**

`OKUMA_RAPORU.md` — canlı ilerleme panosu:
- ✅ Okunan kaynaklar (tarih, not dosyası)
- ⏳ Bekleyen sıra
- 🔍 Kartopu ile keşfedilen yeni kaynaklar
- 📊 Doygunluk kontrol sonuçları

**Not alma formatı (`_notlar.md`):**
```
### Yazar, Yıl: Başlık (s. X-Y)
**Temel argüman:** [1 cümle özet]
**Önemli alıntı:** "..." (s. X)
**Eleştirel değerlendirme:** [Güvenilirlik puanı, önyargı tespiti]
**Tezdeki konumu:** [Destek / Karşı / Arka plan]
```

**Çıktılar:**
- `_notlar.md` dosyaları (bölüm/kaynak gruplarına göre)
- `OKUMA_RAPORU.md`
- Güncellenmiş `KAYNAK_ENVANTERI.md`

**⚠️ Faz Geçiş Koşulu:** Doygunluk kriterine ulaşılmadan Faz 4'e geçilmez.

---

### Faz 4 — Yapı Tasarımı

**Ne olur:** Okuma notlarından tez yapısı çıkarılır. Yapı önceden değil, notlardan belirlenir.

**AI ne yapar (5 adım):**

1. **Okuma sentezi:** `_notlar.md` dosyalarını tarar, ana temaları gruplar
2. **Argüman kümeleri:** Hangi iddialar birbirine bağlı? Hangileri çatışıyor?
3. **Yapı önerisi:** Bölüm ve alt bölüm başlıkları önerir
4. **Harita çıkarma:** Her bölüme kaynak atar (hangi kaynak nerede kullanılacak)
5. **Yazım sırası:** Hangi bölüm önce yazılmalı? (genellikle teorik çerçeve → metodoloji → bulgular)

**Çıktı — `yapi_taslagi.md` şu bilgileri içerir:**
- Bölüm başlıkları ve alt bölümler
- Her bölüm için hedef kelime sayısı
- Her bölüme atanan kaynaklar
- Önerilen yazım sırası
- Tez genelinde argüman akışı özeti

**Kullanıcı kontrol eder:** "Bu yapı mantıklı mı? Eksik bir alan var mı?"

**Çıktılar:** `yapi_taslagi.md`, `KAYNAK_HARITASI.md`

**⚠️ Faz Geçiş Koşulu:** Danışman yapıyı onaylamadan Faz 5'e geçilmez (kritik kontrol noktası).

---

### Faz 5 — Protokol Üretimi

**Ne olur:** Projeye özgü çalışma protokolü oluşturulur. Bu dosyalar her oturumda okunur.

**AI ne üretir:**

| Dosya | İçerik |
|-------|--------|
| `tezprotokol.md` | 10 bölümlük proje anayasası (başlık, yapı, kurallar, kısıtlamalar) |
| `CLAUDE.md` | AI'ya proje başında okuması için talimatlar |
| `MEMORY.md` | Sayısal ilerleme dosyası (makine okunabilir) |
| `DURUM_OZETI.md` | Anlatısal ilerleme dosyası (insan okunabilir) |
| `TERMINOLOJI.md` | Proje terminoloji sözlüğü |
| `DERSLER.md` | Birikimsel öğrenme defteri |

`tezprotokol.md` içeriği:
```
1. Proje kimliği (başlık, üniversite, program, danışman, tarih)
2. Tez yapısı (bölümler, kelime hedefleri)
3. Atıf sistemi ve kurallar
4. Dil ve terminoloji standartları
5. Kaynak politikası
6. İş akışı kuralları
7. Danışman tercihleri
8. Kısıtlamalar ve kırmızı çizgiler
9. Güçlü yönler ve odak alanları
10. Hedef savunma tarihi ve geri sayım
```

**Çıktılar:** `tezprotokol.md`, `CLAUDE.md`, `MEMORY.md`, `DURUM_OZETI.md`, `TERMINOLOJI.md`, `DERSLER.md`

---

### Faz 6 — Oku ve Yaz (DÖNGÜ)

**Bu faz da bir döngüdür.** Her bölüm için okuma-yazma döngüsü tekrar eder.

**Üç oturum türü:**

| Tür | Ne zaman | Ne yapılır |
|-----|----------|------------|
| **Okuma Oturumu** | Kaynak karmaşık/uzunsa | Sadece PDF oku + `_notlar.md` güncelle |
| **Yazım Oturumu** | Notlar hazırsa | `_notlar.md` okuyarak paragraf paragraf yaz |
| **Tek Oturum** | Kısa bölümler için | Okuma + not + yazım aynı anda |

**Yazım kuralı — KAYNAK YOKSA YAZILMAZ:**

```
AI bir paragraf yazıyor → kaynak lazım → /kaynaklar/'da var mı?
  ├─ EVET → oku, sayfa bul, dipnot yaz, devam et
  └─ HAYIR → YAZIMI DURDUR
       → Kaynak bul (Anna's Archive veya kullanıcıya sor)
       → [KAYNAK BEKLENİYOR: konu, önerilen kaynak] etiketi koy
       → Başka paragraftan devam et
```

**Her paragrafın yapısı:**
```
1. Konu cümlesi (bu paragraf ne iddia ediyor?)
2. Argüman (neden doğru?)
3. Kanıt (hangi kaynaktan? hangi sayfadan?)
4. Dipnot (tam formatta)
5. Geçiş (sonraki paragrafla bağlantı)
```

**Kalite kontrol (her bölüm sonrası):**
- Her paragrafta kaynaklı atıf var mı?
- Atıflar `/kaynaklar/` PDF'lerinden mi?
- Terminoloji tutarlı mı?
- Argüman mantık zinciri tam mı? (varsayım → kanıt → sonuç)
- En güçlü karşı argüman ele alındı mı?

**Oturum sonu (her seferinde):**
- `MEMORY.md` + `DURUM_OZETI.md` güncelle
- `TERMINOLOJI.md` + `DERSLER.md` güncelle
- Git commit (Demir Kural 6: ZORUNLU)

**Çıktılar:** `chapter_X_Y.md` dosyaları (her alt bölüm ayrı dosya)

---

### Faz 7 — Bitiriş ve Savunma Hazırlığı

**Ne olur:** Tez tamamlandıktan sonra savunma için hazırlanılır.

**Adım 1 — Tez Geneli Tutarlılık Kontrolü:**
- Girişteki araştırma soruları sonuçta cevaplanmış mı?
- "Bölüm X'te ele alınacak" ifadeler gerçekten ele alındı mı?
- Dipnot numaraları ardışık mı?
- `[KAYNAK BEKLENİYOR]` etiketi kalmadı mı?
- Terminoloji baştan sona tutarlı mı?

**Adım 2 — Karşı Argümanlar Belgesi:**

AI sana soru sorar, cevaplarından `KARSI_ARGUMANLAR.md` üretir:
1. "Tezinizin kaç ana argümanı var?"
2. "Bu argümana jüri ne itiraz edebilir?"
3. "Bu itiraza hangi kaynakla yanıt verirsiniz?"
4. "Metodolojinizle ilgili beklediğiniz itirazlar?"

**Adım 3 — Savunma Soruları:**

AI sistematik olarak şunları üretir:
- Teorik çerçeveye yönelik sorular
- Metodoloji soruları
- Literatür boşluğu soruları
- "Neden bu metodoloji?" soruları
- "Katkınız nedir?" sorusu ve model cevabı

**Adım 4 — Son Biçimlendirme:**
- Kapak sayfası, içindekiler, kısaltmalar listesi kontrolü
- Tablo/şekil listesi kontrolü
- Kaynakça son kontrol (seçilen atıf sistemine göre)

**Çıktılar:** `KARSI_ARGUMANLAR.md`, `SAVUNMA_SORULARI.md`, `TUTARLILIK_KONTROLU.md`

---

## Demir Kurallar

1. **Kaynaksız yazım YASAK** — `/kaynaklar/` klasöründe PDF yoksa o paragraf yazılmaz
2. **Kartopu örnekleme ZORUNLU** — her kaynağın dipnotları taranır
3. **AI önce kendisi indirir** — Anna's Archive + açık erişim önce denenir
4. **Uydurma atıf = akademik suç** — hafızadan kaynak uydurmak kesinlikle yasak
5. **Danışman kontrol noktaları atlanamaz** — Faz 1 (başlık), Faz 3 (okuma raporu), Faz 4 (yapı) ve Faz 7 (bitiriş) danışman onayı gerektirir
6. **Oturum sonu git commit ZORUNLU** — her oturumun sonunda commit atılır

---

## Anna's Archive Entegrasyonu

TezAtlas, akademik kaynak indirme için Anna's Archive'ı kullanır.

**API anahtarı kurulumu (isteğe bağlı, daha hızlı indirme için):**

```bash
# Etkileşimli kurulum asistanı
./scripts/annas_archive_helper.sh setup-api-key

# Manuel: ~/.tezatlas_config dosyası oluştur
echo "ANNAS_ARCHIVE_API_KEY=anahtariniz" > ~/.tezatlas_config
chmod 600 ~/.tezatlas_config
```

**Script kullanımı:**

```bash
# Kaynak ara
./scripts/annas_archive_helper.sh search "Bodin sovereignty theory"

# URL ile indir
./scripts/annas_archive_helper.sh download "https://..." "Bodin_1576_Six_Books.pdf"

# MD5 hash ile indir (Anna's Archive'dan)
./scripts/annas_archive_helper.sh md5 abc123def456 "Bodin_1576_Six_Books.pdf"

# /kaynaklar/'da ara
./scripts/annas_archive_helper.sh check "Bodin"

# İstatistikler
./scripts/annas_archive_helper.sh stats
```

**API anahtarı güvenlik notu:**
- Anahtarı asla Git'e commit etme
- `.tezatlas/config` veya `~/.tezatlas_config` dosyasına yaz
- Kurulum asistanı `.gitignore`'a otomatik ekler

**İndirme bulunamazsa fallback zinciri:**
```
Anna's Archive → CORE → arXiv → SSRN → ResearchGate → Unpaywall → Kurumsal VPN → Kullanıcıdan iste
```

---

## Desteklenen Disiplinler, Atıf Sistemleri ve Üniversiteler

| Kategori | İçerik |
|----------|--------|
| **Disiplinler** | Hukuk, Sosyal Bilimler, Mühendislik, Fen Bilimleri, Tıp, İşletme, Eğitim, Beşeri Bilimler |
| **Atıf Sistemleri** | Chicago Notes-Bibliography, APA 7, Harvard, IEEE, OSCOLA, Vancouver |
| **Üniversiteler** | ODTÜ, İTÜ, Boğaziçi, Hacettepe, Ankara Üniversitesi, Ankara Sosyal Bilimler Üniversitesi |
| **Tez Türleri** | Yüksek Lisans, Doktora |
| **Diller** | Türkçe, İngilizce, Almanca |

---

## Sıkça Sorulan Sorular

**Bu sistem hangi AI'larla çalışır?**
Claude (Code veya API), ChatGPT, Gemini, ve Ollama üzerindeki yerel modeller (Qwen 2.5 72B, Llama 3.1 70B önerilir). Slash command'lar Claude Code'a özgüdür; diğer sistemlerde dosyayı manuel oku komutu ver.

**Context window yetmezse ne olur?**
`MEMORY.md` ve `DURUM_OZETI.md` tam olarak bu sorunu çözmek için tasarlandı. Yeni oturum başında bu iki dosyayı okuyan AI tam bağlamı yeniden kazanır. Küçük context window'lu modellerde (8K altı) her alt bölümü ayrı oturumda işle.

**Danışmanım farklı bir format istiyor, uyarlanabilir mi?**
Evet. Faz 0'da üniversite ve format kuralları toplanır. `tezprotokol.md` içinde danışman tercihlerine özel bölüm var. `TERMINOLOJI.md`'ye proje özgü kurallar eklenebilir.

**Türkçe / İngilizce / Almanca tez destekleniyor mu?**
Evet. Sistem bilingualdir (TR/EN belgelenmiş). Almanca tez için dil paketi mevcuttur.

**Kaynaklarımı nereden temin edeceğim?**
Önce üniversite kütüphanesi VPN'ine bak. Sonra Anna's Archive, CORE, SSRN, arXiv, ResearchGate, Unpaywall dene. Bulunamayan kaynaklar için sistem seni yönlendirir.

---

## Katkı

Yeni üniversite, disiplin veya atıf sistemi eklemek için `CONTRIBUTING.md` dosyasına bakın.

---

## Lisans

MIT
