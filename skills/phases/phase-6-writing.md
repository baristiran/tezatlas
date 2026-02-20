---
title: "Phase 6 — Read and Write"
title_tr: "Faz 6 — Oku ve Yaz"
node_type: phase
phase_number: 6
phase_gate_in: "phase-5-protocol.md"
phase_gate_out: "phase-7-finalization.md"
description: "Write thesis sections by reading sources, taking notes, and composing paragraph by paragraph. Three session types: reading-only, writing-only, or combined. Writing is BLOCKED if no source exists for a claim."
description_tr: "Kaynakları okuyarak, not alarak ve paragraf paragraf yazarak tez bölümlerini üret. Üç oturum türü: sadece okuma, sadece yazım veya kombine. İddia için kaynak yoksa yazım DURUR."
tags: [phase, writing, reading, session-structure, note-taking, source-blocked, loop]
outputs:
  - "Tez bölüm dosyaları (chapter_X_Y.md)"
  - "Güncellenmiş MEMORY.md ve DURUM_OZETI.md"
links_to:
  - skills/core/iron-rules.md
  - skills/core/source-policy.md
  - skills/core/quality-control.md
  - skills/techniques/snowball-sampling.md
  - skills/techniques/session-structure.md
  - skills/templates/tpl-notlar.md
  - skills/tooling/annas-archive.md
used_by:
  - skills/moc/MOC-phases.md
  - skills/phases/phase-5-protocol.md
  - skills/phases/phase-7-finalization.md
language: bilingual
version: "2.0"
---

# Faz 6 — Oku ve Yaz / Phase 6 — Read and Write

## Amaç

Kaynaklardan okuyarak, not alarak ve yazarak tez metnini bölüm bölüm üretmek.

## Oturum Yapısı

Tam oturum ritüeli [[session-structure]]'da. Özet:

**OTURUM BAŞI:** tezprotokol.md + MEMORY.md + DERSLER.md + TERMINOLOJI.md + ilgili `_notlar.md` oku → hedef bölümü belirle

**AŞAMA 1 — OKUMA:** En az 3 PDF oku → sayfa numaralı not → [[snowball-sampling]] döngüsü → `_notlar.md` güncelle → yazım planı yap

**AŞAMA 2 — YAZIM:** `_notlar.md`'ye bakarak paragraf paragraf yaz → her paragrafta doğrulanmış dipnot → terminoloji kontrolü → [[quality-control]] kontrol listesi

**OTURUM SONU:** Kaydet → MEMORY.md + DURUM_OZETI.md güncelle → TERMINOLOJI.md + DERSLER.md güncelle → git commit

## Üç Oturum Türü

**Okuma Oturumu** — PDF karmaşık veya uzunsa:
- Sadece PDF oku + `_notlar.md` yaz; yazıma geçilmez
- Context tamamen okumaya ayrılır

**Yazım Oturumu** — Notlar hazırsa:
- `_notlar.md` oku + tez metnini yaz; context tamamen yazıma ayrılır

**Tek Oturum** — Kısa bölümler için:
- Okuma + not + yazım aynı oturumda

## Yazım Sırasında Kaynak Keşfi

```
AI bir paragraf yazıyor → kaynak lazım → /kaynaklar/'da var mı?
  ├─ EVET → oku, sayfa bul, dipnot yaz, devam et
  └─ HAYIR → YAZIMI DURDUR
       → Kaynak bul ([[annas-archive]] veya kullanıcıya sor)
       → Kaynak gelene kadar O PARAGRAFI YAZMA
       → [KAYNAK BEKLENİYOR: konu, önerilen kaynak] etiketi koy
       → Başka paragraftan devam et
```

[[iron-rules]] Kural 1: Asla kaynaksız cümle yazılmaz. Kaynak yoksa paragraf bekler.

## Her Tez Dosyasının Başında Metadata

```markdown
<!-- TEZ DOSYASI METAVERİSİ
Bölüm: [X]
Alt Bölüm: [X.Y]
Dosya: [dosya yolu]
Başlık: [alt bölüm başlığı]
Durum: [TAMAMLANDI / DEVAM EDECEK / TASLAK]
Son dipnot no: [X]
Kelime sayısı: [X]
Son güncelleme: [tarih]
Önceki bölüm: [dosya adı]
Sonraki bölüm: [dosya adı]
-->
```

## Dipnot Kuralları

- Tez genelinde sürekli numaralama (1, 2, 3... son dipnota kadar)
- Her dipnot PDF'ten doğrulanmış sayfa numarası içerir
- Ardışık aynı kaynakta "a.g.e." / "Ibid." kullanılır
- Format seçilen atıf sistemine göre

## Danışman Kontrol Noktası

İlk 2-3 bölüm yazıldıktan sonra: "Bu bölümleri danışmanınıza gönderin. Geri bildirim DERSLER.md'ye kaydedilir."
