---
title: "Template — KAYNAK_HARITASI.md (Phase 4 Output)"
title_tr: "Şablon — KAYNAK_HARITASI.md (Faz 4 Çıktısı)"
node_type: template
produces_file: KAYNAK_HARITASI.md
associated_phase: 4
description: "Source map created alongside the structure draft. Maps each subsection to its core PDFs. Warns when a section has fewer than 3 sources."
description_tr: "Yapı taslağıyla birlikte oluşturulan kaynak haritası. Her alt bölümü çekirdek PDF'leriyle eşleştirir. Bir bölümde 3'ten az kaynak varsa uyarır."
tags: [template, phase-4, source-mapping, section-coverage]
links_to:
  - skills/phases/phase-4-structure.md
used_by:
  - skills/phases/phase-4-structure.md
  - skills/phases/phase-6-writing.md
language: bilingual
version: "2.0"
---

# Şablon: KAYNAK_HARITASI.md

```markdown
# Kaynak Haritası

> Son güncelleme: [tarih]

## Bölüm 1.1: [başlık]
**Çekirdek kaynaklar:**
- `Yazar_Yıl_Başlık.pdf` (s. [ilgili sayfalar]) — [argüman notu]
- `Yazar_Yıl_Başlık.pdf` (s. [ilgili sayfalar]) — [argüman notu]
- `Yazar_Yıl_Başlık.pdf` (s. [ilgili sayfalar]) — [argüman notu]
**Yeterlilik:** ✓ (3+ kaynak)

## Bölüm 1.2: [başlık]
**Çekirdek kaynaklar:**
- `Yazar_Yıl_Başlık.pdf` (s. [ilgili sayfalar])
- `Yazar_Yıl_Başlık.pdf` (s. [ilgili sayfalar])
**Yeterlilik:** ⚠ (2 kaynak — ek kaynak gerekli)

## Bölüm 2.1: [başlık]
...
```
