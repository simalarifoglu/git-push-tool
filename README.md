# git-push-tool

Tekrarlayan Git iş akışını tek bir komutla yürüten, platform bağımsız bir otomasyon aracıdır.

---

## Desteklenen Platformlar

| Dosya | Ortam |
|-------|-------|
| `git-push.bat` | Windows (CMD) |
| `git-push.sh` | Linux / macOS / WSL |

---

## Çalışma Prensibi

Script çalıştırıldığında sırasıyla aşağıdaki adımları uygular:

1. Geçerli dizinin bir Git deposu olup olmadığını doğrular
2. Çalışma ağacında değişiklik bulunmadığı durumda işlemi sonlandırır
3. Değişen dosyaları ve fark özetini ekrana yazdırır
4. `git add .` ile tüm değişiklikleri hazırlama alanına alır
5. Kullanıcıdan commit mesajı alır; boş geçilmesine izin vermez
6. Commit oluşturur ve uzak depoya iletir

---

## Kurulum

Uygun dosyayı proje dizinine kopyalayın.

**Linux / macOS / WSL** için çalıştırma izni verin:
```bash
chmod +x git-push.sh
```

---

## Kullanım

**Windows:**
```cmd
git-push.bat
```

**Linux / macOS / WSL:**
```bash
./git-push.sh
```

---

## Örnek Çıktı

```
==========================================
  GIT PUSH SCRIPT
==========================================

[STATUS] Current changes:
 M src/app.js
 M src/utils.js
?? config/settings.json

[DIFF] Changes summary:
 src/app.js          | 12 ++++++------
 src/utils.js        |  4 ++--
 config/settings.json|  8 ++++++++

[ADD] Adding all changes...
[OK] All changes added

[COMMIT] Enter your commit message: kullanıcı doğrulama modülü güncellendi

[COMMIT] Creating commit...
[OK] Commit created successfully

[PUSH] Pushing to remote...

==========================================
  [OK] PUSH SUCCESSFUL!
==========================================
```

---

## Ön Koşullar

- Git 2.x veya üzeri
- Yapılandırılmış uzak depo (`origin`)
- Windows için [Git for Windows](https://git-scm.com)

---

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır. 
Detaylar için `LICENSE` dosyasını inceleyebilirsiniz.