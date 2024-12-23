# Tugas 7

[X] Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
1) Stateless Widget: Widget yang tidak memiliki state internal dan tidak dapat berubah setelah dibuat. Artinya, ketika widget dibuat, tampilan atau isi dari widget tersebut akan tetap sama, kecuali seluruh widget direbuild oleh Flutter. Stateless widget cocok untuk UI yang statis atau hanya memerlukan tampilan tanpa interaksi dinamis yang kompleks.
2) Stateful Widget: Widget yang memiliki state internal yang dapat berubah-ubah selama siklus hidup widget tersebut. Stateful widget memungkinkan tampilan untuk memperbarui diri tanpa perlu melakukan rebuild seluruh aplikasi. Widget ini biasanya digunakan untuk UI yang membutuhkan perubahan atau interaksi pengguna, seperti perubahan warna, teks, atau animasi.
3) Perbedaan Utama: Stateless widget hanya dapat di-render sekali dan tidak memperbarui tampilan setelah dibuat.
Stateful widget memiliki State yang bisa diubah, memungkinkan widget untuk merespons interaksi pengguna dan memperbarui UI secara dinamis.

[X] Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
1) Scaffold: Menyediakan struktur dasar halaman dengan bagian-bagian penting seperti appBar, body, dan backgroundColor. Ini adalah widget dasar yang biasanya digunakan sebagai tata letak utama di aplikasi Flutter.
2) AppBar: Menyediakan bagian atas halaman yang berisi judul aplikasi atau informasi lainnya. Dalam aplikasi ini, AppBar menampilkan judul "Pacil Shop".
3) Center: Mengatur widget anak (child) agar berada di tengah dari halaman atau tata letak yang diberikan.
4) Column: Menyusun widget anak dalam tata letak vertikal. Dalam proyek ini, Column digunakan untuk menampilkan teks sambutan dan tombol secara vertikal.
5) GridView: Menyusun widget anak dalam bentuk grid. Di sini, GridView.count digunakan untuk menampilkan tombol dalam 3 kolom, agar tata letaknya rapi dan seimbang.
6) Material: Membuat kartu dengan latar belakang warna yang bisa dikustomisasi. Material widget ini juga mendukung efek tap, terutama saat digunakan dengan InkWell.
7) InkWell: Menambahkan efek visual ketika pengguna menekan kartu atau area tertentu, serta memungkinkan fungsi onTap untuk menangani interaksi pengguna.
8) Icon: Menampilkan ikon dengan tipe tertentu (seperti Icons.view_list, Icons.add, Icons.logout).
Text: Menampilkan teks di layar dengan gaya atau warna yang bisa diatur.
9) SnackBar: Menampilkan pesan sementara di bagian bawah layar ketika tombol ditekan, memberikan feedback kepada pengguna.

[X] Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi setState() digunakan dalam StatefulWidget untuk memberi tahu Flutter bahwa ada perubahan dalam state widget yang memerlukan pembaruan UI. Ketika setState() dipanggil, Flutter secara otomatis melakukan rebuild pada widget tersebut dengan nilai-nilai terbaru. Variabel-variabel yang terpengaruh oleh setState() adalah variabel-variabel yang diubah di dalam fungsi tersebut dan yang digunakan di build() method. Contoh umum adalah perubahan pada variabel yang mewakili status tombol, data daftar, atau elemen interaktif lainnya.

[X] Jelaskan perbedaan antara const dengan final.
1) const: Digunakan untuk nilai konstan waktu kompilasi, yang artinya nilai harus diketahui pada saat program dikompilasi dan tidak dapat diubah. const membuat variabel benar-benar tidak dapat diubah dan seluruh instance const dengan nilai yang sama hanya disimpan sekali dalam memori.
2) final: Digunakan untuk nilai yang hanya dapat ditetapkan satu kali dan tidak perlu diketahui pada waktu kompilasi, bisa ditetapkan pada runtime. final memungkinkan variabel untuk diinisialisasi hanya sekali, dan setelah itu nilainya tidak bisa diubah, tetapi nilainya dapat dihitung pada saat runtime.

[X] Implementasi checklist
1) Membuat Proyek Pacil Shop
   - Proyek Pacil Shop dibuat dengan command `flutter create pacil_shop_mobile`. Proyek ini bertujuan untuk membuat aplikasi sederhana dengan tiga tombol utama yang merepresentasikan fitur-fitur utama: melihat daftar produk, menambah produk, dan logout.

2) Membuat Tiga Tombol Sederhana dengan Ikon dan Teks
   - Tiga tombol utama untuk Lihat Daftar Produk, Tambah Produk, dan Logout dibuat dalam bentuk item `ItemHomepage` yang diinisialisasi di dalam variabel `items` pada class MyHomePage.
   - Setiap tombol memiliki ikon dan teks yang sesuai:
       - Lihat Daftar Produk dengan ikon `Icons.list`
       - Tambah Produk dengan ikon `Icons.add`
       - Logout dengan ikon `Icons.logout`
   - Tombol-tombol ini dirender dalam bentuk `GridView.count` di dalam body widget `Scaffold`, dengan setiap item direpresentasikan oleh `ItemCard`.

3) Warna-warna tombol sudah diimplementasikan pada setiap `ItemHomepage` sebagai berikut:
       - Lihat Daftar Produk memiliki warna biru `Colors.blue`
       - Tambah Produk memiliki warna hijau `Colors.green`
       - Logout memiliki warna merah `Colors.red`

4) Setiap warna diterapkan pada properti `color` di dalam `ItemHomepage` dan digunakan dalam `ItemCard` melalui `Material(color: item.color)` untuk mewarnai latar belakang setiap tombol.

5) Fungsi `onTap` pada `InkWell` di dalam `ItemCard` akan memunculkan `Snackbar` ketika tombol ditekan.

6) Snackbar menampilkan pesan dinamis yang sesuai dengan tombol yang ditekan, berkat penggunaan `item.name` untuk menentukan nama tombol.
       - Jika tombol Lihat Daftar Produk ditekan, maka Snackbar akan menunjukkan "Kamu telah menekan tombol Lihat Daftar Produk".
       - Jika tombol Tambah Produk ditekan, Snackbar akan menunjukkan "Kamu telah menekan tombol Tambah Produk".
       - Jika tombol Logout ditekan, Snackbar akan menunjukkan "Kamu telah menekan tombol Logout".

7) Untuk memastikan Snackbar tidak bertumpuk, kode menggunakan `ScaffoldMessenger.of(context)..hideCurrentSnackBar()` sebelum menampilkan Snackbar baru.

# Tugas 8

[X] Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
1. Kegunaan const di Flutter: Kata kunci const di Flutter digunakan untuk membuat objek yang tidak berubah atau bersifat immutable. Dengan mendeklarasikan widget atau objek 
sebagai const, Flutter dapat menghemat sumber daya karena tidak perlu membangun ulang objek tersebut setiap kali UI diperbarui.

2. Keuntungan menggunakan const:
*  Efisiensi: Mengurangi konsumsi memori dan mempercepat rendering, karena objek const tidak perlu dibuat ulang.
* Optimalisasi Performa: Dengan menandai objek sebagai const, Flutter dapat memanfaatkan caching sehingga performa aplikasi meningkat.
* Keamanan kode: Membuat kode lebih aman dari modifikasi tidak disengaja, karena objek yang dideklarasikan const tidak dapat diubah.

3. Kapan sebaiknya menggunakan const:
* Gunakan const ketika membuat widget yang tidak bergantung pada perubahan nilai state atau input. Contohnya, untuk teks atau ikon yang bersifat statis.
* Sebaiknya tidak menggunakan const ketika widget bergantung pada variabel dinamis yang dapat berubah saat aplikasi berjalan.

[X] Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
1. Penggunaan Column dan Row di Flutter:
* Column adalah widget yang menampilkan anak-anaknya secara vertikal (atas ke bawah), sementara Row menampilkan anak-anaknya secara horizontal (kiri ke kanan).
* Column dan Row sangat bermanfaat dalam membuat layout secara fleksibel di Flutter. Keduanya memiliki properti mainAxisAlignment dan crossAxisAlignment yang memungkinkan pengaturan posisi elemen-elemen di dalamnya.

2. Contoh implementasi:
* Column:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
)
```

* Row:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.settings),
  ],
)
```

[X] Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
* Misalnya, pada form ini digunakan elemen-elemen input seperti TextField, Checkbox, RadioButton, atau DropdownButton.
* Elemen input Flutter lain yang mungkin tidak digunakan di tugas ini bisa termasuk Slider, Switch, atau DatePicker. Elemen-elemen ini bisa dipilih tergantung kebutuhan form; jika form tidak memerlukan pemilihan tanggal atau input dalam rentang nilai, maka elemen-elemen tersebut bisa saja tidak dimasukkan.

[X] Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
* Dalam Flutter, pengaturan tema dilakukan melalui ThemeData di MaterialApp. Ini memungkinkan kita mengatur warna, teks, bentuk tombol, dan elemen lainnya secara konsisten di seluruh aplikasi.
* Jika tema diimplementasikan, contohnya:
```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18.0, color: Colors.black),
    ),
  ),
)
```
* Tema membuat aplikasi lebih konsisten dan memudahkan perubahan desain secara menyeluruh

[X] Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
* Navigasi di Flutter biasanya ditangani menggunakan Navigator dan Route. Kita bisa mendorong halaman baru ke tumpukan dengan Navigator.push, dan kembali ke halaman sebelumnya dengan Navigator.pop.
* Contoh navigasi sederhana:
```dart
// Navigasi ke halaman baru
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HalamanBaru()),
);
```

# Tugas 9

[X] Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

Model berfungsi sebagai representasi data dalam struktur yang terorganisir sehingga lebih mudah untuk diolah, diproses, dan divalidasi. Membuat model memiliki beberapa keuntungan:

* Efisiensi: Mempermudah parsing data JSON menjadi objek yang dapat digunakan langsung dalam kode.
* Keamanan: Mencegah kesalahan seperti akses pada properti yang tidak ada atau salah tipe data.
* Pemeliharaan: Kode lebih mudah dibaca dan dirawat karena struktur data jelas.

Jika kita tidak membuat model terlebih dahulu, error mungkin terjadi ketika kita mencoba mengakses atau memanipulasi data secara langsung. Kesalahan tipe data atau nama properti yang salah dalam JSON dapat menyebabkan aplikasi crash atau menampilkan hasil yang salah.

[X] Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

Library http digunakan untuk mengirimkan permintaan (HTTP requests) dan menerima respons (HTTP responses) dari server. Fungsinya meliputi:

* Mengambil data dari server (GET): Digunakan untuk membaca data JSON atau HTML dari endpoint server.
* Mengirimkan data ke server (POST): Digunakan untuk mengirim data input pengguna (misalnya formulir) ke server.
* Mengelola komunikasi HTTP: Mendukung metode HTTP lain seperti PUT, DELETE, PATCH, dan HEAD.

Dalam tugas ini, library http memungkinkan aplikasi Flutter berkomunikasi dengan backend Django untuk melakukan operasi seperti login, register, atau mengambil data.

[X] Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest adalah objek yang digunakan untuk menangani autentikasi berbasis cookie dalam aplikasi Flutter. Fungsinya adalah:

* Menyimpan cookie secara otomatis: Untuk mengelola sesi pengguna yang autentik.
* Menyisipkan cookie di setiap permintaan: Agar server dapat mengenali permintaan berasal dari pengguna yang sudah login.
* Menjaga status autentikasi: Membantu memastikan bahwa hanya pengguna yang valid dapat mengakses data tertentu. 

Perlu dibagikan ke semua komponen antara lain karena:

* Semua bagian aplikasi yang membutuhkan data dari server memerlukan akses ke cookie untuk validasi sesi.
* Dengan membagikan instance CookieRequest, kita menjaga konsistensi dan efisiensi dalam mengelola status autentikasi pengguna di seluruh aplikasi.

[X] Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

1. Input Data:

* Pengguna memasukkan data (misalnya username dan password) melalui widget input seperti TextField atau TextFormField.

2. Pengiriman ke Server:

* Data input dikirim menggunakan POST request melalui CookieRequest atau library http.
* Data dikodekan menjadi format JSON sebelum dikirim ke backend.

3. Proses di Backend (Django):

* Backend menerima permintaan dan memproses data sesuai logika bisnis.
* Jika valid, backend mengirimkan respons dalam format JSON.

4. Penerimaan Data di Flutter:

* Flutter menerima respons JSON dari server.
* Data di-decode menggunakan fungsi seperti jsonDecode() dan dipetakan ke model data.

5. Menampilkan di UI:

* Data model kemudian ditampilkan dalam widget Flutter (seperti ListView, Card, atau Text).

[X] Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

1. Login:
* Pengguna memasukkan data akun (username & password) di Flutter.
* Flutter mengirim data ke endpoint Django menggunakan POST request.
* Django memverifikasi kredensial:
* Jika valid, Django mengembalikan cookie sesi untuk identifikasi pengguna.
* Flutter menyimpan cookie ini di instance CookieRequest.

2. Register:
* Data pendaftaran (username, password, dll.) dikirim ke Django menggunakan POST request.
* Django memvalidasi data (misalnya password harus sama di dua kolom).
* Jika berhasil, Django membuat akun dan memberikan respons sukses ke Flutter.

3. Logout:
* Flutter mengirim permintaan logout ke Django.
* Django menghapus cookie sesi dari server.
* Flutter menghapus data sesi lokal.

Setelah login berhasil, menu yang sesuai ditampilkan berdasarkan status autentikasi. Flutter memvalidasi status ini dengan memeriksa apakah cookie sesi aktif.

[X] Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

* Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter :
  * Membuat halaman register dengan input username, password, dan konfirmasi password. Formulir ini juga dilengkapi dengan validasi sederhana untuk memastikan input tidak kosong dan password cocok dengan konfirmasi password.
  * Ketika pengguna menekan tombol "Register", aplikasi mengirim request POST ke endpoint Django /auth/register/. Data dikirim dalam format JSON menggunakan CookieRequest yang berisi username, password1, dan password2.
  * Di Django, fungsi register() memvalidasi data yang diterima. Jika password cocok dan username belum ada di database, Django membuat akun pengguna baru menggunakan User.objects.create_user(). Jika registrasi berhasil, Django mengirimkan respons sukses ke Flutter dengan status 200.
  * Setelah menerima respons sukses, Flutter menampilkan notifikasi menggunakan SnackBar dan mengarahkan pengguna kembali ke halaman login menggunakan Navigator.pushReplacement().
* Membuat halaman login pada proyek tugas Flutter :
  * Membuat halaman login dengan dua input: username dan password. Halaman ini juga dilengkapi tombol "Login".
  * Ketika pengguna menekan tombol "Login", aplikasi mengirim request POST ke endpoint /auth/login/ di Django dengan menggunakan CookieRequest. Data dikirim dalam format JSON yang berisi username dan password.
  * Django menggunakan fungsi authenticate() untuk memverifikasi username dan password. Jika valid, Django membuat sesi pengguna dengan fungsi auth_login() dan mengirim cookie sesi kembali ke Flutter.
  * Jika login berhasil, Flutter menyimpan cookie sesi dan menampilkan pesan sukses menggunakan SnackBar. Aplikasi kemudian mengarahkan pengguna ke halaman utama (MyHomePage). Jika gagal, ditampilkan dialog error menggunakan AlertDialog.
* Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter :
  * Menggunakan library pbp_django_auth di Flutter yang mendukung autentikasi berbasis cookie. Ini memudahkan Flutter untuk menyimpan cookie sesi pengguna yang diterima dari Django.
  * Membagikan instance CookieRequest secara global menggunakan Provider sehingga semua komponen di aplikasi Flutter dapat mengakses sesi pengguna tanpa harus membuat instance baru.
  * Dengan menggunakan CookieRequest, setiap request yang dikirim dari Flutter secara otomatis menyertakan cookie sesi pengguna, memungkinkan backend Django untuk memverifikasi pengguna yang sedang login.
* Membuat model kustom sesuai dengan proyek aplikasi Django.
  * Mendapatkan contoh respons JSON dari endpoint Django yang mengembalikan daftar produk.
  * Menggunakan QuickType untuk mengubah respons JSON menjadi model Dart
  * Hasil konversi dari QuickType adalah model Dart yang dapat langsung digunakan di aplikasi Flutter.
* Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
  * Pada metode fetchProduct(), menggunakan CookieRequest untuk mengambil data dari API Django yang berlokasi di URL http://10.0.2.2:8000/json/ menggunakan metode GET.
  * JSON yang diterima kemudian diubah menjadi daftar objek Product menggunakan metode fromJson()
  * Jika data belum diterima, ditampilkan widget CircularProgressIndicator sebagai indikasi bahwa data sedang dimuat
  * Jika data sudah diterima dan terdapat produk, saya menggunakan ListView.builder untuk menampilkan daftar produk
  * Setiap item produk ditampilkan menggunakan widget Container dengan menampilkan model yang dimiliki tiap item
* Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item
  * Ketika pengguna menekan salah satu item pada halaman daftar, aplikasi menggunakan Navigator.push() untuk membuka halaman detail dan mengirim data item yang dipilih sebagai argumen
  * Pada halaman detail, saya menampilkan semua atribut item seperti name, price, description, dan stock. Saya menggunakan widget Text dan Padding untuk menampilkan informasi secara terstruktur
  * Tombol back otomatis dibuat dengan Navigator.push
* Melakukan Filter pada Halaman Daftar Item
  * Memodifikasi endpoint Django sehingga hanya mengembalikan item yang dibuat oleh pengguna yang sedang login. Di Django, menggunakan filter query berdasarkan pengguna (request.user)
  * Ketika mengambil data dari API Django, Flutter hanya menerima daftar item yang terkait dengan pengguna yang login