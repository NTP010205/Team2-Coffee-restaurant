<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Coffee 12%</title>
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Segoe UI', sans-serif;
    margin: 0;
    background: #f8f5f0;
    padding-top: 80px;
}

/* Header */
header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background: #6f4e37;
    color: white;
    text-align: center;
    padding: 10px 0;
    z-index: 1000;
}
header h1 {
    font-family: 'Dancing Script', cursive;
    font-size: 28px;
    margin: 0 0 5px 0;
}
header nav {
    display: inline-block;
}
header nav a {
    color: white;
    margin: 0 10px;
    text-decoration: none;
    font-weight: bold;
    transition: all 0.3s;
}
header nav a:hover, header nav a.active { 
    color: #ffda79; 
    text-decoration: underline; 
}


/* Hero */
.hero {
    background: #f2e8dc;
    text-align: center;
    padding: 80px 20px 40px 20px;
}
.hero h2 {
    font-family: 'Dancing Script', cursive;
    font-size: 36px;
    color: #6f4e37;
    margin-bottom: 10px;
}
.hero p {
    font-size: 18px;
    color: #555;
}

/* Container admin */
.container-admin {
    width: 90%;
    max-width: 1000px;
    margin: -40px auto 50px auto;
    background: white;
    padding: 30px 25px;
    border-radius: 12px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

/* Section */
.section {
    margin-top: 30px;
}
.section h3 {
    color: #6f4e37;
    font-family: 'Dancing Script', cursive;
    margin-bottom: 15px;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}
table th, table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}
table th {
    background: #6f4e37;
    color: white;
}

/* Buttons */
button {
    padding: 6px 12px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
}
button.edit { background: #0275d8; color: white; }
button.delete { background: #d9534f; color: white; }
button:hover { opacity: 0.9; }

/* Footer */
footer {
    position: relative;
    width: 100%;
    height: 200px;
    overflow: hidden;
    margin-top: 50px;
}
footer img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
footer .footer-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    text-align: center;
    text-shadow: 0 0 5px black;
    padding: 0 20px;
}
</style>
</head>

<body>

<header>
    <h1>☕ Coffee 12%</h1>
    <nav>
        <a href="index.php">Sản phẩm</a>
        <a href="about.php">Giới thiệu</a>
        <a href="lienhe.php">Liên hệ</a>
        <a href="news.php">Tin tức</a>
        <a href="chamsoc.php">Chăm sóc</a>
        <a href="dangnhap.php" id="loginLink">Đăng nhập</a>
        <a href="thong-ke.php" id="revenueLink" style="display:none;">Doanh thu</a>
        <a href="admin.php" id="adminLink" style="display:none;">Admin</a>
        <a href="#" id="logoutBtn" style="display:none;" onclick="dangXuat()">Đăng xuất</a>
    </nav>
</header>

<div class="hero">
    <h2>Trang Quản Trị</h2>
    <p>Quản lý sản phẩm, khách hàng và doanh thu</p>
</div>

<div class="container-admin">

    <!-- Quản lý sản phẩm -->
    <div class="section">
        <h3>Quản lý sản phẩm</h3>
        <button onclick="addProduct()">➕ Thêm sản phẩm</button>
        <table id="product-list-table">
            <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Chức năng</th>
                </tr>
            </thead>
            <tbody id="product-list"></tbody>
        </table>
    </div>

    <!-- Quản lý khách hàng -->
    <div class="section">
        <h3>Quản lý khách hàng</h3>
        <table>
            <thead>
                <tr>
                    <th>Tên</th>
                    <th>Email / SĐT</th>
                    <th>Địa chỉ</th>
                </tr>
            </thead>
            <tbody id="customer-list"></tbody>
        </table>
    </div>

    <!-- Quản lý doanh thu -->
    <div class="section">
        <h3>Doanh thu</h3>
        <table>
            <thead>
                <tr>
                    <th>Ngày</th>
                    <th>Khách hàng</th>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Thanh toán</th>
                </tr>
            </thead>
            <tbody id="revenue-list"></tbody>
        </table>
    </div>

</div>

<footer>
    <img src="images/logo.jpg" alt="Footer Banner">
    <div class="footer-content">
        <h2>Coffee 12%</h2>
        <p>Địa chỉ: 123 Nguyễn Trãi, Quận 5, TP.HCM</p>
        <p>Điện thoại: 0901 234 567</p>
        <p>Email: contact@example.com</p>
    </div>
</footer>

<script>
// ===== Kiểm tra quyền admin =====
if(localStorage.getItem('userRole') !== 'admin'){
    alert('Bạn không có quyền truy cập trang Admin!');
    window.location.href = 'login.php';
}

// ===== Navbar hiển thị Admin + Doanh thu + Đăng xuất =====
window.addEventListener('DOMContentLoaded', () => {
    const role = localStorage.getItem('userRole');

    if(role){
        document.getElementById('loginLink').style.display = 'none';
        document.getElementById('logoutBtn').style.display = 'inline-block';
    }

    if(role === 'admin'){
        document.getElementById('adminLink').style.display = 'inline-block';
        document.getElementById('revenueLink').style.display = 'inline-block';
    }
});

function dangXuat() {
    // Xóa TẤT CẢ thông tin phiên đăng nhập
    localStorage.removeItem('userRole');
    localStorage.removeItem('isLoggedIn'); // <-- Dòng quan trọng bị thiếu
    localStorage.removeItem('currentUsername');
    localStorage.removeItem('currentUserPhone'); // <-- Dòng quan trọng bị thiếu
    localStorage.removeItem('currentUserAddress'); // <-- Dòng quan trọng bị thiếu
    localStorage.removeItem('currentUserGender'); // <-- Xóa luôn giới tính
    
    alert("Đã đăng xuất thành công!");
    
    // Tải lại trang để giao diện quay về mặc định
    window.location.href = "index.php"; 
}

// ===== Quản lý sản phẩm =====
let products = JSON.parse(localStorage.getItem('products')) || [];

function loadProducts(){
    let html = '';
    products.forEach((p,i) => {
        html += `<tr>
            <td>${p.name}</td>
            <td>${p.price}₫</td>
            <td>
                <button class="edit" onclick="editProduct(${i})">Sửa</button>
                <button class="delete" onclick="deleteProduct(${i})">Xóa</button>
            </td>
        </tr>`;
    });
    document.getElementById('product-list').innerHTML = html;
}
loadProducts();

function addProduct(){
    let name = prompt('Tên sản phẩm:');
    let price = prompt('Giá sản phẩm:');
    
    // ▼ Thêm dòng này để nhập ảnh, nếu lười nhập thì nó tự lấy logo
    let image = prompt('Link hình ảnh:', 'images/logo.jpg'); 

    if(!name || !price) return;
    
    // ▼ Sửa đoạn push này để thêm image vào
    products.push({
        name: name, 
        price: price,
        image: image  // <-- Quan trọng!
    });
    
    localStorage.setItem('products', JSON.stringify(products));
    loadProducts();
}
function deleteProduct(i){
    if(confirm('Bạn chắc chắn muốn xóa?')){
        products.splice(i,1);
        localStorage.setItem('products', JSON.stringify(products));
        loadProducts();
    }
}
function editProduct(i){
    let name = prompt('Tên mới:', products[i].name);
    let price = prompt('Giá mới:', products[i].price);
    if(!name || !price) return;
    products[i] = {name, price};
    localStorage.setItem('products', JSON.stringify(products));
    loadProducts();
}

// ===== Quản lý khách hàng =====
function loadCustomers(){
    let html = '';
    for(let key in localStorage){
        if(key.startsWith('user_')){
            let user = JSON.parse(localStorage.getItem(key));
            html += `<tr>
                <td>${key.replace('user_','')}</td>
                <td>${user.email || user.phone || ''}</td>
                <td>${user.address || ''}</td>
            </tr>`;
        }
    }
    document.getElementById('customer-list').innerHTML = html;
}
loadCustomers();

// ===== Quản lý doanh thu =====
let orders = JSON.parse(localStorage.getItem('orders')) || [];

function loadRevenue(){
    let html = '';
    orders.forEach(o => {
        o.items.forEach(item => {
            html += `<tr>
                <td>${o.date}</td>
                <td>${o.customer}</td>
                <td>${item.name} (Size ${item.size})</td>
                <td>${item.price}₫</td>
                <td>${o.paymentMethod}</td>
            </tr>`;
        });
    });
    document.getElementById('revenue-list').innerHTML = html;
}
loadRevenue();
</script>

</body>
</html>

<style>
header nav a.active {
    text-decoration: underline; /* gạch chân */
    color: #ffda79; /* màu nổi bật */
}
</style>

<script>
// Gạch chân menu đang ở
window.addEventListener('DOMContentLoaded', () => {
    const navLinks = document.querySelectorAll('header nav a');
    const currentPath = window.location.pathname.split("/").pop(); // lấy tên file hiện tại
    navLinks.forEach(link => {
        const href = link.getAttribute('href');
        if(href === currentPath || (href === "#menu" && currentPath === "index.php")) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
});
</script>
