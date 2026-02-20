---
title: "What Is TezAtlas?"
title_tr: "TezAtlas Nedir?"
node_type: foundation
description: "System overview: TezAtlas guides students through 8 phases from topic selection to defense. Explains the real-student model — structure emerges from reading, not before it."
description_tr: "Sistem özeti: TezAtlas öğrencileri konu seçiminden savunmaya kadar 8 fazda yönlendirir. Gerçek öğrenci modelini açıklar — yapı okumadan ÇIKAR, okumadan önce uydurulmaz."
tags: [overview, real-student-model, phases, foundation]
links_to:
  - skills/moc/MOC-phases.md
  - skills/core/iron-rules.md
used_by:
  - skills/moc/MOC-core.md
language: bilingual
version: "2.0"
---

# TezAtlas Nedir? / What Is TezAtlas?

TezAtlas, gerçek bir tez öğrencisinin geçtiği tüm aşamaları taklit eden, yapay zeka destekli akademik tez yazım çerçevesidir. Skill graph mimarisini kullanan TezAtlas, agent'ın sadece gerekli node'ları yüklemesiyle çalışır.

TezAtlas is an AI-assisted academic thesis writing framework that mirrors the authentic stages a real thesis student goes through. Using a skill graph architecture, TezAtlas loads only the nodes the agent needs for the current task.

## Ne Yapar / What It Does

- Öğrenciyi 8 fazda yönlendirir: kimlik → konu → kaynak → okuma → yapı → protokol → yazım → bitiriş
- Kaynak bulma, indirme, okuma, not alma ve yazım süreçlerini yapılandırır
- Kartopu örnekleme ile kaynak ağacını organik olarak büyütür
- Context/hafıza sorununu dosya tabanlı bilgi aktarımıyla çözer
- Projeye özgü yazım protokolü otomatik üretir
- Yardımcı dokümanları (karşı argümanlar, savunma soruları, kaynakça) otomatik oluşturur

## Ne Yapmaz / What It Does NOT Do

- Öğrencinin yerine düşünmez — argümanları öğrenci anlamalı ve savunabilmelidir
- Kaynak uydurmaz — sadece fiziksel olarak mevcut PDF'lerden atıf yapar
- Kaynaksız yazmaz — kaynak yoksa yazıma geçmez, önce kaynağı bulur
- Danışmanın yerine geçmez — danışman kontrol noktaları zorunludur

## Gerçek Öğrenci Modeli / Real Student Model

TezAtlas, gerçek bir tez öğrencisinin doğal sürecini taklit eder:

```
Gerçek öğrenci:                        TezAtlas karşılığı:
1. Konu seçer                          → Faz 0-1
2. Birkaç temel kitap bulur            → Faz 2
3. Okumaya başlar                      → Faz 3
4. Okurken dipnotlardaki kaynaklara    → Faz 3 (kartopu örnekleme)
   ulaşır, onları da okur
5. Yeterince okuyunca yapı kafasında   → Faz 4 (yapı okumadan ÇIKAR)
   oluşmaya başlar
6. Yazmaya başlar (ama okumaya da      → Faz 6 (yazım + kaynak keşif döngüsü)
   devam eder)
7. Danışmanla paylaşır, düzeltir       → Danışman kontrol noktaları
8. Savunmaya hazırlanır                → Faz 7
```

**Desteklenen tez türleri:** Yüksek Lisans (YL) ve Doktora (DR)
**Desteklenen disiplinler:** Hukuk, sosyal bilimler, mühendislik, fen bilimleri, tıp, işletme, eğitim, beşeri bilimler
**Desteklenen diller:** Türkçe, İngilizce, Almanca ve diğerleri

Fazların tam detayı için [[MOC-phases]] düğümüne git.
