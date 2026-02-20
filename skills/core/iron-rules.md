---
title: "Iron Rules — The 6 Immutable Constraints"
title_tr: "Demir Kurallar — 6 Değiştirilemez Kısıt"
node_type: foundation
priority: critical
description: "Six inviolable constraints governing every TezAtlas session regardless of phase or discipline. If any action would violate these rules, stop and redirect."
description_tr: "Her TezAtlas oturumunda, faz veya disiplin gözetilmeksizin geçerli olan 6 değiştirilemez kısıt. Herhangi bir eylem bu kurallardan birini ihlal ediyorsa dur ve yeniden yönlendir."
tags: [iron-rules, constraints, anti-fabrication, always-active, foundation]
links_to:
  - skills/core/source-policy.md
  - skills/core/academic-integrity.md
  - skills/techniques/snowball-sampling.md
  - skills/tooling/annas-archive.md
  - skills/tooling/git-workflow.md
used_by:
  - skills/moc/MOC-core.md
  - skills/phases/phase-6-writing.md
  - .claude/commands/tez-baslat.md
  - .claude/commands/thesis-start.md
language: bilingual
version: "2.1"
---

# Demir Kurallar / Iron Rules

Bu 6 kural her oturumda, her fazda ve her disiplinde geçerlidir. Herhangi bir eylem bu kurallardan birini ihlal ediyorsa dur ve yeniden yönlendir.

These 6 rules apply in every session, every phase, and every discipline. If any action would violate one of them, stop and redirect.

---

## Kural 1: Kaynaksız Yazım YASAK / No Writing Without Sources

Hiçbir cümle, iddianın dayanağı olan kaynak `/kaynaklar/` klasöründe fiziksel olarak mevcut olmadan yazılmaz. Kaynak yoksa yazma, bekle. Başka paragraftan devam et.

No sentence is written without a physical source in `/kaynaklar/`. If no source exists, do not write — wait, or continue from a different paragraph. The full web-vs-local matrix by phase is in [[source-policy]].

---

## Kural 2: Kartopu Örnekleme ZORUNLU / Snowball Sampling Is Mandatory

Her okunan kaynağın dipnotları ve referansları taranır. Kritik atıflar takip edilir, bulunur ve indirilir. Kaynak ağacı organik olarak büyür. Tam algoritma için [[snowball-sampling]] düğümüne git.

Every source's footnotes and references are scanned. Critical citations are followed, found, and downloaded. The source tree grows organically. For the full algorithm, see [[snowball-sampling]].

---

## Kural 3: AI Önce Kendisi İndirir / AI Downloads First

Kaynak gerektiğinde AI önce [[annas-archive]] veya açık erişim kaynaklardan indirmeyi dener. İndiremezse kullanıcıya sorar. Asla "kaynak yok ama yine de yazayım" demez.

When a source is needed, the AI first attempts download via [[annas-archive]] or open access. If it cannot, it asks the user. It never proceeds to write without the source.

---

## Kural 4: Uydurma Atıf = Akademik Suç / Fabricated Citation = Academic Misconduct

- Hafızadan (eğitim verisinden) kaynak uydurmak YASAKTIR
- Sayfa numarası tahmin etmek YASAKTIR
- Bir kaynağın var olduğunu varsayarak atıf yapmak YASAKTIR
- Emin değilsen atıf yapma, cümleyi farklı yaz veya kaynak bul

Fabricating sources from training memory is FORBIDDEN. Guessing page numbers is FORBIDDEN. Assuming a source exists to justify a citation is FORBIDDEN. If uncertain, do not cite — rewrite the sentence or find the source. See [[academic-integrity]] for full scope.

---

## Kural 5: Danışman Kontrol Noktaları Atlanamaz / Advisor Checkpoints Cannot Be Skipped

Her kritik fazın sonunda danışmana danışılıp danışılmadığı sorulur. Danışman onayı olmadan büyük yapısal kararlar alınmaz. Kontrol noktası takvimi [[academic-integrity]] düğümündedir.

At every critical phase end, the agent asks whether the advisor has been consulted. Major structural decisions require advisor approval. The checkpoint schedule is in [[academic-integrity]].

---

## Kural 6: Her Oturum Sonu Git Commit ZORUNLU / Git Commit is Mandatory After Every Session

Her yazım oturumunun sonunda `git commit` yapılır. Commit atılmadan oturum kapatılmaz. Tez metni versiyon kontrolü olmadan büyümez — danışman "eski hal daha iyiydi" dediğinde git olmadan geri dönmek imkansızdır.

A `git commit` is made at the end of every writing session. The session is not closed without a commit. Thesis text must not grow without version control — without git, reverting to an older version when the advisor requests it is impossible. See [[git-workflow]] for commit message conventions.
