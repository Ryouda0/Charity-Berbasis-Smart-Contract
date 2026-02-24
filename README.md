# CharityChain - Decentralized Donation App

CharityChain adalah aplikasi donasi berbasis blockchain (DApp) yang memungkinkan penggalangan dana secara transparan. Proyek ini menggunakan Solidity untuk Smart Contract, Hardhat sebagai lingkungan pengembangan, dan Ethers.js untuk menghubungkan antarmuka web (Frontend) ke Blockchain.

🚀 Fitur Utama

    1. Transparansi Penuh: Setiap donasi dicatat secara permanen di blockchain.
    
    2. Keamanan Dana: Dana hanya dapat ditarik oleh pemilik proyek (owner) jika target donasi telah tercapai.
    
    3. Batas Waktu Otomatis: Kontrak memiliki masa aktif yang ditentukan saat pembuatan.
    
    4. Progress Tracker: Visualisasi persentase donasi yang terkumpul secara real-time.

🛠️ Arsitektur Kontrak (Charity.sol)
Kontrak ini mengelola logika inti donasi:


>Target & Deadline: Ditentukan saat deployment.
    
    
>Fungsi donate(): Menerima ETH dari donatur selama sebelum deadline.
    
    
>Fungsi withdrawFunds(): Memungkinkan pemilik menarik saldo jika target terpenuhi.
    
    
>Fungsi getContractBalance(): Mengecek saldo terkini di dalam kontrak.

💻 Panduan Instalasi & Penggunaan
1. Prasyarat
Node.js & npm

Ekstensi Browser MetaMask

2. Setup Lingkungan Pengembangan
Buka terminal di folder proyek dan jalankan:

Bash
# Jalankan blockchain lokal Hardhat
    npx hardhat node
Terminal ini harus tetap terbuka selama penggunaan.

3. Deployment Kontrak
Buka terminal baru dan jalankan script deploy:

Bash

    npx hardhat run scripts/deploy-charity.js --network localhost

Salin Alamat Kontrak yang muncul di terminal (misal: 0x5Fb...).

# 🦊 Cara Penggunaan dengan MetaMask
Agar dapat berinteraksi dengan aplikasi di jaringan lokal, ikuti langkah ini:

Langkah 1: Tambahkan Jaringan Hardhat ke MetaMask
Buka MetaMask > Klik Jaringan (atas) > Add Network > Add a network manually.

Isi data berikut:

    >Network Name: Hardhat Local
    
    >New RPC URL: http://127.0.0.1:8545
    
    >Chain ID: 31337
    
    >Currency Symbol: ETH


Langkah 2: Impor Akun Uji Coba
Karena dompet pribadi Anda memiliki 0 ETH di jaringan lokal, Anda perlu mengimpor akun dari Hardhat:

    1. Lihat terminal tempat Anda menjalankan npx hardhat node.
    
    2. Salin salah satu Private Key dari daftar akun yang tersedia.
    
    3. Di MetaMask, klik ikon Profil > Import Account > Tempel Private Key tersebut.

Langkah 3: Berdonasi
Pada website CharityChain, klik Hubungkan Wallet.

    1. Berikan izin di MetaMask.
    
    2. Masukkan jumlah donasi (misal: 1.5) di kolom input.
    
    3. Klik Donasi Sekarang dan konfirmasi transaksi di pop-up MetaMask.


⚠️ Troubleshooting

    Error INSUFFICIENT_FUNDS: Pastikan akun MetaMask yang aktif adalah akun yang memiliki saldo ETH lokal (Akun hasil impor Private Key Hardhat).
    
    Error Nonce too high: Jika transaksi "pending" terus, masuk ke MetaMask > Settings > Advanced > Clear activity tab data (Reset Account).
    
    Ethers.js gagal dimuat: Pastikan komputer terhubung ke internet untuk mengambil library dari CDN atau periksa kembali link <script> di index.html.
    
    

