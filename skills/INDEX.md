---
title: "TezAtlas — Skill Graph Index"
title_tr: "TezAtlas — Beceri Grafiği Dizini"
node_type: index
description: "Root entry point for all TezAtlas skills. Describes the skill graph landscape. Read this first, then follow wikilinks to the relevant cluster or node for your current task."
description_tr: "Tüm TezAtlas becerilerinin kök giriş noktası. Beceri grafının haritasını açıklar. Önce bunu oku, sonra mevcut görevin için ilgili küme veya düğüme wikilink'leri takip ederek git."
tags: [index, entry-point, landscape, navigation, tezatlas]
top_level_clusters:
  - skills/moc/MOC-core.md
  - skills/moc/MOC-phases.md
  - skills/moc/MOC-disciplines.md
  - skills/moc/MOC-citations.md
  - skills/moc/MOC-universities.md
version: "2.0"
---

# TezAtlas — Skill Graph

TezAtlas, akademik tez yazım sürecini 8 fazda yöneten, skill graph mimarisine sahip bir AI çerçevesidir. Monolitik bir protokol dosyası yerine, wikilink'lerle birbirine bağlı küçük composable node'lardan oluşur — agent sadece o an gerekli node'ları yükler.

## Kümeler / Clusters

| Küme | İçerik | Wikilink |
|------|--------|----------|
| Core | Her zaman aktif 7 temel node (Demir Kurallar, Kaynak Politikası, Context Yönetimi vb.) | [[MOC-core]] |
| Phases | 8 faz node'u (Faz 0'dan Faz 7'ye, sıralı ve birbirine kilitli) | [[MOC-phases]] |
| Disciplines | 8 disiplin modülü (hukuk, mühendislik, sosyal bilimler vb.) | [[MOC-disciplines]] |
| Citations | 6 atıf sistemi rehberi (Chicago, APA 7, IEEE, OSCOLA vb.) | [[MOC-citations]] |
| Universities | Üniversite format şablonları (YAML) | [[MOC-universities]] |

## Duruma Göre Giriş Noktaları

| Durum | Başlangıç Yolu |
|-------|----------------|
| Yeni proje başlatılıyor | [[MOC-core]] → [[iron-rules]] → [[phase-0-identity]] |
| Mevcut projeye devam | [[context-management]] → ilgili faz node'u |
| Hangi atıf sistemi? | [[MOC-citations]] |
| Disipline özgü format? | [[MOC-disciplines]] |
| PDF indirilemedi | [[annas-archive]] |
| Oturum sonu ritüeli | [[session-structure]] |
| Kalite kontrolü | [[quality-control]] |
| Kartopu örnekleme | [[snowball-sampling]] |
