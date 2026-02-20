---
title: "Anna's Archive — Source Download Integration"
title_tr: "Anna's Archive — Kaynak İndirme Entegrasyonu"
node_type: tooling
description: "Guide for using Anna's Archive via the annas_archive_helper.sh script. Covers search, download, quota check, and the full download chain from source need to /kaynaklar/ placement."
description_tr: "annas_archive_helper.sh scripti aracılığıyla Anna's Archive kullanım rehberi. Arama, indirme, kota kontrolü ve kaynak ihtiyacından /kaynaklar/ klasörüne yerleştirmeye kadar tam indirme zincirini kapsar."
tags: [tooling, annas-archive, download, script, source-hunting]
links_to:
  - skills/core/iron-rules.md
  - skills/techniques/source-hunting.md
  - skills/techniques/snowball-sampling.md
used_by:
  - skills/core/iron-rules.md
  - skills/core/source-policy.md
  - skills/phases/phase-2-sources.md
  - skills/phases/phase-3-reading.md
  - skills/phases/phase-6-writing.md
language: bilingual
version: "2.0"
---

# Anna's Archive Entegrasyonu / Anna's Archive Integration

## Script Kullanımı

```bash
# Arama
./scripts/annas_archive_helper.sh search "arama terimi"

# İndirme
./scripts/annas_archive_helper.sh download MD5_HASH dosya_adi.pdf

# Kota kontrolü
./scripts/annas_archive_helper.sh quota
```

**NOT:** Anna's Archive hesabı kullanıcıya aittir. API anahtarı scripte kullanıcı tarafından eklenir.

## İndirme Zinciri

[[iron-rules]] Kural 3 gereği AI önce kendisi indirir:

```
1. Kaynak ihtiyacı doğar (Faz 2, 3 veya 6)
2. /kaynaklar/ klasöründe ara
3. Bulunamazsa → Anna's Archive'da ara
4. Bulunduysa → script ile indir
5. İndirme başarılıysa → /kaynaklar/ klasörüne kaydet
6. İndirme başarısızsa → kullanıcıya tarayıcı linki ver
7. Kaynak /kaynaklar/'a eklenince → kullanılabilir, atıf yapılabilir
```

## Alternatif Kanallar (Anna's Archive başarısız olursa)

Sırayla dene:
1. SSRN — Sosyal bilimler ve hukuk çalışma kağıtları
2. arXiv — Fizik, matematik, CS, ekonometri
3. CORE (core.ac.uk) — Genel açık erişim
4. OpenAlex — Akademik metadata + erişim linkleri
5. Google Scholar — "PDF" filtreliyle
6. Kurumsal web sitesi (BIS, IMF, ECB vb. için doğrudan)
7. Üniversite kütüphanesi → kullanıcıya sor

## Kaynak Bulunamadığında

Kullanıcıya standart mesaj ([[source-hunting]] formatı):
```
"Şu kaynak Anna's Archive'da bulunamadı: [künye]
 Alternatif link: [varsa]
 Üniversite kütüphanenizde arayabilir misiniz?
 Önerilen dosya adı: Yazar_Yıl_Kısa_Başlık.pdf"
```
