---
title: "Git Workflow — Version Control Strategy"
title_tr: "Git İş Akışı — Versiyon Kontrol Stratejisi"
node_type: tooling
description: "Git commit strategy for thesis projects. Why version control is mandatory, commit message conventions, and optional branch strategy."
description_tr: "Tez projeleri için git commit stratejisi. Versiyon kontrolü neden zorunlu, commit mesaj kuralları ve isteğe bağlı branch stratejisi."
tags: [tooling, git, version-control, commit-strategy, phase-5, phase-6]
links_to:
  - skills/phases/phase-5-protocol.md
  - skills/techniques/session-structure.md
used_by:
  - skills/phases/phase-5-protocol.md
  - skills/techniques/session-structure.md
language: bilingual
version: "2.0"
---

# Git İş Akışı / Git Workflow

## Neden Zorunlu

Tez yazımında "geri alma" ihtiyacı sık olur. Danışman "eski hali daha iyiydi" diyebilir. Git olmadan bu imkansızdır.

## Commit Stratejisi

```bash
# Her oturum sonunda (session-structure ritüelinin parçası)
git add .
git commit -m "Oturum [X]: [dosya adı] [durum] — [X] kelime, [X] dipnot"

# Danışman geri bildirimi sonrası
git commit -m "Danışman FB: [açıklama]"

# Yapı değişikliği sonrası
git commit -m "Yapı değişikliği: [açıklama]"

# Faz tamamlanınca
git commit -m "Faz [X] tamamlandı: [özet]"
```

## Proje Başlatma (Faz 5)

```bash
git init
git add .
git commit -m "TezAtlas: Proje kurulumu tamamlandı — Faz 0-5"
```

## Branch Stratejisi (İsteğe Bağlı)

```
main        → onaylanmış metin (danışman gördü)
draft       → çalışma dalı (aktif yazım)
experiment  → deneysel değişiklikler (danışman onayı bekleyen)
```

Branch kullanmak istemeyenler için: tek `main` branch, her oturum commit, gerektiğinde `git log` ile geçmişe dön.
