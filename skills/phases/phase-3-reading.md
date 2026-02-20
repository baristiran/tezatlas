---
title: "Phase 3 — Reading and Snowball Discovery"
title_tr: "Faz 3 — Okuma ve Kartopu Keşif"
node_type: phase
phase_number: 3
phase_gate_in: "phase-2-sources.md"
phase_gate_out: "phase-4-structure.md"
description: "A cyclic reading loop combining systematic source reading, page-numbered note-taking, and snowball discovery of new sources via footnote-following. This phase is a LOOP until saturation is detected."
description_tr: "Sistematik kaynak okuma, sayfa numaralı not alma ve dipnot takibiyle yeni kaynak keşfini birleştiren döngüsel okuma sürecidir. Bu faz, doygunluk algılanana kadar süren bir DÖNGÜDÜR."
tags: [phase, reading, snowball-sampling, saturation, note-taking, cyclic, loop]
outputs:
  - "_notlar.md dosyaları (bölüm/kaynak gruplarına göre)"
  - OKUMA_RAPORU.md
  - "Güncellenmiş KAYNAK_ENVANTERI.md"
links_to:
  - skills/techniques/snowball-sampling.md
  - skills/techniques/pdf-reading.md
  - skills/techniques/saturation-check.md
  - skills/core/iron-rules.md
  - skills/core/source-policy.md
  - skills/templates/tpl-notlar.md
  - skills/tooling/annas-archive.md
used_by:
  - skills/moc/MOC-phases.md
  - skills/phases/phase-2-sources.md
  - skills/phases/phase-4-structure.md
language: bilingual
version: "2.0"
---

# Faz 3 — Okuma ve Kartopu Keşif / Phase 3 — Reading and Snowball Discovery

## Amaç

Bu faz bir **DÖNGÜDÜR**, doğrusal değildir. Kaynakları sistematik oku, sayfa numaralı not al, her kaynağın dipnotlarından yeni kaynaklar keşfet. Doygunluk algılanana kadar devam et.

Giriş koşulu: [[phase-2-sources]] tamamlanmış ve minimum kaynak sayısı karşılanmış olmalıdır.

## Okuma Döngüsü

```
Kaynak kuyruğundan bir PDF seç
  ↓
[[pdf-reading]] protokolüyle ön kontrol (metin tabanlı mı? OCR gerekli mi?)
  ↓
Kaynak oku → sayfa numaralı notlar çıkar → [[tpl-notlar]] formatında _notlar.md'ye yaz
  ↓
[[snowball-sampling]] algoritmasi: dipnotları tara → yeni kaynaklar keşfet
  ↓
Okuma raporunu güncelle
  ↓
Her 5 kaynakta bir [[saturation-check]] çalıştır
  ↓
├─ Doygunluk YOK → döngüye devam
└─ Doygunluk VAR → [[phase-4-structure]]'a geç
```

## Kaynak Kalite Hiyerarşisi

[[source-policy]] düğümü tam kalite hiyerarşisini içerir. Özet:
- Hakemli dergi makalesi > Akademik kitap > Resmi kurumsal rapor > Çalışma kağıdı > Tez > Blog

Bir bölümde yalnızca düşük kalite kaynak varsa uyar: "Bu bölüm için hakemli makale eklenmeli."

## Kaynak Çeşitlilik Metrikleri

`KAYNAK_ENVANTERI.md`'de izle:
```
Dil dağılımı: TR %X / EN %X / Diğer %X
Tarih dağılımı: Klasik (pre-2000) %X / 2000-2020 %X / 2020+ %X
Tür dağılımı: Kitap %X / Makale %X / Rapor %X / Diğer %X
Yazar yoğunluğu: En çok atıf yapılan 3 yazar → Uyarı: tek yazara aşırı bağımlılık
```

## Birincil vs İkincil Kaynak

Mümkün olduğunca birincil kaynak (orijinal eser) tercih et. Birincil bulunamazsa şeffaf ol:
```
"Bodin'in ifadesiyle (Smith, 2020: 45'ten aktaran)..."
```

## Çıktılar

- `_notlar.md` dosyaları — şablon: [[tpl-notlar]]
- `OKUMA_RAPORU.md` — doygunluk metrikleri
- Güncellenmiş `KAYNAK_ENVANTERI.md`

## Danışman Kontrol Noktası

"Okuduğunuz kaynakları ve temel bulgularınızı danışmanınızla paylaştınız mı?"
