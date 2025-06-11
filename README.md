# To-Do List App with Firebase

## Nama Aplikasi
**ToDoList**

## Judul Project
**Aplikasi To-Do List dengan Firebase Authentication**

## Deskripsi Fungsionalitas
Aplikasi ini memungkinkan pengguna untuk:
- **Autentikasi**:
  - Mendaftar akun baru dengan email/sandi.
  - Login/logout menggunakan Firebase Auth.
- **Manajemen Tugas**:
  - Menambah, mengedit, dan menghapus tugas (CRUD).
  - Menandai tugas sebagai selesai/belum selesai.
  - Progress otomatis dalam bentuk persentase.
- **Sinkronisasi Real-Time**:
  - Data tersimpan di Cloud Firestore dan update secara real-time.

## Teknologi
- **Frontend**:
  - Flutter (Dart)
  - Paket: `google_fonts`, `fluttertoast`
- **Backend**:
  - Firebase Auth (Autentikasi)
  - Cloud Firestore (Database)
  - Paket: `firebase_core`, `firebase_auth`, `cloud_firestore`

## Cara Menjalankan
1. Install dependensi:
   ```bash
   flutter pub get
