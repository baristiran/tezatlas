---
title: "Source Policy — Web vs Local by Phase"
title_tr: "Kaynak Politikası — Faza Göre Web / Yerel"
node_type: foundation
description: "Defines when web access is permitted (discovery in Phases 1-2 only) and when only local /kaynaklar/ PDFs may be cited (Phases 6-7). Also covers plagiarism prevention rules."
description_tr: "Web erişiminin ne zaman geçerli olduğunu (sadece Faz 1-2'de keşif) ve sadece yerel /kaynaklar/ PDF'lerinin atıflanabileceği zamanları (Faz 6-7) tanımlar. İntihal önleme kurallarını da içerir."
tags: [source-policy, web-access, local-sources, plagiarism, foundation, always-active]
links_to:
  - skills/core/iron-rules.md
  - skills/tooling/annas-archive.md
  - skills/techniques/source-hunting.md
used_by:
  - skills/moc/MOC-core.md
  - skills/phases/phase-1-topic.md
  - skills/phases/phase-2-sources.md
  - skills/phases/phase-6-writing.md
language: bilingual
version: "2.0"
---

# Kaynak Politikası / Source Policy

## Temel Kural: Yazımda Sadece Yerel Kaynaklar

Tez yazımında (Faz 6) yalnızca `/kaynaklar/` klasöründe fiziksel olarak mevcut olan PDF dosyaları kaynak olarak kullanılabilir.

**YASAKLAR:**
- Web araştırmasından doğrudan atıf yapmak YASAKTIR
- Hafızadan kaynak uydurmak YASAKTIR (bkz. [[iron-rules]] Kural 4)
- Kaynaklar klasöründe olmayan bir esere dipnot düşmek YASAKTIR
- Sayfa numarası tahmin etmek YASAKTIR

**İSTİSNALAR:**
- Faz 1-2'de alan taraması için web kullanılabilir (ama atıf yapılmaz)
- Mevzuat metinleri resmi gazete referansıyla atıflanabilir
- Mahkeme kararları resmi veritabanlarından atıflanabilir

## Faza Göre Web Kullanım Matrisi

| Faz | Web Kullanımı | Atıf Yapılır mı? |
|-----|:---:|:---:|
| Faz 0 (Kimlik) | Hayır | Hayır |
| Faz 1 (Konu keşfi) | **Evet** — alan taraması | **Hayır** |
| Faz 2 (Kaynak avı) | **Evet** — kaynak bulma | **Hayır** — sadece indirme |
| Faz 3 (Okuma) | Kaynak indirme için | **Hayır** |
| Faz 4 (Yapı) | Hayır | Hayır |
| Faz 5 (Protokol) | Hayır | Hayır |
| Faz 6 (Yazım) | **Hayır** | **Evet — sadece /kaynaklar/ PDF'lerinden** |
| Faz 7 (Bitiriş) | Hayır | Mevcut dipnotlar |

## İntihal Önleme Kuralları

**Doğrudan alıntı:**
- Kısa alıntı: tırnak içinde ("...")
- Uzun alıntı (3-5+ satır, disipline göre): blok alıntı, girintili
- Her alıntıda sayfa numarası zorunlu
- Doğrudan alıntı oranı paragraf başına max %20

**Parafraz:**
- Kaynak metninden farklı cümle yapısı
- Orijinalin yalnızca fikri alınır
- Parafraz sonrası dipnot zorunlu

**Her paragrafta orijinallik oranı:**
- Min %50: yazarın kendi analizi, yorumu, sentezi
- Max %30: parafraze edilmiş kaynak bilgisi
- Max %20: doğrudan alıntı

## Birincil vs İkincil Kaynak

Mümkün olduğunca birincil kaynak tercih edilir:
- **Birincil:** Orijinal eser (Bodin'in kendi kitabı)
- **İkincil:** O eser hakkında yazılmış analiz

Birincil bulunamıyorsa şeffaf olunur:
```
"Bodin'in ifadesiyle (Smith, 2020: 45'ten aktaran)..."
```

Kaynak bulamıyorsan [[annas-archive]] ve [[source-hunting]] düğümlerine bak.
