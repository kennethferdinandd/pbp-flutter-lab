# counter_7

Kenneth Ferdinand <br>
2106750282 <br>
D

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless Widget adalah sebuah widget yang tidak pernah berubah, sementara untuk Stateful Widget bisa berubah (dinamis).
Perbedaannya :

- Stateless tidak berubah (Misalnya ada text yang terdapat pada aplikasi tidak berubah jika kita melakukan action pada aplikasi tersebut)
- Stateful bisa berubah (Misalnya ada text yang terdapat pada aplikasi dan text tersebut bisa berubah jika kita melakukan action pada aplikasi tersebut)

##  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Scaffold : Widget utama untuk membuat sebuah halaman pada flutter
- Row      : Digunakan untuk mendisplay widget dalam format row
- Column   : Digunakan untuk mendisplay widget dalam format column
- Text     : Digunakan untuk mendisplay string dalam 1 baris

##  Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState berfungsi ketika terjadi perubahan yang ada pada program. Jika terdapat perubahan, maka aplikasi akan dibuild ulang dan displaynya akan berubah sesuai dengan state yang mengalami perubahan. Jika ada perubahan pada suatu variabel namun tidak di set statenya, maka tidak akan terjadi apapun.

## Jelaskan perbedaan antara const dengan final.

final dan const keduanya merupakan sebuah variable immutable. Const harus sudah ada saat program dikompilasi dan nilainya bersifat konstan sedangkan untuk final dapat diketahui atau belum nilainya saat waktu kompilasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat proyek flutter baru dengan command `flutter create app counter_7`
2. Membuat fungsi "_decrementCounter" untuk decrement counter.
3. Menambahkan conditionals untuk menampilkan text yang sesuai dengan ketentuan.
4. Tampilkan button untuk decrement dan setting stylingnya
5. Atur styling untuk semua component

## Tugas 8

##  Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.

Navigator.push menambah rute ke dalam stack di page yang sedang dilihat. Semetara, Navigator.pushReplacement mengganti page sekarang dengan rute yang ingin kita push.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Material App : Berguna sebagai root dari sebuah aplikasi
- Scaffold : Berguna menjadi struktur dasar suatu aplikasi 
- Text : Berguna untuk mendisplay string dalam satu baris
- AppBar : Berguna untuk display toolbar widgets 
- Padding : Berguna untuk memberikan padding
- SizedBox : Berguna untuk sebagai box yang bisa diatur ukurannya
- Form : Berguna untuk menjadi formulir
- Container : Berguna untuk menggabungkan suatu elemen, menentukan posisi dan ukuran
- Column : Berguna untuk display child dalam format vertikal

##  Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

- onPressed
- onTap
- onChanged

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator yang ada pada Flutter mengimplementasikan ide stack. Navigator menyediakan method untuk mengubah tunpukan dengan push atau pop. Navigator.push untuk menavigasi ke halaman baru dan navigator.pop berguna untuk kembali dari halaman sekarang

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Tambahkan drawer atau hamburger pada aplikasi dengan 3 navigasi
2. Buat form untuk bisa menerima String, Integer, pilihan dan tanggal
3. Tambahkan button save
4. Buat function untuk mengirim data agar bisa ditampilkan pada budget data

## Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa. Kita dapat serialization secara manual yaitu dengan cara memanfaatkan built-in JSON decoder dari dart:convert. Kita bisa passing raw JSON String ke jsonDecode(), kemudian hasilnya akan tertera pada Map<String, dynamic>. Pembuatan model akan lebih baik sebelum melakukan pengambilan data JSON, karena jika kita mengambil banyak akan lebih mudah error dan susah untuk di manage, jika JSON field typo / tidak ada maka aka terjadi error saat runtime.

##  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Material App : Berguna sebagai root dari sebuah aplikasi
- Scaffold : Berguna menjadi struktur dasar suatu aplikasi 
- Text : Berguna untuk mendisplay string dalam satu baris
- AppBar : Berguna untuk display toolbar widgets 
- Padding : Berguna untuk memberikan padding
- Drawer : Berguna sebagai seperti sebuah navigation ke page tertentu yang ada di samping layar
- ListView : Berguna untuk mendisplay children satu persatu dalam scrolling direction
- SizedBox : Berguna untuk sebagai box yang bisa diatur ukurannya
- Container : Berguna untuk menggabungkan suatu elemen, menentukan posisi dan ukuran
- Column : Berguna untuk display child dalam format vertikal

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

1. Melakukan penambahan dependency http ke proyek, dependency ini berguna untuk pertukaran data melalui HTTP request, seperti GET, POST, PUT, dan lain-lain.

2. Melakukan pembuatan model sesuai dengan respons dari data yang berasal dari web service tersebut.

3. Melakukan pembuatan http request ke web service menggunakan dependency http.

4. Melakukan konversi objek yang didapatkan dari web service ke model yang telah kita buat di langkah kedua.

5. Melakukan penampilan data yang telah dikonversi ke aplikasi dengan FutureBuilder.

##  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat page baru yang nantinya akan ditambahkan ke drawer untuk watchlist

2. Pembuatan model yang sesuai untuk data JSON mywathlist

3. Pembuatan function untuk fetch data JSON

4. Tampilkan data pada widget

5. Membuat page detail untuk data


