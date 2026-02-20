---
title: "Phase 7 — Finalization and Defense Preparation"
title_tr: "Faz 7 — Bitiriş ve Savunma Hazırlığı"
node_type: phase
phase_number: 7
phase_gate_in: "phase-6-writing.md"
phase_gate_out: null
description: "After thesis text is complete: generate defense documents via interactive Q&A, run thesis-wide consistency check, compile bibliography, produce abstract, and prepare for Turnitin/Word export."
description_tr: "Tez metni tamamlandıktan sonra: soru-cevap tabanlı savunma dokümanları üret, tez geneli tutarlılık kontrolünü çalıştır, kaynakçayı derle, özet üret, Turnitin/Word dışa aktarımına hazırlan."
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
used_by:
  - skills/moc/MOC-phases.md
  - skills/phases/phase-6-writing.md
language: bilingual
version: "2.2"
---

# Faz 7 — Bitiriş ve Savunma Hazırlığı / Phase 7 — Finalization and Defense Preparation

## Bu Fazda Yüklenecek Node'lar

Bu fazı uygulamadan ÖNCE şu dosyaları oku:

- `skills/core/quality-control.md` — tez geneli tutarlılık kontrol listesini öğren
- `skills/moc/MOC-citations.md` — kaynakça formatı için atıf rehberini yükle

---

## 1. Tez Geneli Tutarlılık Kontrolü

`quality-control.md` içindeki tez geneli kontrol listesini çalıştır. Çıktı: `TUTARLILIK_KONTROLU.md`

Kritik kontroller:
- Araştırma soruları sonuçta cevaplanmış mı?
- Kaynakça ↔ dipnotlar senkronize mi?
- `[KAYNAK BEKLENİYOR]` etiketi kalmadı mı?

---

## 2. KARSI_ARGUMANLAR.md — Soru-Cevap ile Üret

Şablon dosyası yoktur. Aşağıdaki soruları kullanıcıya sor, cevaplardan KARSI_ARGUMANLAR.md dosyasını üret.

**Soru akışı:**

```
1. "Tezinizin kaç ana argümanı var? Her birini kısaca listeler misiniz?"

2. [Her argüman için tekrarla:]
   "Bu argümana karşı jüri ne itiraz edebilir? En güçlü karşı argümanı yazın."
   "Bu itiraza yanıt verebileceğiniz bir kaynağınız var mı? (Yazar, yıl, sayfa)"
   "Bu argümanın risk düzeyini nasıl değerlendirirsiniz? (Yüksek / Orta / Düşük)"

3. "Metodolojinizle ilgili beklediğiniz itirazlar var mı? (örneklem büyüklüğü, geçerlilik vb.)"

4. "Literatürde atlamış olabileceğiniz önemli bir kaynak veya akım var mı?"
```

**Üretilen dosya yapısı:**
```markdown
# Karşı Argüman Analizi
> Tarih: [tarih] | Tez: [başlık]

## Argüman 1: [kullanıcının verdiği özet]
**Tezdeki yer:** [kullanıcıdan]
**Olası itiraz:** [kullanıcıdan]
**Çürütme:** [kullanıcının kaynağından türetilir]
**Risk:** 🔴 Yüksek / 🟡 Orta / 🟢 Düşük

[argüman sayısı kadar tekrar]

## Metodoloji İtirazları
[kullanıcının cevabından]

## Literatür Kontrolü
[kullanıcının cevabından]
```

---

## 3. SAVUNMA_SORULARI.md — Soru-Cevap ile Üret

Şablon dosyası yoktur. Aşağıdaki soruları kullanıcıya sor, cevaplardan SAVUNMA_SORULARI.md dosyasını üret.

**Soru akışı:**

```
1. "Jürinin soracağını düşündüğünüz en zor soruyu yazın."
   "Bu soruya model yanıtınız nedir?"

2. "Metodolojinizle ilgili beklediğiniz bir itiraz var mı?"
   "Buna nasıl yanıt verirsiniz?"

3. "En özgün katkınızı tek cümleyle nasıl açıklarsınız?"

4. "Tezinizin en önemli sınırlılığı nedir?"
   "Bu sınırlılık neden kaçınılmazdı?"

5. "Bu tezden sonra hangi araştırmalar yapılabilir? (2-3 öneri)"
```

**Üretilen dosya yapısı:**
```markdown
# Savunma Soruları ve Model Yanıtlar
> Tarih: [tarih] | Danışman: [danışman]

## En Zor Soru
**Soru:** [kullanıcıdan]
**Yanıt:** [kullanıcıdan]

## Metodoloji İtirazı
**Soru:** [kullanıcıdan]
**Yanıt:** [kullanıcıdan]

## Özgün Katkı (Ezbere hazır cevap)
[kullanıcıdan — kısa ve net]

## Sınırlılıklar
**Soru:** "En önemli sınırlılığınız nedir?"
**Yanıt:** [kullanıcıdan]

## Gelecek Araştırma
[kullanıcının 2-3 önerisi]
```

---

## 4. SAVUNMA_SUNUM_TASLAGI.md — Otomatik Üret

Kullanıcıya soru sormadan, tezprotokol.md ve tez bölümlerinden türet:

```
Slayt 1: Kapak — Başlık, öğrenci, danışman, tarih
Slayt 2: İçindekiler
Slayt 3-4: Araştırma soruları ve motivasyon
Slayt 5-6: Metodoloji
Slayt 7-12: Bulgular (bölüm başına 1-2 slayt)
Slayt 13: Özgün katkı
Slayt 14: Sınırlılıklar ve gelecek araştırma
Slayt 15: Teşekkür + Sorular
```

---

## 5. YONETICI_OZETI.md — Otomatik Üret

Tez metninden 150-300 kelimelik yönetici özeti türet:
- Araştırma sorusu
- Yöntem (1 cümle)
- Ana bulgular (2-3 madde)
- Özgün katkı (1 cümle)
- Pratik çıkarım (1 cümle)

---

## 6. Kaynakça

Tüm dipnotlardan otomatik kaynakça oluşturulur, tezprotokol.md'deki atıf sistemine göre formatlanır (`MOC-citations.md` rehber). Mevzuat ve mahkeme kararları kaynakçaya dahil edilmez (disipline göre değişir — `hukuk` modülüne bak).

---

## 7. Özet / Abstract

- Tez dilinde özet (150-300 kelime)
- İkinci dilde abstract
- 5-7 anahtar kelime (her iki dilde)

---

## 8. Word/LaTeX Dışa Aktarım

Markdown → Word veya LaTeX dönüşümü için `scripts/export.sh` kullan (pandoc tabanlı).

---

## 9. Son Kontroller

- İntihal taraması hatırlatması (Turnitin / iThenticate)
- Sayfa düzeni kontrolü (üniversite formatı YAML şablonuyla karşılaştır)
- Üniversite tez yazım kılavuzuyla uyum kontrolü

---

## Danışman Kontrol Noktası

"Tam taslağı danışmanınıza gönderin. Son düzeltmeleri DERSLER.md'ye kaydedin."
