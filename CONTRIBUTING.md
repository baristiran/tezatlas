# Katkıda Bulunma Rehberi

TezAtlas'a katkıda bulunmak istediğiniz için teşekkürler! Bu rehber, farklı katkı türleri için adım adım talimatlar içerir.

## Genel Süreç

1. Bu repoyu **fork** edin
2. Yeni bir **branch** oluşturun: `git checkout -b feature/universite-itu`
3. Değişikliklerinizi yapın
4. Test edin (aşağıdaki kontrol listelerini kullanın)
5. Commit edin: `git commit -m "Ekle: İTÜ üniversite şablonu"`
6. **Pull Request** gönderin

## Üniversite Şablonu Ekleme

En kolay katkı yolu! Kendi üniversitenizin tez yazım kılavuzunu YAML formatına dönüştürün.

### Adımlar

1. `templates/universities/ornek.yaml` dosyasını kopyalayın
2. Dosya adı: `[universite-kisaltma].yaml` (örn: `itu.yaml`, `ege.yaml`)
3. Üniversitenizin **Tez Yazım Kılavuzu**'nu bulun (genellikle enstitü web sitesinde)
4. Kılavuzdaki değerleri YAML'a aktarın

### Zorunlu Alanlar

Her üniversite şablonunda şu alanlar **zorunludur**:

```yaml
universite:
  tam_ad: "..."
  kisa_ad: "..."
  enstitu: "..."

sayfa:
  kagit: "A4"
  kenar_bosluklari:
    sol: "..."
    sag: "..."
    ust: "..."
    alt: "..."
  satir_araligi: "..."

yazi_tipi:
  ana_metin: "..."
  boyut: 12

basliklar:
  bolum:
    font_boyut: 14
    kalin: true
```

### Kontrol Listesi

- [ ] YAML syntax doğru mu? (`python3 -c "import yaml; yaml.safe_load(open('dosya.yaml'))"`)
- [ ] Tüm zorunlu alanlar mevcut mu?
- [ ] Değerler üniversitenin resmi kılavuzuyla uyumlu mu?
- [ ] `notlar` alanında kılavuzun hangi versiyonunun (yıl) baz alındığı belirtildi mi?
- [ ] Dosya UTF-8 kodlamasında mı?

## Disiplin Modülü Ekleme

Yeni bir akademik disiplin için modül oluşturmak isterseniz:

### Dosya Konumu
`templates/disciplines/[disiplin-adi].md`

### Zorunlu Bölümler

Her disiplin modülünde şu bölümler **zorunludur** (mevcut modülleri referans alın):

1. **Atıf Sistemi** — Önerilen ve alternatif atıf sistemleri
2. **Metodoloji Gereksinimleri** — En az 2 metodoloji türü (nitel, nicel, karma vb.)
3. **Yazım Kuralları** — Dil, üslup, terminoloji kuralları
4. **Kaynak Kalite Hiyerarşisi** — En az 6 seviye, disipline özel sıralama
5. **Tez Yapısı Önerileri** — En az 2 farklı yapı (ampirik + teorik)
6. **Sık Yapılan Hatalar** — En az 5 madde

### Kalite Standartları

- Türkçe açıklama dili (terimler orijinal dilde parantez içinde)
- Somut örnekler (soyut tanımlar yetmez)
- Disipline gerçekten hakim biri tarafından yazılmalı
- Mevcut modüllerle tutarlı yapı ve derinlik

## Atıf Sistemi Rehberi Ekleme

### Dosya Konumu
`templates/citations/[sistem-adi].md`

### Zorunlu Bölümler

1. **Genel Kurallar** — Sistemin temel mantığı
2. **Kitap** — Tek yazarlı, çok yazarlı, editörlü, kitap bölümü, çeviri
3. **Dergi Makalesi** — DOI ile ve DOI'siz
4. **Kurum Raporu** — Kurumsal ve bireysel yazarlı
5. **Tez**
6. **Çevrimiçi Kaynak**
7. **Özel Durumlar** — Aynı yazarın eserleri, ikincil kaynak, blok alıntı
8. **Karşılaştırma Tablosu** — En az 1 diğer sistemle fark tablosu

### Minimum Gereksinim

- Her kaynak türü için hem **metin içi** hem **kaynakça** formatı
- Türkçe akademik bağlamda örnekler
- En az 150 satır (Harvard seviyesinde değil, APA/Chicago seviyesinde derinlik)

## Script Ekleme / Düzenleme

### Standartlar

- `#!/bin/bash` ve `set -euo pipefail` ile başla
- Değişken adları açıklayıcı (İngilizce veya Türkçe tutarlı)
- Yardım mesajları Türkçe
- Renkli çıktı: `GREEN`, `RED`, `YELLOW`, `BLUE`, `NC` standart kullan
- Her fonksiyon başında kısa açıklama yorumu

### ShellCheck

PR göndermeden önce scriptlerinizi ShellCheck ile kontrol edin:

```bash
shellcheck scripts/yeni_script.sh
```

## Hata Bildirimi

GitHub Issues üzerinden hata bildirirken:

1. **Başlık:** Kısa ve açıklayıcı
2. **Açıklama:**
   - Ne olması gerekiyordu?
   - Ne oldu?
   - Hangi dosya/şablon/script etkileniyor?
3. **Ortam:** İşletim sistemi, AI aracı (Claude Code vs.)
4. **Varsa ekran görüntüsü veya log**

## İyileştirme Önerileri

Yeni özellik veya iyileştirme önerilerinizi GitHub Issues üzerinden paylaşın. Önerirken:

- Problemi veya ihtiyacı açıklayın
- Mümkünse çözüm önerisi sunun
- Hangi kullanıcı grubunu etkileyeceğini belirtin

## PR Süreci

1. PR açıldığında CI otomatik çalışır (YAML validation, ShellCheck, markdown lint)
2. En az 1 review gerekir
3. CI geçmeden merge yapılmaz
4. Commit mesajları açıklayıcı olmalı:
   - `Ekle: Ege Üniversitesi şablonu`
   - `Düzelt: Harvard rehberinde DOI format hatası`
   - `Güncelle: Mühendislik modülüne SEM bölümü`

## İletişim

- **Issues:** Hata bildirimi ve öneriler için
- **Pull Requests:** Kod katkıları için
- **Discussions:** Genel tartışmalar için (GitHub Discussions etkinse)

---

*Her katkı TezAtlas'ı daha iyi yapar. Akademik dürüstlük için birlikte çalışıyoruz.*
