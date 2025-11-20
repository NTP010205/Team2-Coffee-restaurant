<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Chăm sóc - Coffee 12%</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- HEADER -->
<header>
    <h1>☕ Coffee 12%</h1>
    <nav>
        <a href="index.php">Sản phẩm</a>
        <a href="about.php">Giới thiệu</a>
        <a href="lienhe.php">Liên hệ</a>
        <a href="news.php">Tin tức</a>
        <a href="chamsoc.php" class="active">Chăm sóc</a>

        <!-- Doanh thu chỉ admin -->
        <a href="thong-ke.php" id="revenueLink" style="display:none">Doanh thu</a>

        <!-- Admin -->
        <a href="admin.php" id="adminLink" style="display:none">Admin</a>

        <!-- Login/Logout -->
        <a href="dangnhap.php" id="loginLink">Đăng nhập</a>
        <a href="#" id="logoutBtn" style="display:none;" onclick="dangXuat()">Đăng xuất</a>
    </nav>
</header>

<!-- HERO -->
<div class="about-hero">
    <div class="hero-content">
      <h2>Chăm sóc & Mẹo</h2>
      <p style="font-size:18px; margin-top:8px;">Những bí quyết giúp bạn thưởng thức cà phê và đồ uống ngon hơn mỗi ngày</p>
    </div>
</div>

<!-- NỘI DUNG CHÍNH -->
<div class="container-about" style="padding-top:30px;">
    <section class="values-section">
      <div class="values-grid">

        <div class="value-card">
          <img src="" alt="Mẹo pha cà phê 1" style="width:100%; border-radius:8px; margin-bottom:12px;">
          <h3>☕ Cách pha cà phê Espresso chuẩn</h3>
          <p>Hướng dẫn từng bước để có ly Espresso đậm đà, thơm ngon tại nhà.</p>
        </div>

        <div class="value-card">
          <img src="" alt="Mẹo pha cà phê 2" style="width:100%; border-radius:8px; margin-bottom:12px;">
          <h3>🍵 Giữ hương vị cà phê tươi mới lâu hơn</h3>
          <p>Lưu trữ hạt cà phê đúng cách để giữ nguyên hương vị và độ thơm.</p>
        </div>

        <div class="value-card">
          <img src="" alt="Mẹo pha cà phê 3" style="width:100%; border-radius:8px; margin-bottom:12px;">
          <h3>🥛 Pha chế Latte và Cappuccino tại nhà</h3>
          <p>Mẹo tạo lớp bọt sữa mịn và thưởng thức đồ uống café như ngoài quán.</p>
        </div>

      </div>
    </section>
</div>

<!-- FOOTER -->
<footer style="position: relative; width: 100%; height: 200px; overflow: hidden;">
    <img src="images/logo.jpg" alt="Footer Banner" style="width: 100%; height: 100%; object-fit: cover; display: block;">
    <div style="position: absolute; top:50%; left:50%; transform:translate(-50%, -50%); color:white; text-align:center; text-shadow:0 0 5px black; padding:0 20px;">
        <h2>Coffee 12%</h2>
        <p>Địa chỉ: 123 Nguyễn Trãi, Quận 5, TP.HCM</p>
        <p>Điện thoại: 0901 234 567</p>
        <p>Email: contact@example.com</p>
    </div>
</footer>

<!-- SCRIPT XỬ LÝ LOGIN / ADMIN / DOANH THU -->
<script>
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
