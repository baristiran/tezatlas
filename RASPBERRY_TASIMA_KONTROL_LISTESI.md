# Raspberry Tasima Kontrol Listesi

Bu kontrol listesi, proje klasorunu Raspberry Pi 5'e sorunsuz tasimak ve calisir hale getirmek icin hazirlandi.

## 1) Tasima Oncesi (Kaynak Makine)

- [ ] Proje dizininde oldugunu dogrula:
  ```bash
  pwd
  ```
- [ ] Ana klasor ve kritik alt klasorleri dogrula:
  ```bash
  ls -la
  ls -la kaynaklar
  ls -la notlar
  ```
- [ ] Yerel degisiklikleri kontrol et:
  ```bash
  git status --short
  ```
- [ ] (Opsiyonel) PDF sayisini not al:
  ```bash
  find kaynaklar -name "*.pdf" | wc -l
  ```

## 2) Tasima (rsync onerilir)

- [ ] Raspberry erisimini test et:
  ```bash
  ssh pi@raspberrypi.local "echo OK"
  ```
- [ ] Tum klasoru rsync ile tasi:
  ```bash
  rsync -avh --partial --append-verify --progress \
  "/Users/web3alkan/Downloads/TEZ CBDC 21 Şubat/tezatlas/" \
  "pi@raspberrypi.local:~/tezatlas/"
  ```

Not: `git clone` tek basina yeterli degildir; `.gitignore` altindaki yerel dosyalar ve PDF'ler clone ile gelmez.

## 3) Raspberry Uzerinde Ilk Kurulum

- [ ] Proje dizinine gir:
  ```bash
  ssh pi@raspberrypi.local
  cd ~/tezatlas
  ```
- [ ] Script izinlerini ayarla:
  ```bash
  chmod +x scripts/*.sh
  ```
- [ ] Kurulumu calistir:
  ```bash
  ./scripts/install.sh
  ```

## 4) Tasima Sonrasi Dogrulama

- [ ] PDF sayisini kontrol et:
  ```bash
  find ~/tezatlas/kaynaklar -name "*.pdf" | wc -l
  ```
- [ ] Not dosyalarini kontrol et:
  ```bash
  ls -la ~/tezatlas/notlar
  ```
- [ ] Durum dosyalarini kontrol et:
  ```bash
  ls -la ~/tezatlas | rg "proje_kimlik.md|KAYNAK_ENVANTERI.md|OKUMA_RAPORU.md|konu_kesfi.md"
  ```
- [ ] Kaynak butunluk taramasi calistir:
  ```bash
  cd ~/tezatlas
  ./scripts/verify_sources.sh verify
  ```

## 5) Hailo 10H Notlari (Kisa)

- [ ] OCR pipeline'i asenkron kuyruk ile calistir (API isteklerini bloklama).
- [ ] Dusuk guvenli OCR ciktilarini fallback hattina (Tesseract vb.) yonlendir.
- [ ] Her is icin kalite metriği kaydet (`confidence`, `sayfa/dakika`, `fallback_orani`).

## 6) Hizli Sorun Giderme

- `Permission denied`: `chmod +x scripts/*.sh`
- `command not found: rg`: `sudo apt install ripgrep -y`
- `Rsync kopuyor`: `--partial --append-verify` ile tekrar calistir
- `PDF eksik`: kaynak makinedeki `find kaynaklar -name "*.pdf" | wc -l` ile karsilastir

