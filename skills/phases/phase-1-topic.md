---
title: "Phase 1 — Topic Discovery and Title"
title_tr: "Faz 1 — Konu Keşfi ve Başlık"
node_type: phase
phase_number: 1
phase_gate_in: "phase-0-identity.md"
phase_gate_out: "phase-2-sources.md"
description: "Convert the student's natural-language topic description into an academic thesis title. Extract 10-15 key concepts and formulate 3-5 research questions. Web access permitted for field survey ONLY — no citations yet."
description_tr: "Öğrencinin doğal dille anlattığı konuyu akademik tez başlığına dönüştür. 10-15 anahtar kavram çıkar ve 3-5 araştırma sorusu formüle et. Alan taraması için web kullanımına izin var — henüz atıf yapılmaz."
tags: [phase, topic, title, research-questions, field-survey, web-allowed]
outputs:
  - konu_kesfi.md
links_to:
  - skills/core/source-policy.md
  - skills/templates/tpl-konu-kesfi.md
  - skills/core/academic-integrity.md
used_by:
  - skills/moc/MOC-phases.md
  - skills/phases/phase-0-identity.md
  - skills/phases/phase-2-sources.md
language: bilingual
version: "2.0"
---

# Faz 1 — Konu Keşfi ve Başlık / Phase 1 — Topic Discovery and Title

## Amaç

Öğrencinin doğal dille anlattığı konuyu akademik tez başlığına dönüştürmek, anahtar kavramları belirlemek ve araştırma sorularını formüle etmek.

**ÖNEMLİ:** Bu fazda web kullanılır ama **atıf yapılmaz**. [[source-policy]] Faz 1 sütununa bak: "Web Evet — Atıf Hayır."

## Süreç

**Adım 1 — Doğal Dil Girişi**
Öğrenci konuyu kendi kelimeleriyle anlatır. Örnek:
> "Yapay zekanın iş hukukuna etkisini çalışmak istiyorum, özellikle işçi gözetimi ve algoritmik yönetim ilgimi çekiyor."

**Adım 2 — Alan Taraması (Web)**
AI web araştırması yaparak alanı tarar:
- Bu konuda yapılmış mevcut çalışmalar
- Akademik tartışmanın odak noktaları
- Tespit edilmiş boşluklar (gap)
- Güncel gelişmeler

**Adım 3 — Başlık Önerileri**
AI 5 başlık önerir (tez dilinde + İngilizce):
1. Genel kapsamlı başlık
2. Daraltılmış, spesifik başlık
3. Karşılaştırmalı yaklaşım başlığı
4. Model/öneri odaklı başlık
5. Eleştirel yaklaşım başlığı

Öğrenci seçer, modifiye eder veya yeni öneri ister.

**Adım 4 — Anahtar Kavramlar**
Seçilen başlığa göre 10-15 anahtar kavram çıkarılır (tez dilinde + İngilizce karşılıkları).

**Adım 5 — Araştırma Soruları**
3-5 araştırma sorusu formüle edilir. İyi araştırma sorusu:
- Evet/hayır ile cevaplanmaz
- Spesifiktir ama aşırı dar değil
- Araştırılabilir
- Tez kapsamına sığar (YL: 3-5 soru, DR: 5-7 soru)

## Çıktı

`konu_kesfi.md` oluşturulur — şablon: [[tpl-konu-kesfi]]

## Danışman Kontrol Noktası

"Bu başlığı ve araştırma sorularını danışmanınızla paylaştınız mı? Onay aldınız mı?"
