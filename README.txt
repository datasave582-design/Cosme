VIKAASOFTTECH COSMETICS PRO
============================

PC APP-STYLE LAUNCH
-------------------
1. Extract this folder.
2. On Windows with Python installed, double-click START_Vikaasofttech.bat.
3. It opens the app in Microsoft Edge/Chrome app-style mode.
4. First run: create the admin username and password.

BILLING + BARCODE
-----------------
- Connect a USB barcode scanner to the PC.
- Open New Sale.
- Scan a product barcode. The scanner normally types the code and sends Enter.
- Matching product is added automatically.
- Scan the same barcode again to increase quantity.
- Stock is checked before adding/selling.
- Complete Sale reduces stock and creates an invoice.
- Print the invoice from the completed-sale window.

IMPORTANT
---------
This is a local-first browser application using IndexedDB. The login password is
stored as a salted PBKDF2-SHA-256 hash. Keep regular JSON backups. For multi-PC,
cloud sync, user roles, remote backup, or server-side security, a backend is needed.

FILES
-----
index.html              Main application
manifest.webmanifest    PWA metadata
sw.js                   Service worker
START_Vikaasofttech.bat PC app-style launcher
