---
title: "PDF Reading — Pre-check and Handling"
title_tr: "PDF Okuma — Ön Kontrol ve İşleme"
node_type: technique
description: "Pre-check protocol before reading any PDF: detect text-based vs scanned, handle very long documents by using table of contents, report unreadable files."
description_tr: "Her PDF okunmadan önce ön kontrol protokolü: metin tabanlı mı taranmış mı tespit et, çok uzun belgeleri içindekiler üzerinden yönet, açılamayan dosyaları raporla."
tags: [pdf-reading, pre-check, ocr, long-documents, phase-3, phase-6]
links_to:
  - skills/phases/phase-3-reading.md
  - skills/phases/phase-6-writing.md
  - skills/techniques/snowball-sampling.md
used_by:
  - skills/phases/phase-3-reading.md
  - skills/phases/phase-6-writing.md
language: bilingual
version: "2.0"
---

# PDF Okuma Ön Kontrol / PDF Reading Pre-check

## Ön Kontrol Algoritması

Her PDF okunmadan önce çalıştır:

```
AI PDF'i açar:
  ├─ Metin tabanlı, okunabilir → devam
  │
  ├─ Taranmış / görüntü bazlı → raporla:
  │    "Bu PDF taranmış (image-based), metin çıkarılamıyor.
  │     OCR gerekli veya metin tabanlı versiyon aranmalı."
  │    → Anna's Archive'da metin tabanlı versiyon ara
  │
  ├─ Çok uzun (500+ sayfa) →
  │    1. İçindekiler sayfasından ilgili bölümleri tespit et
  │    2. Sadece ilgili bölümleri oku
  │    3. Hangi sayfaları atladığını kaydet
  │
  └─ Açılamıyor → raporla:
       "Bu PDF açılamıyor. Farklı versiyon gerekli."
       → Kaynağı yeniden indirmeyi dene
```

## Uzun Belgeler için Bölüm Stratejisi

500+ sayfalık belgelerde (ör. kitaplar, raporlar) şu sırayla ilerle:
1. İçindekiler → tez konusuyla ilgili bölümleri işaretle
2. Giriş + Sonuç → genel argümanı kavra
3. İşaretlenen bölümleri oku
4. Dipnotları yalnızca bu bölümlerde tara ([[snowball-sampling]] için)

## Okuma Notu Formatı

Okunan her kaynak için [[tpl-notlar]] formatında `_notlar.md` oluştur:
- Doğrudan alıntı adayları (sayfa numaralı)
- Parafraz için ana argümanlar (sayfa numaralı)
- Keşfedilen yeni referanslar (kartopu)
- Diğer kaynaklarla bağlantılar
