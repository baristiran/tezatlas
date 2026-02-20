---
title: "Snowball Sampling — Source Discovery Loop"
title_tr: "Kartopu Örnekleme — Kaynak Keşif Döngüsü"
node_type: technique
description: "Algorithm for following footnotes and references inside source PDFs to discover unknown but academically critical works. Applies four selectivity filters to prevent scope creep."
description_tr: "Kaynak PDF'lerindeki dipnot ve referansları takip ederek bilinmeyen ama akademik açıdan kritik eserleri keşfetme algoritması. Kapsam kaymasını önlemek için 4 seçicilik filtresi uygular."
tags: [snowball-sampling, source-discovery, footnotes, bibliography-chaining, iterative, kartopu]
links_to:
  - skills/tooling/annas-archive.md
  - skills/core/iron-rules.md
  - skills/techniques/source-hunting.md
  - skills/techniques/saturation-check.md
used_by:
  - skills/phases/phase-2-sources.md
  - skills/phases/phase-3-reading.md
  - skills/phases/phase-6-writing.md
language: bilingual
version: "2.0"
---

# Kartopu Örnekleme / Snowball Sampling

## Algoritma

AI bir PDF okurken bir dipnot referansı gördüğünde şu algoritmayı çalıştırır:

```
Dipnotta kaynak X'e atıf var
  ↓
Seçicilik filtrelerini uygula (aşağıda) → geçti mi?
  ├─ HAYIR → atla, okumaya devam et
  └─ EVET →
       /kaynaklar/'da X var mı?
         ├─ EVET → okuma kuyruğuna ekle
         └─ HAYIR → [[annas-archive]] ile indir
              ├─ Başarılı → /kaynaklar/'a kaydet → kuyruğa ekle
              └─ Başarısız → kullanıcıya bildir:
                   "Kaynak X gerekli.
                    Link: [link].
                    Lütfen indirip /kaynaklar/'a ekleyin."
```

Örnek tetikleyici:
```
AI, Huber (2023) s.45'te okuyor:
  "As Knapp (1905) demonstrated in his Staatliche Theorie..."
→ Kontrol: Knapp_1905 /kaynaklar/'da var mı?
```

## Seçicilik Filtreleri

Her referans otomatik takip edilmez. Aşağıdaki 4 filtreden **en az biri** karşılanmalıdır:

1. Tez konusuyla doğrudan ilgili mi?
2. Birden fazla kaynakta atıf görüldü mü? *(Sık atıf = kritik eser)*
3. Alanın klasik veya temel eseri mi?
4. Metodolojik olarak kritik mi?

Bu filtrelerin hiçbirini karşılamayan referanslar not edilebilir ama takip edilmez.

## Kaynak Kaydı

Keşfedilen her yeni kaynak `_notlar.md`'ye ve `KAYNAK_ENVANTERI.md`'ye eklenir:
```markdown
### Keşfedilen yeni referanslar (KARTOPU)
- s.45: Knapp (1905) Staatliche Theorie → /kaynaklar/'da YOK → İNDİRİLECEK
- s.67: Menger (1892) → /kaynaklar/'da VAR → okuma kuyruğuna eklendi
```

## Doygunluk Uyarısı

Kartopu örnekleme yön değiştirebilir: her yeni kaynak kendi dipnotlarını taşır. [[saturation-check]] algoritması ne zaman durulacağını sinyaller — doygunluk yoksa döngü devam eder.
