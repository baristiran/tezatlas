---
title: "Quality Control — Section and Thesis-Wide Checklists"
title_tr: "Kalite Kontrol — Bölüm ve Tez Geneli Kontrol Listeleri"
node_type: foundation
description: "Two checklists: per-section quality check (run after every written section) and thesis-wide consistency check (run in Phase 7 before finalization)."
description_tr: "İki kontrol listesi: her yazılı bölüm sonrası çalıştırılan bölüm kalite kontrolü ve Faz 7'de bitirilmeden önce çalıştırılan tez geneli tutarlılık kontrolü."
tags: [quality-control, checklist, verification, foundation, always-active]
links_to:
  - skills/core/source-policy.md
  - skills/core/context-management.md
  - skills/phases/phase-6-writing.md
  - skills/phases/phase-7-finalization.md
used_by:
  - skills/moc/MOC-core.md
  - skills/phases/phase-6-writing.md
  - skills/phases/phase-7-finalization.md
language: bilingual
version: "2.0"
---

# Kalite Kontrol / Quality Control

## Her Bölüm Sonrası Kontrol Listesi

Her alt bölüm yazıldıktan sonra çalıştır. Geçemeyen madde varsa tamamlandı deme.

- [ ] Her paragrafta en az 1 kaynaklı atıf var mı?
- [ ] Tüm atıflar `/kaynaklar/` klasöründeki PDF'lerden mi?
- [ ] Doğrudan alıntılar tırnak içinde ve sayfa numaralı mı?
- [ ] Parafrazlar orijinalden yeterince farklı mı?
- [ ] Orijinallik oranı %50+ mı?
- [ ] Terminoloji `TERMINOLOJI.md` ile tutarlı mı?
- [ ] Akademik dil tutarlı mı?
- [ ] Tez dilinin karakter kuralları doğru mu? (Türkçe: ş/ç/ğ/ı/ö/ü)
- [ ] Mevcut içerik kaybolmamış mı?
- [ ] Paragraf yapısı doğru mu? (konu → argüman → kaynak → geçiş)
- [ ] Önceki bölümle geçiş doğal mı?

## Tez Geneli Tutarlılık Kontrolü (Faz 7)

Faz 7'de, tüm bölümler yazıldıktan sonra çalıştır. [[phase-7-finalization]] bu kontrolü tetikler.

- [ ] Girişteki araştırma soruları sonuçta cevaplanmış mı?
- [ ] "Bölüm X'te ele alınacak" ifadeler gerçekten ele alınmış mı?
- [ ] Çapraz referanslar doğru mu?
- [ ] Tablo/şekil numaraları ardışık mı?
- [ ] Dipnotlarda "a.g.e." / "Ibid." — bir önceki dipnot gerçekten aynı kaynak mı?
- [ ] Terminoloji baştan sona tutarlı mı? (`TERMINOLOJI.md` ile karşılaştır)
- [ ] Kaynakçadaki her eser en az 1 dipnotta geçiyor mu?
- [ ] Dipnotlardaki her eser kaynakçada var mı?
- [ ] Kısaltmalar ilk kullanımda açıklanmış mı?
- [ ] `[KAYNAK BEKLENİYOR]` etiketi kalmadı mı?

Bütünlük kontrolü için `TUTARLILIK_KONTROLU.md` dosyası oluşturulur — şablonu [[tpl-durum-ozeti]]'nin varyantı olarak kullan.
