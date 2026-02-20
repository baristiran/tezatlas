---
title: "Phase 0 — Identity Collection"
title_tr: "Faz 0 — Kimlik Toplama"
node_type: phase
phase_number: 0
phase_gate_in: null
phase_gate_out: "phase-1-topic.md"
description: "Collect the 8 required identity fields (student, university, institute, degree, advisor, language, discipline, topic). Auto-detect citation system and thesis structure tradition. Load university template and discipline module."
description_tr: "8 zorunlu kimlik alanını topla (öğrenci, üniversite, enstitü, derece, danışman, dil, disiplin, konu). Atıf sistemi ve tez yapı geleneğini otomatik tespit et. Üniversite şablonunu ve disiplin modülünü yükle."
tags: [phase, identity, onboarding, discipline-loading, university-format]
outputs:
  - proje_kimlik.md
links_to:
  - skills/core/iron-rules.md
  - skills/moc/MOC-disciplines.md
  - skills/moc/MOC-universities.md
  - skills/moc/MOC-citations.md
  - skills/templates/tpl-proje-kimlik.md
  - templates/universities/ornek.yaml
  - skills/core/academic-integrity.md
used_by:
  - skills/moc/MOC-phases.md
  - skills/phases/phase-1-topic.md
language: bilingual
version: "2.2"
---

# Faz 0 — Kimlik Toplama / Phase 0 — Identity Collection

## Amaç

Projenin temel kimlik bilgilerini toplamak. Bu bilgiler tüm sonraki fazlarda kullanılır.

## Sorulacak Bilgiler

**Zorunlu (8 alan):**
1. Öğrencinin adı soyadı
2. Üniversite adı
3. Enstitü adı (ör. Sosyal Bilimler Enstitüsü)
4. Anabilim dalı
5. Program türü: Yüksek Lisans (YL) veya Doktora (DR)
6. Danışman adı soyadı ve unvanı
7. Tez dili (Türkçe, İngilizce, Almanca, diğer)
8. Disiplin alanı (hukuk, mühendislik, sosyal bilimler, fen, tıp, işletme, eğitim, diğer)

**İsteğe bağlı:**
9. Teslim tarihi
10. Üniversitenin tez yazım kılavuzu (PDF olarak eklenebilir)
11. Atıf sistemi tercihi: Chicago, APA 7, Harvard, OSCOLA, IEEE, Vancouver

## Zorunlu Otomasyon Adımı

Faz 0 sırasında AI, `/kaynaklar/` klasörünü **boş olsa bile** oluşturur:

```bash
mkdir -p kaynaklar
```

Ardından kullanıcıya şu yönlendirme yapılır:
"Literatür taramasında keşfettiğiniz yayınların PDF'lerini `/kaynaklar/` klasörüne ekleyin."

## Otomatik Tespitler

**Atıf sistemi** (üniversite + disipline göre varsayılan) — tam tablo [[MOC-disciplines]]'da:
- Hukuk → Chicago Notes-Bibliography veya OSCOLA
- Sosyal bilimler → APA 7
- Mühendislik/Fen → IEEE
- Tıp → Vancouver
- İşletme → APA veya Harvard

**Tez yapı geleneği:**
- Hukuk → Giriş + 2-3 Bölüm + Sonuç
- STEM → IMRAD veya Introduction + Literature + Method + Results + Discussion
- Sosyal bilimler → her ikisi de olabilir

**Dil kuralları:**
- Türkçe → UTF-8 zorunlu, ş/ç/ğ/ı/ö/ü kontrol
- İngilizce → American/British English tutarlılığı

## Yükleme Adımları

1. `/kaynaklar/` klasörünü oluştur (yoksa) ve kullanıcıyı kaynak eklemeye teşvik et
2. [[MOC-universities]] üzerinden üniversite şablonunu yükle
   - **Listede varsa:** doğrudan yükle (ODTÜ, İTÜ, Boğaziçi, Hacettepe, Ankara, ASBÜ)
   - **Listede yoksa → Otomatik Türetme:**
     a. `templates/universities/ornek.yaml` dosyasını aç
     b. Kullanıcıya sor: "Üniversitenizin tez yazım kılavuzu var mı? PDF veya link paylaşabilirsiniz."
     c. Kılavuz paylaşıldıysa → ilgili alanları (kenar boşlukları, yazı tipi, satır aralığı) kılavuzdan oku → ornek.yaml'ı doldur
     d. Kılavuz yoksa → standart değerleri kullan ve kullanıcıyı bildir: "Üniversite kılavuzunuz eklendiğinde güncelleyebiliriz."
3. [[MOC-disciplines]] üzerinden disiplin modülünü yükle (tek bir modül)
4. Disipline göre varsayılan atıf sistemini tespit et; [[MOC-citations]] üzerinden rehberi yükle

## Çıktı

`proje_kimlik.md` oluşturulur — şablon: [[tpl-proje-kimlik]]
