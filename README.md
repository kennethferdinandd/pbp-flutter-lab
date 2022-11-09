# counter_7

Kenneth Ferdinand
2106750282
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

