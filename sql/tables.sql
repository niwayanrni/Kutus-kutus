CREATE TABLE Pengguna (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status VARCHAR(20)
);

CREATE TABLE Produk (
    produk_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    harga DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL
);

CREATE TABLE Stok (
    stock_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    jumlah_masuk INT,
    jumlah_keluar INT,
    tanggal DATE,
	FOREIGN KEY (product_id) REFERENCES Produk(produk_id)
);

CREATE TABLE Pesanan (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tanggal_pesanan DATE NOT NULL,
    total_harga DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Pengguna(user_id)
);

CREATE TABLE Detail_pesanan (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    order_id INT,
    jumlah INT NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Produk(produk_id),
    FOREIGN KEY (order_id) REFERENCES Pesanan(order_id)
);