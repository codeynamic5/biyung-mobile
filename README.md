# biyung

## Premium Creations made with Love ❤️

# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter
### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu? 
Pembuatan model untul pengampilan atau pengiriman data JSON tidak wajib tapi sangat dianjurkan karena ada beberapa alasan penting:
- Tanpa adanya model, data yang diterima tidak jelas tipe datanya. Dengan adanya model, setiap field bisa dipastikan tipe data yang sesuai.
- Model juga memungkinkan penambahan validasi di setiap field dengan juga menentukan field yang disesuaikan. Oleh karena itu, hal tersebut memudahkan penanganan data yang belum lengkap atau tidak valid.
- Kode yang dikembangkan lebih terstruktur dan mudah untuk dipahami. Dengan perubahan inti struktu bisa dilakukan di model untuk memudahkan dokumentasi API.
  
### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http dalam Flutter merupakan komponen penting yang berfungsi sebagai jembatan komunikasi antara aplikasi dan server melalui protokol HTTP. Ketika mengembangkan aplikasi Flutter, library ini menjadi alat utama untuk melakukan pertukaran data dengan server backend. Penggunaannya dalam tugas ini memungkinkan pengembang untuk mengakses dan mengambil data dari API (Application Programming Interface) serta mengirimkan data ke server dengan cara yang terstruktur dan efisien.

Dalam implementasinya, library http menyediakan berbagai metode permintaan yang dapat disesuaikan dengan kebutuhan aplikasi. Pengembang dapat menggunakan metode GET untuk mengambil data dari server, POST untuk mengirim data baru, PUT untuk memperbarui data yang sudah ada, atau DELETE untuk menghapus data dari server. Fleksibilitas ini membuat library http menjadi pilihan yang serbaguna dalam menangani berbagai skenario komunikasi data antara aplikasi Flutter dan server.

Kemampuan library ini dalam mengelola permintaan HTTP secara asynchronous juga memastikan bahwa aplikasi tetap responsif selama proses pertukaran data berlangsung. Dengan demikian, library http tidak hanya memfasilitasi komunikasi data, tetapi juga berkontribusi pada pengalaman pengguna yang lebih baik dengan memastikan kelancaran operasi aplikasi saat berinteraksi dengan server.

### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest berperan sebagai fungsi khusus yang mengelola komunikasi HTTP dengan memanfaatkan sistem cookie. Dalam pengoperasiannya, fungsi ini secara otomatis mengatur berbagai aspek cookie yang dibutuhkan untuk proses autentikasi pengguna. Salah satu kemampuan utamanya adalah mempertahankan sesi pengguna dengan cara menyimpan dan mengirimkan cookie-cookie yang relevan pada waktu yang tepat. Yang membuat CookieRequest sangat efisien adalah kemampuannya untuk dibagikan ke seluruh komponen dalam sebuah aplikasi, sehingga memastikan bahwa setiap bagian aplikasi menggunakan sesi yang identik. Pendekatan ini tidak hanya menghindari pengulangan kode yang tidak perlu, tetapi juga menjamin bahwa proses autentikasi berjalan secara konsisten di semua bagian aplikasi. Dengan demikian, CookieRequest menjadi solusi terpadu untuk manajemen sesi dan autentikasi dalam pengembangan aplikasi.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Dalam integrasi Flutter dengan Django, proses pengiriman data mengikuti alur yang sistematis dan terorganisir. Semua dimulai ketika pengguna berinteraksi dengan antarmuka Flutter, memasukkan informasi melalui berbagai komponen seperti formulir atau elemen interaktif lainnya. Setelah data diinput, aplikasi Flutter berkomunikasi dengan backend Django menggunakan protokol HTTP, di mana metode POST digunakan untuk mengirim data baru, sementara GET dimanfaatkan untuk mengambil data yang sudah tersimpan. Ketika data mencapai Django, sistem backend ini menggunakan kombinasi view dan serializer untuk memproses dan memvalidasi data, memastikan bahwa informasi yang diterima sesuai dengan struktur yang diharapkan sebelum disimpan dalam database. Setelah proses penyimpanan berhasil, Django merespons dengan mengirimkan data dalam format JSON kembali ke aplikasi Flutter. Aplikasi Flutter kemudian mengolah respons JSON ini, mengubahnya menjadi objek yang dapat dimanipulasi, dan akhirnya menampilkannya kepada pengguna melalui berbagai widget seperti ListView atau Card. Seluruh proses komunikasi ini difasilitasi oleh API yang berfungsi sebagai jembatan penghubung antara frontend Flutter dan backend Django, menjamin perpindahan data yang aman dan efisien antara kedua sistem tersebut.

### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Sistem autentikasi dalam aplikasi melibatkan tiga fungsi utama yang saling terkait yaitu register, login, dan logout, yang semuanya beroperasi melalui interaksi antara Flutter dan Django. Dalam proses registrasi, aplikasi Flutter mengirimkan data pengguna berupa username, password, dan konfirmasi password dalam format JSON ke aplikasi auth Django melalui metode POST. Fungsi register dalam views.py kemudian memproses data ini dengan melakukan berbagai validasi, termasuk memastikan kecocokan password dengan konfirmasi password dan memeriksa keunikan username. Setelah validasi berhasil, sistem membuat user baru dan mengirimkan respons JSON yang berisi username kembali ke Flutter. Untuk proses login, aplikasi Flutter mengirimkan kredensial pengguna dalam format JSON ke endpoint login di aplikasi auth Django. Fungsi login dalam views.py menggunakan metode authenticate untuk memverifikasi username dan password yang diterima. Jika autentikasi berhasil, sistem mengirimkan respons JSON ke Flutter, yang kemudian menggunakan informasi ini untuk mengarahkan pengguna ke halaman utama aplikasi. Sementara itu, proses logout dijalankan ketika pengguna meminta untuk mengakhiri sesi, di mana Flutter memicu fungsi logout di aplikasi auth Django yang menggunakan auth_logout untuk mengakhiri sesi pengguna. Hasilnya dikembalikan dalam bentuk respons JSON yang digunakan Flutter untuk menentukan keberhasilan proses logout dan melakukan tindakan yang sesuai di sisi frontend.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!
#### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
Untuk implementasi fitur registrasi, saya membuat app authentication di proyek Django, memasukkan django-cors-headers di dalam `INSTALLED_APPS` yang saya modifikasi di dalam file `settings.py`. Saya juga menambahkan MIDDLEWARE di dalam file `settings.py`.<br/>
**`settings.py`**
```
INSTALLED_APPS = [
    
    'corsheaders',
]

MIDDLEWARE = [
    
    'corsheaders.middleware.CorsMiddleware',
]

```
Di dalam file `views.py` saya menambahkan fungsi pada app authentication
**`views.py`**
```
  @csrf_exempt
  def register(request):
      if request.method == 'POST':
          data = json.loads(request.body)
          username = data['username']
          password1 = data['password1']
          password2 = data['password2']
  
          # Check if the passwords match
          if password1 != password2:
              return JsonResponse({
                  "status": False,
                  "message": "Passwords do not match."
              }, status=400)
          
          # Check if the username is already taken
          if User.objects.filter(username=username).exists():
              return JsonResponse({
                  "status": False,
                  "message": "Username already exists."
              }, status=400)
          
          # Create the new user
          user = User.objects.create_user(username=username, password=password1)
          user.save()
          
          return JsonResponse({
              "username": user.username,
              "status": 'success',
              "message": "User created successfully!"
          }, status=200)
      
      else:
          return JsonResponse({
              "status": False,
              "message": "Invalid request method."
          }, status=400)
```

#### Membuat halaman login pada proyek tugas Flutter.
Sebelum membuat halaman login, perlu mengunduh paket terlebih dahulu sehingga sistem autentikasi dapat terintegrasi dengan Django. Untuk mengunduh, dapat menjalankan di dalam terminal perintah berikut: `flutter pub add provider` dan `flutter pub add pbp_django_auth`. Di dalam file `main.dart` terdapat perubahan dari `home: MyHomePage()`, menjadi `home: const LoginPage()`. Hal tersebut agar aplikasi memiliki sifat login restricted.
Seperti yang di atas, terdapat penambahan kode di dalam `views.py`:
**`views.py`**
```
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

#### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Di dalam folder `screens` terdapat file `login.dart` yang dapat diintegrasikan dengan sistem autentikasi Django. Hal tersebut dapat dilakukan dengan cara membuat widget dan di dalamnya terdapat TextField yang dapat mengisi input username dan password. Pada fungsi login di dalam file `views.py`, dapat dibuat button untuk submit, hal tersebut dengan cara menggunakan `ElevatedButton` dan melakukan sebuah request untuk memungkinkan `onPressed()` bekerja, sehingga mengirimkan ke _Django App Authentication_. Apabila sukses dalam login, maka akan ada kondisi yang menunjukkan hal tersebut, sama halnya kalo login gagal. Jika login berhasil dilakukan, kembangkan `pushReplacement` ke dalam file `menu.dart`. Beda halnya apabila gagal login, maka akan tetap di halaman login.

#### Membuat model kustom sesuai dengan proyek aplikasi Django.
Dalam pembuatan model kustom, buat beberapa contoh produk yang akan ditambah dengan add new product, setelah itu dapat mengambil data dalam format JSON yang dapat diambil dari website Quicktype. Dalam proyek Flutternya, dapat membuat direktori baru khusus data JSON yang telah diconvert sebelumnya. File tersebut bernama `product_entry.dart`.

#### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django
Pembuatan halaman yang berisi daftar semua item, pertama harus membuat sebuah file di dalam folder screens yang bernama `list_productentry.dart`. Di dalam file tersebut, data JSON Django yang telah dikumpulkan akan dimasukkan di dalam file dan buat menjadi sebuah list. Untuk penyempurnaan struktur, dapat membuat ListView sesuai dengan data yang ingin ditampilkan dalam bentuk kolom yang rapi di dalam aplikasi. Dari situ, nama produk, harga produk, dan deskripsi produk dapat ditampilkan di dalam aplikasi.


#### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
Untuk membuat halaman detail setiap item, di dalam file `list_productentry.dart`, lengkapi ListView dengan menambahkan fungsi `onPressed()`. Fungsi ini akan memungkinkan setiap item dalam list memberikan respons ketika ditekan. Untuk navigasi, dapat menggunakan metode `Navigator.push()`, sehingga memungkinkan operasi pop pada halaman berikutnya. Di dalam fungsi `onPressed()`, lakukan pengiriman data product agar dapat digunakan di halaman lainnya.

Selanjutnya, buatlah berkas baru dengan nama `details_product.dart` dalam direktori screens. Karena data product telah dikirimkan dari `list_productentry.dart`, pada `details_product.dart` kita hanya perlu menampilkan informasi dari setiap field data product tersebut. Tambahkan juga sebuah `ElevatedButton` dengan implementasi `onPressed()` yang ketika ditekan akan menggunakan `Navigator.pop` untuk mengarahkan pengguna kembali ke halaman daftar produk.

#### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Dalam melakukan filter pada halaman daftar item, dapat melakukan modifikasi pada saat login, dimana flutter mengirim sebuah informasi tentang username dan password ke Django. Sehingga, memungkinkan untuk dilakukan filter terhadap masing-masing pengguna yang sesuai. Di sinilah method `authenticate` dapat digunakan, yaitu sebagai berikut:
```
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"

```
Authenticate digunakan dengan tujuan membatasi pengguna yang memgakses aplikasi, sehingga pengguna yang telah login saja yang dapat mengakses semua fitur dalam aplikasi. 

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
#### Elemen Input yang Digunakan dalam Tugas 8 ini
1. **TextFormField**
   **TextFormField** memiliki beberapa fungsi, di antaranya yaitu untuk input produk, deskripsi, dan menentukan jumlah produk.
2. **ElevatedButton**
   **ElevatedButton** digunakan untuk menyimpan data, seperti tombol save yang ketika dipencet akan menyimpan data yang berhubungan dengan form yang menampilkan AlertDialog.
#### Elemen Input yang Tidak Digunakan dalam Tugas 8 ini
1. DropdownButton
   Berfungsi untuk memilih kategori atau jenis dari sebuah produk.
2. Switch
   Berfungsi untuk apabila memiliki beberapa opsi aktif maupun non-aktif seperti status produk.
3. Slider
   Berfungsi untuk mengatur jumlah produk dalam rentang waktu tertentu seperti stok produk.
4. RadioListTile
   Berfungsi untuk memilih satu opsi dari beberapa pilihan opsi yang ada.
### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah ada implementasi tema pada aplikasi ini?
Dalam pengaturan tema dalam aplikasi agar konsisten adalah memodifikasi widget `MaterialApp` dalam file `main.dart`:

```
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ).copyWith(secondary: Colors.indigo[900]),
      ),
      home: MyHomePage(),
    );
  }

```
`MaterialApp` dapat disempurnakan pengaplikasiannya dengan kode ini yang berada dalam file `menu.dart`:

```
   // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
   backgroundColor: Theme.of(context).colorScheme.primary,
   // Mengganti warna icon drawer menjadi putih
   iconTheme: const IconThemeData(color: Colors.white),
```
Dengan potongan kode tersebut, warna latar belakang fitur dapat konsisten dan sama sesuai dengan tema aplikasi.

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
