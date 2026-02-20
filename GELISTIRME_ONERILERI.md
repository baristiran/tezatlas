# TezAtlas Gelistirme Onerileri

Bu dosya, repo gelistirme notlarini tek yerde tutmak icin olusturuldu.

## 2026-02-20

1. Faz 0 kimlik akisinda "Danisman kontrolu" sorusunu kaldir.
Durum: Uygulandi (`skills/phases/phase-0-identity.md`, `skills/core/academic-integrity.md`).

2. Faz 0'da `/kaynaklar/` klasorunu bos da olsa otomatik olustur ve kullaniciyi literatur PDF'lerini eklemeye tesvik et.
Durum: Uygulandi (`skills/phases/phase-0-identity.md`, `.claude/commands/tez-baslat.md`, `.claude/commands/thesis-start.md`, `kaynaklar/README.md`).

3. Faz 1 sonunda uretilen `konu_kesfi.md` dosyasini konusma/konsolda acikca goster.
Durum: Uygulandi (`skills/phases/phase-1-topic.md`, `.claude/commands/tez-baslat.md`, `.claude/commands/thesis-start.md`, `README.md`).

4. Faz 2'de kaynak envanteri olustururken AI'a dosya adlarini kendi adlandirma kuralina gore guncelleme yetkisi ver.
Durum: Uygulandi (`skills/phases/phase-2-sources.md`, `skills/templates/tpl-kaynak-envanteri.md`).

5. Faz 3 not dosyalari kok dizinde degil `notlar/` klasorunde tutulmali.
Durum: Uygulandi (`skills/phases/phase-3-reading.md`, `skills/templates/tpl-notlar.md`).

6. `notlar/INDEX.md` dosyasi ile notlarin durumunu tek tabloda takip et.
Durum: Uygulandi (`notlar/INDEX.md`, `skills/phases/phase-3-reading.md`).

7. `_notlar.md` icin zorunlu tamamlanma kriteri koy (2 alinti, 3 parafraz, 1 kartopu, tam elestirel degerlendirme, tam yazim plani).
Durum: Uygulandi (`skills/templates/tpl-notlar.md`, `skills/phases/phase-3-reading.md`).

8. Tamamlanma kriterlerini kaynak turune gore uyarlama (mevzuat/yargi icin farkli, makale/rapor icin farkli esikler).
Durum: Oneri (uygulanmadi).

9. Notlara \"okuma kaniti\" alani ekleme (okunan sayfa araligi + yaklasik okuma suresi).
Durum: Oneri (uygulanmadi).

10. Not durumlarini 3 seviyeye ayirma (`BASLANDI`, `DERIN_OKUNDU`, `TAMAMLANDI`).
Durum: Oneri (uygulanmadi).

11. Surec icinde kullanicinin kullandigi ikinci yapay zekadan kontrollu ikinci gorus alma adimi ekleme (kaynak uretimi degil; elestiri, karsi arguman ve bosluk tespiti icin).
Durum: Oneri (uygulanmadi).

12. Bu tez ozelinde Faz 3'te doygunluk yerine tam korpus okuma moduna gecis (`/kaynaklar/` altindaki tum kaynaklar bitmeden Faz 4 yok).
Durum: Uygulandi (`OKUMA_RAPORU.md`, `notlar/INDEX.md`).

13. Hailo 10H tabanli "OCR hizlandirma profili" ekle: taranmis PDF sayfalarinda once Hailo uyumlu OCR modeli calistir, dusuk guvenli ciktilari Tesseract ile ikinci gecisten gecir.
Durum: Oneri (uygulanmadi).

14. Faz 2'ye "sayfa tipi siniflandirma" adimi ekle (metin katmani var/yok, tablo agirlikli, goruntu agirlikli) ve sonuca gore OCR/parse hattini sec.
Durum: Oneri (uygulanmadi).

15. Faz 3 not akisina "OCR kalite kaydi" ekle (ortalama confidence, fallback orani, elle duzeltme gereken sayfalar).
Durum: Oneri (uygulanmadi).

16. Ticari urunlesme icin benchmark katmani tanimla: hedef metrikler (`sayfa/dakika`, `CER/WER`, `maliyet/sayfa`) ve minimum kabul esikleri.
Durum: Oneri (uygulanmadi).

17. Urun konumlamasini tek hat yerine cift hat yap: `Akademik Arastirma Copilot` + `Hukuki Is Akisi Copilot`.
Durum: Oneri (uygulanmadi).

18. Hukuki is akisina "Dava Dosyasi Degerlendirme" modulu ekle (taraflar, iddia-savunma ozeti, delil listesi, zaman cizelgesi, risk basliklari).
Durum: Oneri (uygulanmadi).

19. Hukuki is akisina "Dilekce Taslaklama" modulu ekle (dava turune gore alanlar, zorunlu unsurlar kontrolu, eksik belge uyari listesi).
Durum: Oneri (uygulanmadi).

20. "Ictihat ve Mevzuat Eslestirme" adimi ekle: dosyadaki iddialari ilgili mevzuat maddeleri ve emsal kararlarla eslestir.
Durum: Oneri (uygulanmadi).

21. Rol tabanli cikti profilleri ekle: `Akademisyen`, `Avukat`, `Hakim/Savci Arastirma Yardimcisi`.
Durum: Oneri (uygulanmadi).

22. Hukuki guvenlik siniri koy: sistem "karar verici" degil, nihai hukuki gorus/karar yerine kaynakli analiz ve taslak uretir; insan onayi zorunlu.
Durum: Oneri (uygulanmadi).

23. Her hukuki ciktiya "kaynak izi" zorunlulugu ekle: her paragraf ilgili sayfa/paragraf referansina baglansin.
Durum: Oneri (uygulanmadi).

24. Ticarilesme Faz A (0-90 gun): OCR + kaynakli ozet + dilekce taslak MVP.
Durum: Oneri (uygulanmadi).

25. Ticarilesme Faz B (90-180 gun): dava dosyasi degerlendirme + ictihat eslestirme + rol bazli cikti.
Durum: Oneri (uygulanmadi).

26. Ticarilesme Faz C (180+ gun): kurum entegrasyonlari (dokuman yonetim sistemi, UYAP uyumlu veri aktarim katmani, kurumsal SLA).
Durum: Oneri (uygulanmadi).

27. "Avukat Beklenti Sozlesmesi" dokumani ekle: kullanici tum dava dosyasini yuklediginde sistemin garanti ettigi ciktilari (dosya haritasi, risk raporu, taslak dilekce, kaynak izi, aksiyon listesi) net tanimla.
Durum: Oneri (uygulanmadi).

28. "Dava Kokpit Ekrani" uret: tek panelde taraflar, talepler, savunmalar, usul adimlari, son tarihler, kritik riskler.
Durum: Oneri (uygulanmadi).

29. "Delil-Iddia Grafigi" modulu ekle: her iddianin hangi delille desteklendigini ve hangi delilin zayif kaldigini gorsellestir.
Durum: Oneri (uygulanmadi).

30. "Durusma Hazirlik Paketi" modulu ekle: sorgu sorulari, capraz sorgu akisi, muhtemel karsi argumanlar, 1 sayfalik savunma ozeti.
Durum: Oneri (uygulanmadi).

31. "Sure ve Usul Motoru" ekle: dava turune gore kritik sureleri otomatik hesapla, gecikme riskini erken uyarilarla bildir.
Durum: Oneri (uygulanmadi).

32. "Dilekce Kalite Denetimi" modulu ekle: zorunlu unsurlar, dayanak mevzuat, talep sonucu, delil listesi eksiklerini yayina cikmadan yakala.
Durum: Oneri (uygulanmadi).

33. "Muzakere/Uzlasma Senaryo Motoru" ekle: olasi karar/agirlikli risk dagilimi ve uzlasma araligi icin veri destekli senaryolar uret.
Durum: Oneri (uygulanmadi).

34. "Musteri Iletisim Yardimcisi" ekle: teknik raporu sade dile ceviren bilgilendirme notu ve bir sonraki adim ozetini otomatik hazirla.
Durum: Oneri (uygulanmadi).

35. "Ekip Ici Calisma" katmani ekle: taslaklar icin surumleme, yorum, onay ve degisiklik gunlugu.
Durum: Oneri (uygulanmadi).

36. "Avukat Eli Kolu" KPI seti tanimla: dosya anlama suresi, dilekce hazirlama suresi, hatali/eksik unsur orani, kazanilan operasyon saati.
Durum: Oneri (uygulanmadi).

37. "Mevzuat Hakimiyeti Cekirdegi" ekle: tum temel kaynaklari tek bilgi katmaninda birlestir (`kanun`, `yonetmelik`, `teblig`, `genelge`, `anayasa`, `yargi ic metodoloji notlari`).
Durum: Oneri (uygulanmadi).

38. "Surekli Mevzuat Guncelleme Boru Hatti" kur: resmi kaynaklardan degisiklikleri periyodik cek, fark analizi yap, etki alanlarini isaretle.
Durum: Oneri (uygulanmadi).

39. "Madde Surumleme ve Yururluk Motoru" ekle: her maddenin zaman icindeki surumlerini ve hangi tarihte hangi metnin gecerli oldugunu izle.
Durum: Oneri (uygulanmadi).

40. "Hukum-Delil-Iddia Baglama Grafigi" ekle: dilekce/cikti uretiminde her hukuki sonucun ilgili madde ve kaynakla bagini zorunlu tut.
Durum: Oneri (uygulanmadi).

41. "Mevzuat Kapsama KPI" tanimla: kapsanan mevzuat orani, guncellenme gecikmesi (saat), yanlis/eski madde referansi orani.
Durum: Oneri (uygulanmadi).

42. "Resmi Kaynak Oncelik Politikasi" yaz: mevzuat cevabinda sadece resmi ve surumlenebilir kaynaktan alinti; ikincil kaynaklar sadece destekleyici olsun.
Durum: Oneri (uygulanmadi).

43. "Sifir-Komut Modu" ekle: avukat dosyayi yukledigi anda otomatik dava turu tespiti, kronoloji, risk raporu, taslak dilekce ve aksiyon listesini komutsuz uret.
Durum: Oneri (uygulanmadi).

44. "Yuksek Mahkeme Ictihat Cekirdegi" ekle: Yargitay, Danistay ve Anayasa Mahkemesi kararlarini surumlu, aranabilir ve gerekce paragraflarina bolunmus veri modeliyle tut.
Durum: Oneri (uygulanmadi).

45. "Ictihat Oncelik ve Hiyerarsi Motoru" ekle: daire/kurul seviyesi, karar tarihi, benzer olay yogunlugu ve guncellik kriterleriyle emsal agirlik puani hesapla.
Durum: Oneri (uygulanmadi).

46. "Gunluk Resmi Gazete Takip Ajani" kur: her gun otomatik tarama, ilgili degisiklikleri madde bazinda cikarma, dosya tipine gore etki analizi.
Durum: Oneri (uygulanmadi).

47. "Mevzuat-Ictihat Etki Uyarisi" ekle: yeni Resmi Gazete yayini veya yuksek mahkeme karari mevcut aktif dosyalari etkiliyorsa avukata anlik bildirim ver.
Durum: Oneri (uygulanmadi).

48. "Ogrenme ve Guncelleme Defteri" ekle: sistemin her gun ogrendigi mevzuat/ictihat degisikliklerini tarih damgali kaydet ve kullaniciya degisim ozeti sun.
Durum: Oneri (uygulanmadi).

## MVP Backlog (Ilk 10 Teknik Is Paketi)

49. MVP-01 "Dosya Alim ve Is Kuyrugu": dosya yukleme API'si, is kimligi uretimi, asenkron kuyruk ve durum takibi.
Durum: Oneri (uygulanmadi).

50. MVP-02 "OCR ve Metin Cikarma Boru Hatti": metin katmani kontrolu, Hailo hizlandirmali OCR, dusuk guvende Tesseract fallback.
Durum: Oneri (uygulanmadi).

51. MVP-03 "Dokuman Ayristirma": dilekce, ek, tutanak, karar gibi belge tiplerini otomatik siniflandir ve parcalara bol.
Durum: Oneri (uygulanmadi).

52. MVP-04 "Hukuki Varlik Cikarimi": taraflar, talepler, savunmalar, deliller, tarihler, dosya numaralari ve mahkeme bilgilerini yakala.
Durum: Oneri (uygulanmadi).

53. MVP-05 "Mevzuat-Ictihat Bilgi Katmani": kanun + Yargitay + Danistay + AYM kararlarini indeksle, surumle ve aranabilir hale getir.
Durum: Oneri (uygulanmadi).

54. MVP-06 "Kaynakli Getirme Motoru": iddia bazli sorgu, emsal puanlama, madde/paragraf kaynak izi ile kanitli sonuc dondur.
Durum: Oneri (uygulanmadi).

55. MVP-07 "Sifir-Komut Orkestratoru": dosya yuklenince otomatik dava turu tespiti, kronoloji, risk raporu ve aksiyon listesi uret.
Durum: Oneri (uygulanmadi).

56. MVP-08 "Dilekce Taslak Motoru": dava turune gore taslak dilekce uret, zorunlu unsur denetimi ve eksik evrak uyarisi ver.
Durum: Oneri (uygulanmadi).

57. MVP-09 "Avukat Kokpiti": tek ekranda dosya haritasi, riskler, kritik sureler, delil-iddia iliskisi ve cikti indirme.
Durum: Oneri (uygulanmadi).

58. MVP-10 "Guvenlik ve Olcumleme": loglama, denetim izi, veri silme politikasi, KPI panosu (`sayfa/dakika`, `CER/WER`, `hazirlama suresi`).
Durum: Oneri (uygulanmadi).
