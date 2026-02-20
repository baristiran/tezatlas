---
title: "Phase 7 — Finalization and Defense Preparation"
title_tr: "Faz 7 — Bitiriş ve Savunma Hazırlığı"
node_type: phase
phase_number: 7
phase_gate_in: "phase-6-writing.md"
phase_gate_out: null
description: "After thesis text is complete: auto-generate defense documents, run thesis-wide consistency check, compile bibliography, produce abstract, and prepare for Turnitin/Word export."
description_tr: "Tez metni tamamlandıktan sonra: savunma dokümanlarını otomatik üret, tez geneli tutarlılık kontrolünü çalıştır, kaynakçayı derle, özet üret, Turnitin/Word dışa aktarımına hazırlan."
tags: [phase, finalization, defense, bibliography, consistency-check, export]
outputs:
  - KARSI_ARGUMANLAR.md
  - SAVUNMA_SUNUM_TASLAGI.md
  - SAVUNMA_SORULARI.md
  - YONETICI_OZETI.md
  - TUTARLILIK_KONTROLU.md
links_to:
  - skills/core/quality-control.md
  - skills/moc/MOC-citations.md
  - skills/templates/tpl-karsi-argumanlar.md
  - skills/templates/tpl-savunma-sorulari.md
used_by:
  - skills/moc/MOC-phases.md
  - skills/phases/phase-6-writing.md
language: bilingual
version: "2.1"
---

# Faz 7 — Bitiriş ve Savunma Hazırlığı / Phase 7 — Finalization and Defense Preparation

## Otomatik Üretilen Yardımcı Dokümanlar

Tez metni tamamlandıktan sonra:

1. **KARSI_ARGUMANLAR.md** — Tez argümanlarının zayıf noktaları + savunma stratejileri → şablon: [[tpl-karsi-argumanlar]]
2. **SAVUNMA_SUNUM_TASLAGI.md** — Sunum slayt taslağı (15-20 slayt)
3. **SAVUNMA_SORULARI.md** — Olası jüri soruları + örnek yanıtlar → şablon: [[tpl-savunma-sorulari]]
4. **YONETICI_OZETI.md** — 1 sayfalık yönetici özeti (150-300 kelime)

## Tez Geneli Tutarlılık Kontrolü

[[quality-control]] düğümündeki tez geneli kontrol listesini çalıştır. Üretilen dosya: `TUTARLILIK_KONTROLU.md`

Kritik kontroller:
- Araştırma soruları sonuçta cevaplanmış mı?
- Kaynakça ↔ dipnotlar senkronize mi?
- `[KAYNAK BEKLENİYOR]` etiketi kalmadı mı?

## Kaynakça

Tüm dipnotlardan otomatik kaynakça oluşturulur, seçilen atıf sistemine göre formatlanır ([[MOC-citations]] rehber). Mevzuat ve mahkeme kararları kaynakçaya dahil edilmez (disipline göre değişir — [[hukuk]] modülüne bak).

## Özet ve Abstract

- Tez dilinde özet (150-300 kelime)
- İkinci dilde abstract
- 5-7 anahtar kelime (her iki dilde)

## Word/LaTeX Dışa Aktarım

Markdown → Word veya LaTeX dönüşümü için `scripts/export.sh` kullan (pandoc tabanlı).

## Son Kontroller

- İntihal taraması hatırlatması (Turnitin / iThenticate)
- Sayfa düzeni kontrolü (üniversite formatı YAML şablonuyla karşılaştır)
- Üniversite tez yazım kılavuzuyla uyum kontrolü

## Danışman Kontrol Noktası

"Tam taslağı danışmanınıza gönderin. Son düzeltmeleri DERSLER.md'ye kaydedin."
