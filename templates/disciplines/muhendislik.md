---
title: "Discipline Module — Engineering"
title_tr: "Disiplin Modülü — Mühendislik"
node_type: discipline
discipline_id: muhendislik
default_citation: ieee
alternative_citations: ["apa7"]
description: "Discipline-specific rules for engineering thesis writing: experimental design, simulation, algorithm analysis, technical writing conventions."
description_tr: "Mühendislik tezi yazımına özel kurallar: deney tasarımı, simülasyon, algoritma analizi, teknik yazım kuralları."
tags: [discipline, engineering, muhendislik, experimental, simulation]
links_to:
  - templates/citations/ieee.md
used_by:
  - skills/moc/MOC-disciplines.md
  - skills/phases/phase-0-identity.md
language: bilingual
version: "2.0"
---

# Mühendislik ve Fen Bilimleri Disiplin Modülü

Bu modül; bilgisayar mühendisliği, elektrik-elektronik, makine, inşaat, endüstri mühendisliği ve fen bilimleri (fizik, kimya, biyoloji, matematik) alanlarında tez yazan öğrenciler için disipline özel kuralları içerir.

## Atıf Sistemi

- **Önerilen:** IEEE (mühendislik standardı)
- **Alternatif:** APA 7, Vancouver (tıp/biyoloji yakını alanlar)
- IEEE formatı: Köşeli parantez numaralama [1], [2], [3]...
- Kaynakça: Metin içi sıraya göre numaralandırılır (alfabetik DEĞİL)

## Metodoloji Gereksinimleri

### Deneysel Çalışma
- Deney düzeneği detaylıca açıklanmalı (tekrarlanabilirlik ZORUNLU)
- Kontrol grubu ve değişkenler tanımlanmalı
- Ölçüm yöntemi ve hata analizi belirtilmeli
- Deney parametreleri tablo halinde sunulmalı
- Sonuçlar istatistiksel olarak değerlendirilmeli

### Simülasyon Çalışması
- Simülasyon ortamı ve araçları belirtilmeli
- Model varsayımları açıkça listelenmelidir
- Doğrulama (validation): Mümkünse deneysel veriyle karşılaştırma
- Parametrik analiz: Farklı senaryoların karşılaştırılması
- Hesaplama maliyeti raporlanmalı

### Tasarım/Geliştirme Çalışması
- Gereksinim analizi yapılmalı
- Tasarım alternatifleri karşılaştırılmalı
- Uygulama detayları açıklanmalı
- Test ve değerlendirme sistematik yapılmalı
- Performans metrikleri tanımlanmalı

### Algoritma/Yazılım Geliştirme
- Pseudocode veya akış diyagramı ZORUNLU
- Karmaşıklık analizi (Big-O) yapılmalı
- Benchmark karşılaştırması yapılmalı
- Kaynak kodu (veya özeti) ekte sunulmalı

### Literatür Taraması / Sistematik İnceleme
- Arama stratejisi belirtilmeli (veritabanları, anahtar kelimeler)
- Dahil etme/dışlama kriterleri tanımlanmalı
- PRISMA akış diyagramı kullanılmalı (sistematik inceleme için)
- Sonuçlar tablo halinde özetlenmeli

## Yazım Kuralları

### Dil ve Üslup
- Kısa ve net cümleler tercih edilir (hukuk/sosyal bilimlerden farklı olarak)
- Pasif yapı tercih edilir: "uygulandı", "gözlemlendi", "ölçüldü"
- Teknik terimler ilk kullanımda tanımlanmalı
- Kısaltmalar ilk kullanımda açılmalı: "Yapay Sinir Ağı (YSA)"
- Birimler SI sistemiyle tutarlı olmalı

### Şekil ve Tablolar
- Her şekil ve tabloya metin içinden atıf yapılmalı
- Şekil altı yazıları açıklayıcı ve bağımsız anlaşılır olmalı
- Tablo başlıkları tablonun üstünde, şekil başlıkları altında
- Grafikler: eksen etiketleri, birimler, lejant ZORUNLU
- Yüksek çözünürlüklü ve okunabilir olmalı

### Denklemler
- Denklem editörüyle yazılmalı (LaTeX veya Word Equation)
- Her denklem numaralandırılmalı: (1), (2), (3)...
- Değişkenler ilk kullanımda tanımlanmalı
- Birimler belirtilmeli

### Kod ve Algoritma
- Pseudocode: Algorithm ortamında, satır numaralı
- Kaynak kodu: Monospace font, sözdizimi vurgulama
- Uzun kodlar eke konur, metinde sadece kritik kısımlar

## Kaynak Kalite Hiyerarşisi

1. **Hakemli dergi makaleleri:** SCI/SCIE indeksli > Scopus > ulusal hakemli
2. **Konferans bildirileri:** IEEE, ACM, Springer LNCS (tam metin hakemli)
3. **Akademik kitaplar:** Springer, Wiley, Elsevier, Cambridge UP
4. **Teknik raporlar:** NASA, NIST, CERN, TÜBİTAK
5. **Standartlar:** ISO, IEEE, TSE standartları
6. **Patentler:** İlgili patent belgeleri
7. **Tezler:** Doktora > yüksek lisans
8. **Açık kaynak dokümantasyonu:** Resmi teknik dokümantasyon
9. **Preprint'ler:** arXiv, bioRxiv (hakemli versiyonu tercih et)

## Tez Yapısı Önerileri

### Deneysel/Simülasyon Çalışması
```
GİRİŞ (Problem, amaç, katkı, organizasyon)
BÖLÜM 1: Literatür Taraması
BÖLÜM 2: Teorik Arka Plan / Matematiksel Modelleme
BÖLÜM 3: Önerilen Yöntem / Sistem Tasarımı
BÖLÜM 4: Deneysel Sonuçlar ve Tartışma
SONUÇ (Özet, katkılar, gelecek çalışmalar)
```

### Yazılım/Sistem Geliştirme
```
GİRİŞ
BÖLÜM 1: Literatür Taraması ve İlgili Çalışmalar
BÖLÜM 2: Gereksinim Analizi ve Tasarım
BÖLÜM 3: Uygulama (Implementation)
BÖLÜM 4: Test ve Değerlendirme
SONUÇ
```

## Sık Yapılan Hatalar

- Deneysel detayları eksik bırakmak (tekrarlanabilirlik sağlanmalı)
- Grafikleri açıklama yapmadan bırakmak ("Şekil 3'te görüldüğü gibi" yetmez)
- Birimler ve ölçek tutarsızlığı
- "State of the art" karşılaştırması yapmamak
- Karmaşıklık analizi ihmal etmek
- Negatif sonuçları gizlemek (başarısız deneyler de bilimdir)
- Koda/algoritmaya yer vermemek
