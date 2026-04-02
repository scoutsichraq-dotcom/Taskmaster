**نشر وإصدار TaskMaster Pro (Windows) — دليل سريع**

ملف هذا الدليل يشرح كيف تنشر المثبّت إلى GitHub Releases مع توقيع اختياري.

1) تأكد من تحديث `package.json`
- افتح `package.json` وابحث عن الحقل `build.publish`، ثم عيّن القيم الحقيقية:
  - `owner`: اسم حساب GitHub الخاص بك
  - `repo`: اسم المستودع

2) إعداد أسرار GitHub (Repository Secrets)
- اذهب إلى المستودع على GitHub → Settings → Secrets and variables → Actions
- أضف الأسرار التالية إذا أردت توقيعًا أوتوماتيكيًا:
  - `CSC_LINK` = (اختياري) رابط آمن إلى ملف الشهادة `.p12/.pfx` أو محتوى base64
  - `CSC_KEY_PASSWORD` = (اختياري) كلمة مرور الشهادة

ملحوظة: GitHub Actions يوفر `GITHUB_TOKEN` تلقائياً لذلك لا تحتاج إلى إضافته يدوياً.

3) ارفع الكود وأضف Tag لإطلاق الإصدار
- من جهازك المحلي شغّل:

```bash
# استبدل v1.0.0 بالنسخة المناسبة
git add .
git commit -m "Release v1.0.0"
git tag v1.0.0
git push origin main
git push origin v1.0.0
```

- عند دفع الوسم `v1.0.0` سيبدأ workflow الموجود في `.github/workflows/release.yml` ويُنشئ Release مع الملفات.

4) اختبار محلي سريع قبل الرفع
- لتوليد ZIP وملف unpacked محليًا:

```powershell
# بناء الواجهة
npm run build:vite
# إنشاء الحزمة غير المضغوطة (electron-builder)
npx electron-builder --win --x64 --dir
# (اختياري) إنشاء ZIP من out\win-unpacked
Compress-Archive -Path .\out\win-unpacked\* -DestinationPath .\out\TaskMasterPro-win-x64.zip -Force
```

5) توقيع رقمي (موصى به للتوزيع التجاري)
- يمكنك توقيع المثبّت باستخدام شهادة تجارية (`.pfx`). أفضل الممارسات:
  - ضع ملف `pfx` في مكان آمن أو استخدم `CSC_LINK` ليحمل GitHub Actions الملف أثناء البناء.
  - أو استخدم `signtool` محلياً بعد بناء المثبّت:

```powershell
# مثال محلي لتوقيع (تحتاج Windows SDK)
signtool sign /f "C:\path\to\your.pfx" /p "PFX_PASSWORD" /tr http://timestamp.digicert.com /td sha256 /fd sha256 "out\TaskMaster Pro-Setup-1.0.0.exe"
```

6) نشر يدوي (بدون CI)
- افتح صفحة GitHub Releases في المستودع وأنشئ Release جديدًا ثم ارفق الملفات من `out/` (مثلاً `TaskMaster Pro-Setup-1.0.0.exe` و/أو ZIP).

7) ملاحظات أمان وتأمين
- تأكد من عدم تضمين مفاتيح أو شهادات داخل الكوميتات.
- لا توزع المفاتيح/شهادات غير الموقعة علناً.

إذا تريد، أستطيع:
- أ) استبدال `REPLACE_WITH_...` في `package.json` تلقائياً إذا أعطيتني اسم المستخدم واسم الريبو.
- ب) تشغيل `git tag` و`git push` هنا (أحتاج وصول Git مُصادق أو أن تفعلها محليًا).
- ج) إعداد توقيع أوتوماتيكي في الـ workflow مع رفع شهادة مشفّرة (أرشدك خطوة بخطوة).

اختر أحد الخيارات أعلاه أو قل "ابدأ النشر" لأقوم بتوجيه كامل أو تنفيذ الأوامر التي تسمح بها صلاحياتك.