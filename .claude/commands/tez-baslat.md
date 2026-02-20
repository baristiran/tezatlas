# TezAtlas — Akademik Tez Yazım Asistanı

Bu bir akademik tez yazım projesidir. Aşağıdaki talimatları takip et.

## Başlangıç

1. `skills/INDEX.md` dosyasını bul ve frontmatter'ını oku — bu beceri grafının haritası.
2. Aşağıdaki **zorunlu core node'ları** sırayla oku (`priority: critical`):
   - `skills/core/iron-rules.md` — her oturumda geçerli 6 kural
   - `skills/core/source-policy.md` — kaynak erişim politikası
   - `skills/core/context-management.md` — oturum bellek sistemi
3. Projenin mevcut durumunu kontrol et:
   - `proje_kimlik.md` var mı? → VARSA bu yeni proje değil, mevcut projeye devam et.
   - Yoksa → Faz 0'dan başla: `skills/phases/phase-0-identity.md` oku.

## Mevcut Projeye Devam

Eğer proje zaten kurulmuşsa — `skills/core/context-management.md` sistemini uygula:
1. `DURUM_OZETI.md` oku → nerede kaldığını öğren
2. `MEMORY.md` oku → ilerleme durumu
3. `DERSLER.md` oku → öğrenilen kurallar
4. `TERMINOLOJI.md` oku → terim tutarlılığı
5. İlgili `_notlar.md` dosyalarını oku → kaynak notları
6. Kullanıcıya sor: "Hangi bölüm üzerinde çalışacağız?"

## Yeni Proje Başlangıcı

`skills/phases/phase-0-identity.md` oku ve Faz 0 sorularını sor. Sonra:
- `/kaynaklar/` klasörü yoksa oluştur (`mkdir -p kaynaklar`) ve kullanıcıyı şu konuda yönlendir:
  - "Literatür taramasında keşfettiğiniz yayınların PDF'lerini `/kaynaklar/` klasörüne ekleyin."
- `skills/moc/MOC-universities.md` → üniversite şablonu yükle
- `skills/moc/MOC-disciplines.md` → disiplin modülü yükle
- `skills/moc/MOC-citations.md` → atıf rehberi yükle
- `skills/phases/phase-1-topic.md` oku → Faz 1'e geç
- Faz 1'de `konu_kesfi.md` üretildikten sonra dosyanın tam içeriğini konsolda kullanıcıya göster (dosyayı ayrıca açmasını isteme).

## Demir Kurallar (Her Zaman Geçerli)

1. **Kaynaksız yazım YASAK.** Kaynak /kaynaklar/ klasöründe yoksa yazma, bekle.
2. **Kartopu örnekleme ZORUNLU.** Her kaynağın dipnotlarını tara, yeni kaynaklar keşfet.
3. **AI önce kendisi indirir.** Anna's Archive veya açık erişimden dene. İndiremezse kullanıcıya sor.
4. **Uydurma atıf = akademik suç.** Sadece /kaynaklar/ klasöründeki PDF'lerden atıf yap.
5. **Danışman kontrol noktaları atlanamaz.** Her kritik fazda danışman onayı sor.
6. **Her oturum sonu git commit zorunludur.** Commit atılmadan oturum kapatılmaz.

## Beceri Grafı Navigasyonu

Tüm detaylar `skills/` altındaki skill graph'ta:
- **Fazlar:** `skills/moc/MOC-phases.md` → `skills/phases/phase-X-*.md`
- **Teknikler:** `skills/techniques/` (kartopu, doygunluk, PDF okuma vb.)
- **Disiplinler:** `skills/moc/MOC-disciplines.md` → `templates/disciplines/`
- **Atıf sistemleri:** `skills/moc/MOC-citations.md` → `templates/citations/`
- **Araçlar:** `skills/tooling/` (anna's archive, git)
