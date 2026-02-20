---
title: "Discipline Module — Natural Sciences"
title_tr: "Disiplin Modülü — Fen Bilimleri"
node_type: discipline
discipline_id: fen-bilimleri
default_citation: apa7
alternative_citations: ["ieee"]
description: "Discipline-specific rules for natural science thesis writing: hypothesis testing, statistical methods, laboratory protocols, IMRAD structure."
description_tr: "Fen bilimleri tezi yazımına özel kurallar: hipotez testi, istatistiksel yöntemler, laboratuvar protokolleri, IMRAD yapısı."
tags: [discipline, natural-sciences, fen-bilimleri, hypothesis, statistics]
links_to:
  - templates/citations/apa7.md
  - templates/citations/ieee.md
used_by:
  - skills/moc/MOC-disciplines.md
  - skills/phases/phase-0-identity.md
language: bilingual
version: "2.0"
---

# Fen Bilimleri Disiplin Modülü

Bu modül; fizik, kimya, biyoloji, matematik, istatistik ve ilgili doğa bilimleri alanlarında tez yazan öğrenciler için disipline özel kuralları içerir.

## Atıf Sistemi

- **Önerilen:** APA 7 veya IEEE (bölüme göre değişir)
- **Fizik/Matematik:** APS style veya IEEE
- **Kimya:** ACS (American Chemical Society) style veya APA 7
- **Biyoloji:** APA 7 veya Vancouver (tıp yakını alanlar)
- Kaynakça formatı bölümünüze göre danışmanınızla netleştirin

## Metodoloji Gereksinimleri

### Deneysel Çalışma (Laboratuvar)
- Deney protokolü DETAYLIDIR: başka bir araştırmacı tekrarlayabilmeli
- Kullanılan malzeme ve kimyasallar: üretici, saflık, katalog numarası
- Cihaz ve ekipman: model, kalibrasyon tarihi, ölçüm hassasiyeti
- Kontrol grubu ve değişkenler (bağımsız, bağımlı, kontrol altına alınan)
- Deney koşulları: sıcaklık, basınç, pH, konsantrasyon vb.
- Hata analizi: sistematik ve rastgele hata kaynakları
- İstatistiksel değerlendirme: standart sapma, güven aralığı, p değeri
- Tekrar sayısı (replicate) belirtilmeli

### Teorik / Matematiksel Çalışma
- Aksiyomlar ve varsayımlar açıkça belirtilmeli
- Teorem-ispat yapısı: Tanım → Önerme → İspat → Sonuç
- Matematiksel modelleme: varsayımlar, sınır koşulları, analitik çözüm
- Sayısal doğrulama: analitik sonuçlar ile numerik sonuçların karşılaştırması
- Özel durumlar ve limit kontrolleri yapılmalı
- Notasyon tutarlılığı: tüm semboller tanımlanmalı

### Hesaplamalı Çalışma
- Simülasyon yöntemi: Monte Carlo, moleküler dinamik, sonlu elemanlar, DFT vb.
- Yazılım ve versiyon: Gaussian, VASP, LAMMPS, COMSOL, MATLAB vb.
- Hesaplama parametreleri detaylıca verilmeli
- Yakınsama (convergence) testleri yapılmalı
- Doğrulama: bilinen sonuçlarla veya deneysel veriyle karşılaştırma
- Hesaplama kaynağı: CPU/GPU, çekirdek sayısı, süre (tekrarlanabilirlik)

### Saha Çalışması (Biyoloji / Ekoloji)
- Çalışma alanı: GPS koordinatları, habitat tanımı, iklim verileri
- Örnekleme yöntemi: rastgele, sistematik, tabakalı
- Tür teşhisi: kullanılan flora/fauna referansları
- Mevsimsel faktörler ve örnekleme zamanı
- Etik kurul onayı (hayvan deneyleri için ZORUNLU)
- Koruma statüsü ve izinler (endemik türler için)

### Sistematik Derleme / Meta-Analiz
- PRISMA protokolü takip edilmeli
- Arama stratejisi: veritabanları (PubMed, Scopus, Web of Science)
- Dahil etme/dışlama kriterleri net tanımlanmalı
- Kalite değerlendirmesi yapılmalı
- Heterojenlik analizi (I², Q testi)
- Yayın yanlılığı değerlendirmesi (funnel plot)

## Yazım Kuralları

### Dil ve Üslup
- Kısa, net, nesnel cümleler
- Pasif yapı tercih edilir: "ölçüldü", "gözlemlendi", "hesaplandı"
- Belirsizlikten kaçın: "yaklaşık 5 mL" değil, "5.0 ± 0.1 mL"
- Teknik terimler ilk kullanımda tanımlanmalı
- Kısaltmalar ilk kullanımda açılmalı
- **LaTeX** tercih edilir (özellikle matematik ve fizik tezlerinde)

### Birimler ve Standartlar
- SI birim sistemi ZORUNLU (istisnalar: astronomide parsek, kimyada kalori vb.)
- Birim sembolleri italik DEĞİL (m, kg, s, mol, K)
- Değişkenler italik (F, m, v, T, E)
- Vektörler kalın veya ok işaretli: **F** veya F→
- Sabitler: italik olmayan (kB, NA, c, h)

### Denklemler
- Her denklem numaralandırılmalı: (1), (2), (3)...
- Bölüm bazlı numaralama tercih edilebilir: (2.1), (2.2)
- Değişkenler ilk kullanımda hemen sonraki satırda tanımlanmalı:
  ```
  F = ma                                    (1)

  burada F kuvvet (N), m kütle (kg) ve a ivmedir (m/s²).
  ```
- Denklem editörü: LaTeX veya Word Equation Editor
- Uzun denklemler satır sonunda operatörle (=, +, −) bölünür

### Kimyasal Formül ve Reaksiyonlar
- Reaksiyon denklemleri numaralandırılmalı
- Koşullar ok üzerine yazılmalı (sıcaklık, katalizör, çözücü)
- IUPAC adlandırma kuralları uygulanmalı

### Şekil, Tablo ve Grafikler
- Her şekil/tabloya metin içinden atıf yapılmalı
- Grafikler: eksen etiketleri (birimli), lejant, grid (opsiyonel)
- Hata çubukları (error bars) ZORUNLU (standart sapma veya standart hata)
- Yüksek çözünürlük: min 300 dpi (basılı), vektör format tercih
- Renk körü dostu palet kullanılmalı (önerilir)
- Tablo başlıkları tablonun üstünde, şekil başlıkları altında

## Kaynak Kalite Hiyerarşisi

1. **En üst düzey dergiler:** Nature, Science, Cell, PNAS
2. **Alan dergiler (Q1):** Physical Review Letters, JACS, Angewandte Chemie, Ecology
3. **Hakemli dergiler:** SCI/SCIE indeksli > Scopus > ulusal hakemli
4. **Review/derleme makaleleri:** Chemical Reviews, Annual Review of... serisi
5. **Akademik kitaplar:** Springer, Wiley, Elsevier, Cambridge UP, Oxford UP
6. **Teknik raporlar:** NIST, CERN, TÜBİTAK, NASA
7. **Konferans bildirileri:** APS, ACS, IEEE (tam metin hakemli)
8. **Standartlar:** ISO, IUPAC, TSE
9. **Tezler:** Doktora > yüksek lisans
10. **Preprint'ler:** arXiv, ChemRxiv, bioRxiv (hakemli versiyonu tercih et)

UYARI: 10 yıldan eski kaynaklarda dikkatli ol (özellikle deneysel verilerde). Klasik teorik eserler hariç.

## Tez Yapısı Önerileri

### Deneysel Çalışma
```
GİRİŞ (Problem tanımı, amaç, özgün katkı)
BÖLÜM 1: Kuramsal Çerçeve / Literatür
BÖLÜM 2: Malzeme ve Yöntem
BÖLÜM 3: Bulgular
BÖLÜM 4: Tartışma
SONUÇ (Özet, katkılar, gelecek çalışmalar)
```

### Teorik / Hesaplamalı Çalışma
```
GİRİŞ
BÖLÜM 1: Teorik Arka Plan
BÖLÜM 2: Matematiksel Model / Hesaplama Yöntemi
BÖLÜM 3: Sonuçlar ve Analiz
BÖLÜM 4: Tartışma ve Karşılaştırma
SONUÇ
```

### Biyoloji / Ekoloji Saha Çalışması
```
GİRİŞ
BÖLÜM 1: Literatür Taraması
BÖLÜM 2: Çalışma Alanı ve Yöntem
BÖLÜM 3: Bulgular (tür listeleri, istatistiksel analizler)
BÖLÜM 4: Tartışma
SONUÇ ve ÖNERİLER
```

## Sık Yapılan Hatalar

- Hata analizi yapmamak veya hata çubuklarını göstermemek
- Birim tutarsızlığı (cgs/SI karışımı)
- Denklemlerdeki değişkenleri tanımlamamak
- Deneysel detayları eksik bırakmak (tekrarlanabilirlik yok)
- Negatif sonuçları gizlemek (başarısız deneyler de bilgidir)
- Grafiklerde eksen etiketini veya birimi unutmak
- Simülasyon parametrelerini belirtmemek
- İstatistiksel testin varsayımlarını kontrol etmemek
- Yakınsama testi yapmadan sonucu kabul etmek
- Kaynak kodunu veya hesaplama detayını hiç paylaşmamak
