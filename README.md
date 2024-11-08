# biyung

## Premium Creations made with Love ❤️

# Tugas 7: Elemen Dasar Flutter
### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
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

#### Perbedaan antara Stateless Widget dan Stateful Widget

| Stateless Widget                         | Stateful Widget                               |
|------------------------------------------|-----------------------------------------------|
| Tidak memiliki state yang bisa berubah.   | Memiliki state yang bisa berubah selama siklus hidupnya. |
| Digunakan untuk tampilan statis.         | Digunakan untuk tampilan dinamis yang bisa berubah sesuai interaksi. |
| Tidak memiliki metode `setState()`.       | Memiliki metode `setState()` untuk memperbarui UI. |
| Biasanya lebih ringan dan cepat.         | Bisa lebih berat karena melibatkan perubahan state. |

### 2. _Widget_ yang digunakan pada proyek ini dan jelaskan fungsinya
Berikut adalah beberapa _widget_ yang digunakan dalam proyek ini beserta fungsinya:
1. **SnackBar**
   Pesan singkat tentang proses aplikasi yang muncul di bawah layar apabila sebuah tombol dipencet.
2. **AppBar**
   Container yang menampilkan konten dan aksi di atas layar.
3. **InfoCard**
   Container untuk konten yang singkat dan ditampilkan di dalam kotak berisi nama, NPM, dan kelas.
4. **Column**
   Tata letak list dari child widgets yang diletakkan secara vertikal.
5. **Container**
   Sebuah widget yang menggabungkan pegecatan umum, penentuan posisi, dan pengukuran.   
6. **Row**
   Tata letak list dari child widgets yang diletakkan secara horizontal.
7. **Scaffold**
   Mengimplementasikan struktur tata letak visual Desain Material dasar yang menyediakan API untuk menampilkan _drawers_, _snack bars_, _bottom sheets_.
8. **Text**
   Text dengan satu style.

### 3. Fungsi dari setState() dan variabel yang dapat terdampak dengan fungsi tersebut
Fungsi `setState()` dalam Flutter digunakan untuk memperbarui tampilan (UI) ketika ada perubahan pada state (data atau variabel) dalam sebuah **Stateful Widget**. Setiap kali `setState()` dipanggil, Flutter akan memicu proses rebuild pada widget yang memiliki perubahan state, sehingga tampilan dapat menampilkan data terbaru.

#### Fungsi setState()
Pada dasarnya, `setState()` memberitahu Flutter bahwa ada sesuatu yang berubah dan tampilan perlu diperbarui. Ketika Anda memanggil `setState()`, Anda meletakkan perubahan state di dalam blok fungsi tersebut. Flutter kemudian akan melihat perubahan tersebut, dan secara otomatis me-render ulang UI sesuai data terbaru.

Contoh sederhana `setState()`:
```dart
int counter = 0;

void incrementCounter() {
  setState(() {
    counter++; // Ini adalah variabel yang diperbarui menggunakan setState
  });
}
```

Dalam contoh ini, `counter` akan bertambah setiap kali `incrementCounter()` dipanggil, dan UI akan diperbarui untuk menampilkan nilai `counter` terbaru.

#### Variabel yang Dapat Terdampak dengan setState()
Variabel yang bisa terpengaruh oleh `setState()` adalah variabel-variabel yang:
1. **Didefinisikan dalam State class** dari Stateful Widget.
2. **Menentukan tampilan widget** secara langsung atau tidak langsung, seperti nilai teks, warna, posisi, atau data yang ditampilkan pada UI.

Berikut adalah contoh variabel yang umum diperbarui menggunakan `setState()`:

1. **Data angka atau string**: Misalnya untuk menampilkan jumlah klik atau teks yang berubah.
2. **Status UI**: Seperti warna atau opacity untuk mengganti tampilan.
3. **Daftar atau koleksi data**: Seperti `List`, yang bisa diperbarui untuk menambahkan atau menghapus item.
4. **Boolean flags**: Misalnya `isLoading` untuk menunjukkan status pemuatan data.

### 4. Perbedaan antara `const` dan `final`

1. **Waktu Penetapan Nilai**:
   - **`const`**: Nilai variabel `const` harus sudah diketahui saat compile-time (sebelum program dijalankan). Artinya, nilai ini harus berupa data yang sudah ditentukan dan tidak berubah selama program berjalan.
   - **`final`**: Nilai variabel `final` diinisialisasi saat runtime (ketika program berjalan) dan hanya bisa diatur satu kali. Ini memungkinkan kita untuk menetapkan nilai dari hasil operasi atau perhitungan yang hanya diketahui saat runtime.

2. **Penggunaan pada Object**:
   - **`const`**: Objek yang dideklarasikan dengan `const` akan menjadi objek yang benar-benar immutable. Tidak hanya variabelnya yang tidak bisa diubah, tetapi seluruh isi dari objek tersebut juga tidak bisa diubah.
   - **`final`**: Dengan `final`, objek itu sendiri tidak dapat diubah (referensinya tetap), tetapi isi dari objek tersebut masih bisa diubah jika tipe data yang digunakan mendukung perubahan (misalnya, daftar `List` yang tidak menggunakan `const`).

3. **Konteks Penggunaan**:
   - **`const`**: Digunakan untuk nilai yang bersifat konstan dan sudah diketahui, seperti angka, string tetap, atau objek yang tidak berubah.
   - **`final`**: Digunakan ketika kita ingin menetapkan nilai satu kali tetapi nilainya baru diketahui pada saat runtime, seperti hasil dari fungsi atau input dari pengguna.

#### Contoh Penggunaan

```dart
void main() {
  // Menggunakan const
  const int x = 10; // Nilai 10 sudah diketahui saat compile-time
  const List<int> numbers = [1, 2, 3]; // Tidak bisa diubah isinya

  // Menggunakan final
  final DateTime now = DateTime.now(); // Nilai diinisialisasi saat runtime
  final List<int> mutableList = [4, 5, 6]; // Referensi tetap, tapi isi list bisa diubah
  mutableList.add(7); // Masih diperbolehkan, karena yang final adalah referensinya
}
```

#### Tabel Perbedaan

| Aspek               | `const`                                     | `final`                                       |
|---------------------|---------------------------------------------|-----------------------------------------------|
| Waktu inisialisasi  | Compile-time                                | Runtime                                       |
| Nilai yang bisa di-set | Nilai tetap, harus diketahui sebelumnya   | Nilai tetap setelah diinisialisasi satu kali  |
| Penggunaan untuk objek | Objek benar-benar immutable               | Referensi objek tetap, isi objek bisa berubah |

### 5. Implementasi _checklist-checklist_
1. Membuat program Flutter baru dengan tema E-Commerce
   Membuat proyek baru dengan nama Biyung
   ```
      flutter create biyung
      cd biyung
   ```
   Setelah pembuatan proyek, struktur kode dapat dirapikan dengan membuat file baru bernama `menu.dart`.  Dalam direktori `lib/`, beberapa class yang sebelumnya ada di `main.dart` dipindahkan ke dalam file baru tersebut agar proyek lebih terstruktur dan rapi. Ada perubahan dari `StatefulWidget` ke `StatelessWidget`.
3. Membuat tiga tombol sederhana dengan ikon dan teks
   - Menambahkan class `ItemHomePage` yang berisi atribut-atribut dari card (nama dan icon).
     ```
         class ItemHomepage {
           final String name;
           final IconData icon;
      
           ItemHomepage(this.name, this.icon);
          }
     ```
     Kode ini diletakkan di dalam file `menu.dart` , di luar struktur `MyHomePage` dan `InfoCard`.
   - Membuat list di ItemHomePage yang di dalamnya berisi tombol-tombol yang ingin ditampilkan pada Home Page dan akan ditambahkan ke MyHomePage.
     ```
        class MyHomePage extends StatelessWidget {  
           ...
           final List<ItemHomepage> items = [
               ItemHomepage("Lihat Daftar Produk", Icons.product),
               ItemHomepage("Tambah Produk", Icons.add),
               ItemHomepage("Logout", Icons.logout),
           ];
           ...
       }
     ```
   - Merubah file icons.dart yang menyesuaikan dengan Icons.product
     ```
      /// <i class="material-icons md-36">product</i> &#x2014; material icon named "product".
     static const IconData product = IconData(0xe3fe, fontFamily: 'MaterialIcons');
   
     /// <i class="material-icons-sharp md-36">product</i> &#x2014; material icon named "product" (sharp).
     static const IconData product_sharp = IconData(0xeaf8, fontFamily: 'MaterialIcons');
   
     /// <i class="material-icons-round md-36">product</i> &#x2014; material icon named "product" (round).
     static const IconData product_rounded = IconData(0xf8d7, fontFamily: 'MaterialIcons');
   
     /// <i class="material-icons-outlined md-36">product</i> &#x2014; material icon named "product" (outlined).
     static const IconData product_outlined = IconData(0xf1e5, fontFamily: 'MaterialIcons');
   
     /// <i class="material-icons md-36">product_bad</i> &#x2014; material icon named "product bad".
     static const IconData product_bad = IconData(0xe3ff, fontFamily: 'MaterialIcons');
   
     /// <i class="material-icons-sharp md-36">product_bad</i> &#x2014; material icon named "product bad" (sharp).
     static const IconData product_bad_sharp = IconData(0xeaf7, fontFamily: 'MaterialIcons');
   
     /// <i class="material-icons-round md-36">product_bad</i> &#x2014; material icon named "product bad" (round).
     static const IconData product_bad_rounded = IconData(0xf8d6, fontFamily: 'MaterialIcons');
   
     /// <i class="material-icons-outlined md-36">product_bad</i> &#x2014; material icon named "product bad" (outlined).
     static const IconData product_bad_outlined = IconData(0xf1e4, fontFamily: 'MaterialIcons');
     ```
4. Mengimplementasikan warna-warna yang berbeda untuk setiap tombol
   Dalam implementasi perubahan warna untuk masing-masing tombol, di dalam file `menu.dart`, ada penambahan kode di bagian `Widget build` untuk menargetkan warna spesifik ke masing-masing tombol.
   ```
      @override
        Widget build(BuildContext context) {
          // Perbedaan warna masing-masing tombol
          Color backgroundColor;
          switch (item.name) {
            case 'Lihat Produk':
              backgroundColor = Colors.indigo.shade800;
              break;
            case 'Tambah Produk':
              backgroundColor = Colors.blue.shade800;
              break;
            case 'Logout':
              backgroundColor = Colors.red.shade900;
              break;
            default:
              backgroundColor = Theme.of(context).colorScheme.secondary;
          }
      
          return Material(
            // Menentukan warna latar belakang dari tema aplikasi.
            color: backgroundColor,   
   ```
5. Memunculkan Snackbar dengan tulisan
   Apabila tombol ditekan, akan menampilkan snackbar  dengan pesan “Kamu telah menekan tombol [nama tombol].
   Dalam file `menu.dart` untuk memunculkan snackbar ketika masing-masing tombol dipencet, dapat menambahkan kode ini:
   ```
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
   ```
# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
### 1. Kegunaan const di Flutter. Keuntungan Menggunakan const pada Kode Flutter. Kapan sebaiknya menggunakan const, dan kapan sebaiknya tidak digunakan?
Di Flutter, kata kunci `const` digunakan untuk mendefinisikan *immutable* objects, yaitu objek yang tidak dapat diubah setelah dibuat. Dengan `const`, kita dapat membuat objek konstan di mana nilainya akan tetap sama selama aplikasi berjalan.

#### Kegunaan `const` di Flutter:
1. **Optimisasi Memori**: Ketika kita menggunakan `const`, Flutter tahu bahwa objek ini tidak akan berubah, sehingga Flutter dapat melakukan optimisasi dan hanya membuat satu salinan objek tersebut. Setiap kali kita menggunakan objek `const` dengan nilai yang sama, Flutter akan merujuk pada salinan yang sudah ada, alih-alih membuat objek baru. Hal ini dapat menghemat penggunaan memori.

2. **Kinerja Lebih Baik**: Karena Flutter tidak perlu membuat objek baru setiap kali kita memerlukan nilai yang sama, kinerja aplikasi menjadi lebih efisien. Penggunaan `const` dapat mengurangi overhead dalam proses rendering UI, terutama pada aplikasi yang memiliki banyak elemen statis.

3. **Membantu dalam *Hot Reload* dan *Hot Restart***: Karena objek `const` tidak berubah, Flutter dapat memanfaatkan cache dan mempercepat proses *hot reload* atau *hot restart*. Ini membuat pengembangan aplikasi lebih lancar dan responsif.

#### Kapan Sebaiknya Menggunakan `const`:
- **Widget Statis**: Gunakan `const` pada widget yang tidak akan berubah selama aplikasi berjalan, misalnya *text labels*, ikon, atau layout statis. Ini berguna saat kita membuat UI yang tidak interaktif atau bagian yang hanya perlu dirender sekali.
- **Data yang Bersifat Tetap**: Jika ada data yang nilainya konstan atau tidak perlu berubah, seperti nilai `color`, `padding`, atau `margin`, menggunakan `const` akan lebih efisien.
- **Penggunaan di Dalam Build Method**: Di dalam `build` method, jika ada widget atau elemen UI yang tidak berubah, menambahkan `const` bisa membantu meningkatkan kinerja.

#### Kapan Tidak Menggunakan `const`:
- **Objek yang Dinamis**: Jika objek akan berubah sesuai dengan state atau input pengguna, hindari penggunaan `const`. Misalnya, ketika kita membuat elemen UI yang responsif terhadap aksi pengguna, objek tersebut tidak seharusnya dideklarasikan dengan `const`.
- **Widget dengan Data yang Diambil Secara Asinkron**: Jika widget menampilkan data dari hasil pemanggilan API atau perubahan state lain, `const` tidak diperlukan karena widget akan perlu dirender ulang setiap kali data berubah.
### 2. Penjelasan dan Perbandingan Penggunaan Column dan Row pada Flutter. Contoh Implementasi dari Masing-Masing Layout Widget.
#### 1. `Column`
- `Column` digunakan untuk menempatkan widget secara vertikal, dari atas ke bawah.
- Biasanya digunakan saat kita ingin menampilkan elemen-elemen yang membutuhkan layout vertikal, seperti daftar item atau formulir.
- Atribut penting dalam `Column`:
  - `mainAxisAlignment`: Mengatur bagaimana widget di dalam `Column` disejajarkan secara vertikal (misalnya `start`, `center`, `end`, atau `spaceBetween`).
  - `crossAxisAlignment`: Mengatur sejajar atau tidaknya widget di dalam `Column` secara horizontal.

**Contoh Implementasi `Column`:**

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,  // Atur posisi widget di tengah secara vertikal
  crossAxisAlignment: CrossAxisAlignment.start, // Widget disejajarkan ke kiri secara horizontal
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Button 1'),
    ),
  ],
);
```
#### 2. `Row`
- `Row` digunakan untuk menempatkan widget secara horizontal, dari kiri ke kanan.
- Biasanya digunakan saat ingin membuat layout dengan beberapa elemen sejajar secara horizontal, seperti tampilan ikon dengan teks di sebelahnya.
- Atribut penting dalam `Row` adalah:
  - `mainAxisAlignment`: Mengatur bagaimana widget di dalam `Row` disejajarkan secara horizontal.
  - `crossAxisAlignment`: Mengatur sejajar atau tidaknya widget di dalam `Row` secara vertikal.

**Contoh Implementasi `Row`:**

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,  // Atur jarak antar widget secara horizontal
  crossAxisAlignment: CrossAxisAlignment.center,     // Widget disejajarkan di tengah secara vertikal
  children: <Widget>[
    Icon(Icons.star, color: Colors.amber),
    Text('Rating'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Rate Now'),
    ),
  ],
);
```

#### Perbandingan `Column` dan `Row`:
| Aspek                  | Column                                 | Row                                     |
|------------------------|----------------------------------------|-----------------------------------------|
| Orientasi Layout       | Vertikal                              | Horizontal                              |
| Contoh Penggunaan      | Daftar item vertikal, form            | Baris ikon dengan teks atau tombol      |
| Atribut Utama          | `mainAxisAlignment`, `crossAxisAlignment` | `mainAxisAlignment`, `crossAxisAlignment` |
| Responsif              | Membutuhkan `Expanded` atau `Flexible` jika ingin mengisi ruang yang tersedia di layar | Membutuhkan `Expanded` atau `Flexible` untuk mengatur agar elemen tidak terpotong jika melebihi lebar layar |
| Pengaturan Tinggi/Lebar| Membentang ke atas dan bawah layar jika tidak diatur (`MainAxisSize.max`) | Membentang ke kiri dan kanan layar jika tidak diatur (`MainAxisSize.max`) |

### 3. Apa saja Elemen Input yang digunakan pada Halaman _Form_ di Tugas 8 ini. Apakah terdapat elemen input Flutter lain yang tidak digunakan pada tugas ini?

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah ada implementasi tema pada aplikasi ini?

### 5. Bagaimana cara menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Cara mengangani navigasi dalam aplikasi, khususnya pada aplikasi Biyung, adalah dengan menggunakan _Navigator_ dan _Named Routes_. Berikut adalah beberapa contoh implementasinya:

#### 1. **Menggunakan Named Routes**
**Named Routes**: Penggunaan *named routes* mempermudah navigasi pada aplikasi yang memiliki banyak halaman, karena kita bisa menggunakan nama alih-alih membuat instance dari setiap halaman.
#### 2. **Menggunakan MaterialPageRoute dengan pushReplacement**:
<br/>**`MaterialApp`**:
   ```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/productEntry': (context) => ProductEntryFormPage(),
      },
    );
  }
}
   ```
**`ListTile`**:
```dart
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  onTap: () {
    Navigator.pushReplacementNamed(context, '/');
  },
),
ListTile(
  leading: const Icon(Icons.add_box_outlined),  // Gunakan ikon yang valid
  title: const Text('Tambah Product'),
  onTap: () {
    Navigator.pushReplacementNamed(context, '/productEntry');
  },
),

```

```dart
if (item.name == "Tambah Product") {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProductEntryFormPage()),
  );
}
```
