---
title: "Phase 4 — Structure Design"
title_tr: "Faz 4 — Yapı Tasarımı"
node_type: phase
phase_number: 4
phase_gate_in: "phase-3-reading.md"
phase_gate_out: "phase-5-protocol.md"
description: "Design the thesis structure AFTER reading, not before. Synthesize reading notes into themes, propose table of contents, map sources to sections, set word targets. CRITICAL: Structure requires advisor approval before writing begins."
description_tr: "Tez yapısını OKUMADAN SONRA tasarla, öncesinde değil. Okuma notlarını temalara sentezle, içindekiler taslağı öner, kaynakları bölümlerle eşleştir, kelime hedeflerini belirle. KRİTİK: Yapı danışman onayı olmadan yazıma geçilemez."
tags: [phase, structure, table-of-contents, source-mapping, advisor-approval, critical]
outputs:
  - yapi_taslagi.md
  - KAYNAK_HARITASI.md
links_to:
  - skills/moc/MOC-disciplines.md
  - skills/techniques/argument-mapping.md
  - skills/templates/tpl-yapi-taslagi.md
  - skills/templates/tpl-kaynak-haritasi.md
  - skills/core/academic-integrity.md
used_by:
  - skills/moc/MOC-phases.md
  - skills/phases/phase-3-reading.md
  - skills/phases/phase-5-protocol.md
language: bilingual
version: "2.0"
---

# Faz 4 — Yapı Tasarımı / Phase 4 — Structure Design

## Amaç

Faz 3'teki okumalardan çıkan yapıyı tasarlamak. **Yapı okumalardan ÇIKAR**, okumadan önce uydurulmaz.

## Süreç

**Adım 1 — Okuma Sentezi**
`_notlar.md` dosyaları gözden geçirilir. Ana temalar, argüman hatları ve boşluklar belirlenir.

**Adım 2 — Yapı Önerisi**
[[MOC-disciplines]] üzerinden yüklenen disiplin modülüne göre önerilen yapı:

| Disiplin | Tipik Yapı |
|----------|-----------|
| Hukuk | Giriş → Bölüm 1 (Teori + Mevcut Durum) → Bölüm 2 (Öneri) → Sonuç |
| STEM | Introduction → Literature → Methodology → Results → Discussion → Conclusion |
| Sosyal Bilimler | Giriş → Kavramsal Çerçeve → Yöntem → Bulgular → Tartışma → Sonuç |
| Tıp | Introduction → Methods → Results → Discussion (IMRAD) |

**Adım 3 — Alt Bölümler ve İçindekiler**
Her bölümün alt bölümleri belirlenir. Detaylı içindekiler taslağı oluşturulur.

**Adım 4 — Kaynak Eşleştirme**
Her alt bölüm için çekirdek kaynaklar eşlenir (şablon: [[tpl-kaynak-haritasi]]):
```
Bölüm 1.1: → kaynak_a.pdf, kaynak_b.pdf, kaynak_c.pdf (3+)
Bölüm 1.2: → kaynak_d.pdf, kaynak_e.pdf (min 3 kaynak uyarısı)
```
Bir bölümde 3'ten az kaynak varsa → uyarı: "Bu bölüm için ek kaynak gerekli."

**Adım 5 — Uzunluk Hedefleri**

| Tez Türü | Hedef |
|----------|-------|
| Hukuk YL | 40.000-80.000 kelime |
| Sosyal bilimler YL | 25.000-50.000 kelime |
| STEM YL | 15.000-30.000 kelime |
| DR tezi | YL'nin 1.5-2 katı |

**Adım 6 — Yazım Sırası**
Genellikle: Kavramsal/teorik çerçeve → Yöntem/analiz → Giriş (önceki bölümler netleşince) → Sonuç (en son)

## Çıktılar

- `yapi_taslagi.md` — şablon: [[tpl-yapi-taslagi]]
- `KAYNAK_HARITASI.md` — şablon: [[tpl-kaynak-haritasi]]

## Danışman Kontrol Noktası (**KRİTİK**)

"İçindekiler taslağını danışmanınıza gösterin ve onay alın. **Yapı onaylanmadan [[phase-5-protocol]]'e geçilmez ve yazıma başlanmaz.**"
