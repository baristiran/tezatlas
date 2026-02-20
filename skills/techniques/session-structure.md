---
title: "Session Structure — Start and End Rituals"
title_tr: "Oturum Yapısı — Başlangıç ve Bitiş Ritüelleri"
node_type: technique
description: "The standardized start-of-session (read 6 files, determine target section) and end-of-session (update 4-5 files, git commit) rituals for Phase 6 writing sessions."
description_tr: "Faz 6 yazım oturumları için standart oturum başlangıcı (6 dosya oku, hedef bölümü belirle) ve bitiş (4-5 dosyayı güncelle, git commit) ritüelleri."
tags: [session-structure, ritual, context-management, git, phase-6]
links_to:
  - skills/core/context-management.md
  - skills/tooling/git-workflow.md
  - skills/templates/tpl-durum-ozeti.md
used_by:
  - skills/phases/phase-6-writing.md
  - skills/core/context-management.md
language: bilingual
version: "2.0"
---

# Oturum Yapısı / Session Structure

## OTURUM BAŞI

```
╔═══════════════════════════════════════════════════╗
║  1. tezprotokol.md oku (projenin anayasası)       ║
║  2. MEMORY.md kontrol et (ilerleme durumu)        ║
║  3. DERSLER.md oku (öğrenilen dersler)            ║
║  4. TERMINOLOJI.md oku (terim tutarlılığı)        ║
║  5. Hedef bölümü belirle                          ║
║  6. KAYNAK_HARITASI.md'den ilgili kaynakları al   ║
╚═══════════════════════════════════════════════════╝
```

## OTURUM SONU

```
╔═══════════════════════════════════════════════════╗
║  1. Bölüm dosyasını kaydet                        ║
║  2. MEMORY.md güncelle                            ║
║     → tamamlanan bölümler, son dipnot, kelime     ║
║  3. DURUM_OZETI.md güncelle                       ║
║     → ne yapıldı, ne bekliyor, sonraki adım       ║
║  4. TERMINOLOJI.md güncelle (varsa yeni terimler) ║
║  5. DERSLER.md güncelle (varsa yeni dersler)      ║
║  6. git commit                                    ║
╚═══════════════════════════════════════════════════╝
```

## Oturum Sınırı Kararları

[[context-management]] oturum sınırı tablosuna bak:

| Durum | Eylem |
|-------|-------|
| Alt bölüm tamamlandı | Kaydet → güncelle → yeni oturum |
| Alt bölüm yarım kaldı | `[DEVAM EDECEK]` etiketi → kaydet |
| Context doluyor | Paragrafta dur → kaydet → yeni oturum |

## MEMORY.md Güncelleme Formatı

```markdown
## Son Güncelleme: [tarih]
- Tamamlanan bölümler: [X/Y]
- Devam eden: [bölüm adı] - [durum]
- Toplam kelime: [X]
- Son dipnot: #[X]
- Sonraki adım: [tam olarak ne yapılacak]
```

## DURUM_OZETI.md Güncelleme

Şablon: [[tpl-durum-ozeti]] — her oturum sonunda bu şablon doldurulur.

Git commit stratejisi için [[git-workflow]] düğümüne bak.
