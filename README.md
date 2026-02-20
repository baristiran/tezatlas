# TezAtlas

**Akademik tez yazımı için skill graph mimarisi.**

TezAtlas, AI destekli akademik tez yazım çerçevesidir. Monolitik bir protokol dosyası yerine, wikilink'lerle birbirine bağlı composable skill node'larından oluşur — agent sadece o an gerekli bilgiyi yükler.

## Nasıl Çalışır

```
skills/INDEX.md           ← harita
  → skills/moc/           ← navigasyon merkezi (5 MOC)
  → skills/core/          ← her zaman aktif (Demir Kurallar, Kaynak Politikası vb.)
  → skills/phases/        ← 8 faz (0-7)
  → skills/techniques/    ← teknikler (kartopu, doygunluk, PDF okuma vb.)
  → skills/templates/     ← dosya şablonları
  → skills/tooling/       ← araçlar (Anna's Archive, git)
  → templates/disciplines/← 8 disiplin modülü
  → templates/citations/  ← 6 atıf sistemi rehberi
  → templates/universities/← üniversite format YAML'ları
```

## Kurulum

```bash
# Claude Code slash command'larını kur
./scripts/install.sh
```

Ardından herhangi bir tez projesinde `/tez-baslat` veya `/thesis-start` yazın.

## Demir Kurallar

1. **Kaynaksız yazım YASAK** — /kaynaklar/ klasöründe PDF yoksa yazılmaz
2. **Kartopu örnekleme ZORUNLU** — her kaynağın dipnotları taranır
3. **AI önce kendisi indirir** — Anna's Archive + açık erişim önce denenir
4. **Uydurma atıf = akademik suç** — hafızadan kaynak uydurmak kesinlikle yasak
5. **Danışman kontrol noktaları atlanamaz** — her kritik fazda danışman onayı

## Desteklenen

| Kategori | İçerik |
|----------|--------|
| Disiplinler | Hukuk, Sosyal Bilimler, Mühendislik, Fen Bilimleri, Tıp, İşletme, Eğitim, Beşeri Bilimler |
| Atıf Sistemleri | Chicago Notes, APA 7, Harvard, IEEE, OSCOLA, Vancouver |
| Üniversiteler | ODTÜ, İTÜ, Boğaziçi, Hacettepe, Ankara, ASBÜ |
| Tez Türleri | Yüksek Lisans, Doktora |
| Diller | Türkçe, İngilizce, Almanca |

## Skill Graph Hakkında

Her node dosyası bir YAML frontmatter ile başlar (agent tam okumadan tarayabilir). Node'lar arası geçiş, prose içine işlenmiş `[[wikilinks]]` ile yapılır. Bu sayede agent 1264 satırlık bir protokol yerine ~5-7 hedefli node (~400-600 token) yükler.

## Katkı

Yeni üniversite, disiplin veya atıf sistemi eklemek için `CONTRIBUTING.md` dosyasına bakın.

## Lisans

MIT
