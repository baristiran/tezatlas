---
title: "Template — OKUMA_RAPORU.md"
title_tr: "Şablon — OKUMA_RAPORU.md"
node_type: template
description: "Reading progress report template. Updated after each source read. Tracks which PDFs have been read, snowball sources discovered, and saturation status. This is the user-facing progress dashboard for Phase 3."
description_tr: "Okuma ilerleme raporu şablonu. Her kaynak okunduğunda güncellenir. Hangi PDF'lerin okunduğunu, kartopu keşfedilen kaynakları ve doygunluk durumunu izler. Kullanıcı için Faz 3 ilerleme paneli."
tags: [template, phase-3, reading-progress, saturation, tracking, dashboard]
links_to:
  - skills/phases/phase-3-reading.md
  - skills/techniques/saturation-check.md
  - skills/techniques/snowball-sampling.md
used_by:
  - skills/phases/phase-3-reading.md
language: bilingual
version: "1.0"
---

# OKUMA_RAPORU.md Şablonu

Bu dosyayı projenin kök dizinine `OKUMA_RAPORU.md` adıyla oluştur. Faz 3 boyunca her kaynak okuduktan sonra güncelle.

---

```markdown
# OKUMA RAPORU

**Proje:** [Tez başlığı]
**Faz:** 3 — Okuma ve Kartopu Keşif
**Başlangıç tarihi:** [YYYY-MM-DD]
**Son güncelleme:** [YYYY-MM-DD]

---

## Özet İstatistikler

| Metrik | Değer |
|--------|-------|
| Planlanan kaynak | X |
| Okunan kaynak | X |
| Bekleyen kaynak | X |
| Kartopu ile keşfedilen yeni kaynak | X |
| Toplam kaynak kuyruğu | X |
| Doygunluk durumu | [HAYIR / EVET] |

---

## Okunan Kaynaklar

Her kaynak okunduktan sonra bu tabloya ekle.

| # | Dosya adı | Yazar(lar) | Yıl | Okunma tarihi | Not dosyası | Durum |
|---|-----------|------------|-----|---------------|-------------|-------|
| 1 | Yazar_2023_Baslik.pdf | Soyadı, A. | 2023 | 2024-01-15 | bolum1_notlar.md | ✅ TAMAMLANDI |
| 2 | Yazar_2019_Baslik.pdf | Soyadı, B. | 2019 | 2024-01-16 | bolum2_notlar.md | ✅ TAMAMLANDI |
| 3 | Yazar_2021_Baslik.pdf | Soyadı, C. | 2021 | — | — | ⏳ SIRA BEKLİYOR |

**Durum kodları:**
- ✅ TAMAMLANDI — okundu, notlar çıkarıldı, eleştirel değerlendirme yapıldı
- 🔄 DEVAM EDİYOR — okunuyor
- ⏳ SIRA BEKLİYOR — sıraya alındı, henüz başlanmadı
- ❌ ERİŞİLEMEZ — bulunamadı, alternatif aranıyor
- ⏭️ ATLANDI — ilgisiz çıktı, gerekçe belirtilmeli

---

## Bekleyen Kaynak Kuyruğu

Sıradaki okunacak kaynaklar. Öncelik sırasına göre listele.

| Öncelik | Kaynak künye | Kaynak | Neden önemli |
|---------|-------------|--------|--------------|
| 🔴 YÜKSEK | Yazar, A. (2020). *Başlık*. Yayınevi. | /kaynaklar/dosya.pdf | Temel teorik çerçeve |
| 🟡 ORTA | Yazar, B. (2018). *Başlık*. Dergi, 10(2), 45-67. | Anna's Archive'dan indirilecek | Metodoloji karşılaştırması |
| 🟢 DÜŞÜK | Yazar, C. (2015). *Başlık*. | Kullanıcıdan bekleniyor | Arka plan |

---

## Kartopu Keşifleri

Okunan kaynakların dipnotlarından keşfedilen yeni kaynaklar.

| Keşfedilen kaynak | Hangi kaynağın dipnotunda | Dipnot no | Eklenme tarihi | Durumu |
|-------------------|--------------------------|-----------|----------------|--------|
| Bodin (1576). *Six livres...* | Yazar_2023.pdf | 34 | 2024-01-15 | Kuyruğa eklendi |
| Smith, J. (2019). *...* | Yazar_2019.pdf | 12 | 2024-01-16 | İndirildi |

---

## Doygunluk Kontrolü

Her 5 kaynaktan sonra güncelle. [[saturation-check]] protokolü.

| Kontrol # | Tarih | Okunan kaynak | Yeni kavram sayısı | Yeni kaynak keşfi | Değerlendirme |
|-----------|-------|---------------|---------------------|-------------------|---------------|
| 1. kontrol | 2024-01-20 | 5 | 12 | 8 | Doygunluk YOK — devam |
| 2. kontrol | 2024-01-25 | 10 | 5 | 3 | Doygunluk YOK — devam |
| 3. kontrol | 2024-01-30 | 15 | 2 | 1 | **DOYGUNLUK VAR** — Faz 4'e geç |

**Doygunluk kriteri:** 5 kaynak ardı ardına okunduktan sonra 3'ten az yeni kavram ve 2'den az yeni kaynak keşfi → Doygunluk.

---

## Kaynak Çeşitlilik Metrikleri

Son güncelleme: [tarih]

```
Dil dağılımı:    TR %X  / EN %X  / Diğer %X
Tarih dağılımı:  Klasik (pre-2000) %X / 2000-2020 %X / 2020+ %X
Tür dağılımı:    Kitap %X / Makale %X / Rapor %X / Diğer %X

En çok atıf alacak 3 yazar (şimdiye kadar):
  1. [Yazar adı] — X kaynakta geçiyor
  2. [Yazar adı] — X kaynakta geçiyor
  3. [Yazar adı] — X kaynakta geçiyor

⚠️ Uyarı: Tek yazara %30+ bağımlılık varsa çeşitlendirme gerekli.
```

---

## Eksik / Bulunamayan Kaynaklar

Arandığı halde erişilemeyen kaynaklar.

| Kaynak | Arama yerleri | Durum |
|--------|--------------|-------|
| Yazar, A. (2010). *Başlık*. | Anna's Archive ❌, JSTOR ❌, ResearchGate ❌ | Kullanıcıdan istendi |

---

## Oturum Notları

Her okuma oturumu sonunda ekle.

### Oturum: [Tarih]
- **Okunan:** [kaynak adı]
- **Süre:** ~X saat
- **Temel bulgular:** [1-2 cümle]
- **Sonraki oturum için:** [sıradaki kaynak veya görev]
```

---

**KULLANIM NOTU:** Bu şablonu kopyalayıp projenin kök dizininde `OKUMA_RAPORU.md` adıyla oluştur. Faz 3 boyunca her kaynak okuduktan sonra ilgili tabloyu güncelle. Kullanıcı bu dosyayı açarak hangi kaynakların okunduğunu, hangilerinin sırada beklediğini ve doygunluk durumunu görebilir.
