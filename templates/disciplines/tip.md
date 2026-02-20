---
title: "Discipline Module — Medicine"
title_tr: "Disiplin Modülü — Tıp"
node_type: discipline
discipline_id: tip
default_citation: vancouver
alternative_citations: ["apa7"]
description: "Discipline-specific rules for medical thesis writing: PRISMA, IMRAD structure, ethics board approval, meta-analysis, systematic review."
description_tr: "Tıp tezi yazımına özel kurallar: PRISMA, IMRAD yapısı, etik kurul onayı, meta-analiz, sistematik derleme."
tags: [discipline, medicine, tip, PRISMA, IMRAD, clinical]
links_to:
  - templates/citations/vancouver.md
used_by:
  - skills/moc/MOC-disciplines.md
  - skills/phases/phase-0-identity.md
language: bilingual
version: "2.0"
---

# Tıp ve Sağlık Bilimleri Disiplin Modülü

Bu modül; tıp, diş hekimliği, eczacılık, hemşirelik, fizik tedavi ve sağlık bilimleri alanlarında tez yazan öğrenciler için disipline özel kuralları içerir.

## Atıf Sistemi

- **Önerilen:** Vancouver (tıp bilimleri standardı)
- **Alternatif:** APA 7 (psikoloji/sağlık eğitimi)
- Vancouver formatı: Üst simge veya köşeli parantez numaralama
- Kaynakça: Metin içi geçiş sırasına göre numaralandırılır
- Dergi kısaltmaları: Index Medicus/MEDLINE standardına uygun

## Etik Gereksinimler (ZORUNLU)

- **Etik kurul onayı:** Karar numarası ve tarihi metinde belirtilmeli
- **Bilgilendirilmiş onam:** Hasta/katılımcı onam süreci açıklanmalı
- **Helsinki Bildirgesi'ne uygunluk** beyanı
- **Hayvan deneyleri:** İlgili etik kurul onayı + 3R prensibi (Replacement, Reduction, Refinement)
- **Çıkar çatışması beyanı**
- **Veri gizliliği:** Hasta bilgilerinin anonimleştirilmesi

## Metodoloji Gereksinimleri

### Klinik Araştırma
- Araştırma türü: randomize kontrollü, kohort, vaka-kontrol, kesitsel, vaka serisi
- CONSORT (RCT), STROBE (gözlemsel), PRISMA (sistematik derleme) kontrol listeleri
- Örneklem büyüklüğü güç analizi ile hesaplanmalı
- Dahil etme/dışlama kriterleri net tanımlanmalı
- İstatistiksel yöntemler gerekçelendirilmeli

### Temel Bilim Araştırması
- Deney protokolü detaylıca açıklanmalı (tekrarlanabilirlik)
- Kullanılan malzeme ve yöntemler: üretici, katalog numarası, lot numarası
- Pozitif ve negatif kontrol grupları tanımlanmalı
- Ölçüm yöntemleri ve cihaz kalibrasyonu belirtilmeli

### Sistematik Derleme / Meta-Analiz
- PROSPERO kaydı önerilir
- Arama stratejisi: veritabanları (PubMed, Cochrane, Scopus, Web of Science)
- Anahtar kelimeler ve MeSH terimleri listelenmelidir
- PRISMA akış diyagramı ZORUNLU
- Kalite değerlendirmesi: Cochrane Risk of Bias, Newcastle-Ottawa Scale
- Meta-analiz: Forest plot, heterojenilik (I², Q testi), yayın yanlılığı (funnel plot)

## Yazım Kuralları

### Dil ve Üslup
- Kısa, net, nesnel cümleler
- Pasif yapı: "uygulandı", "saptandı", "gözlemlendi"
- Tıbbi terminoloji Türkçe karşılıklarıyla birlikte verilmeli
- Kısaltmalar: İlk kullanımda tam hali yazılmalı

### Tablo ve Şekiller
- Demografik özellikler tablosu (Tablo 1) standart
- p değerleri tablolarda belirtilmeli
- Güven aralıkları (CI) raporlanmalı
- Akış diyagramları (CONSORT, PRISMA) kullanılmalı

## Kaynak Kalite Hiyerarşisi (Kanıta Dayalı Tıp Piramidi)

1. **Sistematik derleme / meta-analiz** (Cochrane Reviews)
2. **Randomize kontrollü çalışmalar (RCT)**
3. **Kohort çalışmaları**
4. **Vaka-kontrol çalışmaları**
5. **Vaka serileri / vaka raporları**
6. **Uzman görüşü / editöryel**
7. **Kılavuzlar (guidelines):** WHO, CDC, Sağlık Bakanlığı
8. **Ders kitapları:** Harrison's, Robbins, Guyton

## Tez Yapısı Önerileri

### Klinik/Deneysel Araştırma
```
GİRİŞ ve AMAÇ
GENEL BİLGİLER (Literatür)
GEREÇ ve YÖNTEM
BULGULAR
TARTIŞMA
SONUÇ ve ÖNERİLER
```

### Sistematik Derleme
```
GİRİŞ ve AMAÇ
GENEL BİLGİLER
GEREÇ ve YÖNTEM (Arama stratejisi, seçim kriterleri, kalite değerlendirmesi)
BULGULAR (PRISMA akış diyagramı, çalışma özellikleri, meta-analiz sonuçları)
TARTIŞMA
SONUÇ ve ÖNERİLER
```

## Sık Yapılan Hatalar

- Etik kurul bilgilerini eksik bırakmak
- Güç analizi yapmadan örneklem belirlemek
- İstatistiksel yöntemi gerekçelendirmemek
- p değerine aşırı odaklanıp etki büyüklüğünü ihmal etmek
- Sınırlılıkları yüzeysel tartışmak
- Güncel olmayan kaynaklara dayanmak (tıpta 5 yıldan eski kaynaklar dikkatle kullanılmalı)
- CONSORT/STROBE/PRISMA kontrol listelerini takip etmemek
