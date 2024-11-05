# biyung

## Premium Creations made with Love ❤️

## Tugas 7: Elemen Dasar Flutter
### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Dalam pengembangan aplikasi dengan Flutter, terdapat dua jenis widget utama: **Stateless Widget** dan **Stateful Widget**. Keduanya memiliki fungsi dan karakteristik yang berbeda.

1. **Stateless Widget**  
   Stateless widget adalah widget yang tidak memiliki state yang bisa berubah setelah widget tersebut dibuat. Dengan kata lain, sifat atau tampilannya tidak berubah selama siklus hidup widget tersebut. Stateless widget cocok digunakan untuk komponen UI yang tidak memerlukan perubahan data atau interaksi pengguna yang kompleks. Contoh stateless widget adalah `Text`, `Icon`, dan `Image`.

   Contoh penggunaan Stateless Widget:
   ```dart
   class MyStatelessWidget extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Text('Hello, World!');
     }
   }
   ```

2. **Stateful Widget**  
   Stateful widget adalah widget yang memiliki state yang dapat berubah sepanjang siklus hidup widget tersebut. Jika suatu widget membutuhkan perubahan tampilan berdasarkan interaksi pengguna atau perubahan data, maka Stateful Widget adalah pilihan yang tepat. Contoh penggunaan yang umum adalah ketika Anda ingin membuat tombol yang bisa diklik atau teks yang berubah ketika ada input dari pengguna.

   Contoh penggunaan Stateful Widget:
   ```dart
   class MyStatefulWidget extends StatefulWidget {
     @override
     _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
   }

   class _MyStatefulWidgetState extends State<MyStatefulWidget> {
     int counter = 0;

     void incrementCounter() {
       setState(() {
         counter++;
       });
     }

     @override
     Widget build(BuildContext context) {
       return Column(
         children: [
           Text('Counter: $counter'),
           ElevatedButton(
             onPressed: incrementCounter,
             child: Text('Increment'),
           ),
         ],
       );
     }
   }
   ```

### Perbedaan antara Stateless Widget dan Stateful Widget

| Stateless Widget                         | Stateful Widget                               |
|------------------------------------------|-----------------------------------------------|
| Tidak memiliki state yang bisa berubah.   | Memiliki state yang bisa berubah selama siklus hidupnya. |
| Digunakan untuk tampilan statis.         | Digunakan untuk tampilan dinamis yang bisa berubah sesuai interaksi. |
| Tidak memiliki metode `setState()`.       | Memiliki metode `setState()` untuk memperbarui UI. |
| Biasanya lebih ringan dan cepat.         | Bisa lebih berat karena melibatkan perubahan state. |

### _Widget_ yang digunakan pada proyek ini dan jelaskan fungsinya
1. **Material**
  - SnackBar
2. 
