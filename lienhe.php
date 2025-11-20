<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Liên hệ - Coffee 12%</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<header>
    <h1>☕ Coffee 12%</h1>
    <nav>
        <a href="index.php">Sản phẩm</a>
        <a href="about.php">Giới thiệu</a>
        <a href="lienhe.php" class="active">Liên hệ</a>
        <a href="news.php">Tin tức</a>
        <a href="chamsoc.php">Chăm sóc</a>

        <!-- 🔥 Doanh thu (màu đỏ + chỉ hiện khi admin đăng nhập) -->
        <a href="thong-ke.php" id="revenueLink" style="display:none">Doanh thu</a>

        <!-- Admin -->
        <a href="admin.php" id="adminLink" style="display:none">Admin</a>

        <!-- Login & Logout -->
        <a href="dangnhap.php" id="loginLink">Đăng nhập</a>
        <a href="#" id="logoutBtn" style="display:none;" onclick="dangXuat()">Đăng xuất</a>
    </nav>
</header>


<!-- ===== HERO ===== -->
<div class="about-hero">
    <div class="hero-content">
      <h2>Liên hệ</h2>
      <p>Coffee 12% sẵn sàng lắng nghe — liên hệ với chúng tôi ngay.</p>
    </div>
</div>


<!-- ===== NỘI DUNG LIÊN HỆ ===== -->
<div class="container-about">
    <section style="display:flex; flex-wrap:wrap; gap:30px; justify-content:center; margin-bottom:30px;">
      
        <!-- Thông tin cửa hàng -->
        <div style="flex:1; min-width:280px;">
            <div style="background:white; padding:20px; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.05); border:1px solid #eee;">
            <h3>Thông tin cửa hàng</h3>
            <p><strong>Địa chỉ:</strong> 123 Nguyễn Trãi, Quận 5, TP.HCM</p>
            <p><strong>Giờ mở cửa:</strong> 8:00 - 22:00 (Thứ 2 - CN)</p>
            <p><strong>Điện thoại:</strong> 0901 234 567</p>
            <p><strong>Email:</strong> contact@example.com</p>
            </div>
        </div>

        <!-- Form liên hệ -->
        <div style="flex:1; min-width:320px;">
            <div style="background:white; padding:20px; border-radius:12px; box-shadow:0 8px 20px rgba(0,0,0,0.05); border:1px solid #eee;">
                <h3>Gửi Thông Tin Cho Chúng Tôi</h3>
                <form id="contact-form" onsubmit="handleSubmit(event)" style="margin-top:16px;">
                    <label>Họ tên:</label>
                    <input id="name" type="text" required style="width:100%; padding:10px; margin-bottom:12px;">

                    <label>Email:</label>
                    <input id="email" type="email" required style="width:100%; padding:10px; margin-bottom:12px;">

                    <label>Nội dung:</label>
                    <textarea id="message" required style="width:100%; padding:10px; height:120px;"></textarea>
                    <button type="submit" style="width:100%; margin-top:12px; padding:10px; background:#6f4e37; color:white; border:none; border-radius:8px; font-size:16px; cursor:pointer;">Liên hệ ngay</button>

                    <div id="thongBao" style="margin-top:14px; font-weight:700; text-align:center;"></div>
                </form>
            </div>
        </div>

    </section>
</div>


<!-- ===== FOOTER ===== -->
<footer style="position: relative; width: 100%; height: 200px; overflow: hidden;">
    <img src="images/logo.jpg" style="width:100%; height:100%; object-fit:cover;">
    <div style="position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); color:white; text-align:center; text-shadow:0 0 5px black;">
        <h2>Coffee 12%</h2>
        <p>123 Nguyễn Trãi, Quận 5, TP.HCM</p>
        <p>Điện thoại: 0901 234 567</p>
        <p>Email: contact@example.com</p>
    </div>
</footer>


<!-- ===== SCRIPT XỬ LÝ FORM ===== -->
<script>
function handleSubmit(e){
    e.preventDefault();
    let tb = document.getElementById('thongBao');
    tb.style.color = "green";
    tb.textContent = "LIÊN HỆ THÀNH CÔNG";
}
</script>


<!-- ===== SCRIPT XỬ LÝ LOGIN / ADMIN / DOANH THU ===== -->
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
