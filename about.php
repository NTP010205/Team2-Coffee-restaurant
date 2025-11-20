<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về Chúng Tôi - Coffee Manager</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header>
    <h1>☕ Coffee 12%</h1>
    <nav>
        <a href="index.php">Sản phẩm</a>
        <a href="about.php" class="active">Giới thiệu</a>
        <a href="lienhe.php">Liên hệ</a>
        <a href="news.php">Tin tức</a>
        <a href="chamsoc.php">Chăm sóc</a>
        <!-- Đăng nhập / Admin / Doanh thu / Đăng xuất -->
        <a href="dangnhap.php" id="loginLink">Đăng nhập</a>
         <!-- Doanh thu -->
        <a href="thong-ke.php" id="revenueLink" style="display:none">Doanh thu</a>

        <!-- Admin -->
        <a href="admin.php" id="adminLink" style="display:none">Admin</a>

    

        <!-- Đăng xuất -->
        <a href="#" id="logoutBtn" style="display:none;" onclick="dangXuat()">Đăng xuất</a>
    </nav>
</header>

<div class="about-hero">
    <div class="hero-content">
        <h2>Hương Vị Cà Phê - Đánh Thức Đam Mê</h2>
        <p>Chào mừng bạn đến với ngôi nhà của những hạt cà phê thượng hạng.</p>
    </div>
</div>

<div class="container-about">
    <section class="story-section">
        <div class="story-text">
            <h3>📖 Câu Chuyện Của Chúng Tôi</h3>
            <p>
                Được thành lập vào năm 2025, <strong>Coffee Manager</strong> không chỉ là một quán cà phê, mà là nơi chúng tôi gửi gắm tình yêu vào từng giọt đắng.
                <br><br>
                Bắt đầu từ một góc phố nhỏ, chúng tôi luôn tin rằng một tách cà phê ngon có thể thay đổi cả một ngày của bạn. Chúng tôi rang xay thủ công mỗi ngày để giữ trọn hương vị nguyên bản nhất.
            </p>
        </div>
        <div class="story-img">
            <img src="images/about.png" alt="Pha chế cà phê">
        </div>
    </section>

    <section class="values-section">
        <h3>Tất Cả Vì Nụ Cười Của Bạn</h3>
        <div class="values-grid">
            <div class="value-card">
                <div class="icon">🌿</div>
                <h4>Nguyên Liệu Sạch</h4>
                <p>100% hạt Arabica và Robusta được tuyển chọn từ nông trại Cầu Đất.</p>
            </div>
            <div class="value-card">
                <div class="icon">❤️</div>
                <h4>Pha Chế Tận Tâm</h4>
                <p>Từng ly nước đều được Barista chăm chút tỉ mỉ như một tác phẩm nghệ thuật.</p>
            </div>
            <div class="value-card">
                <div class="icon">🏡</div>
                <h4>Không Gian Chill</h4>
                <p>Yên tĩnh, thoáng mát, wifi mạnh mẽ phù hợp để làm việc và thư giãn.</p>
            </div>
        </div>
    </section>
    <section class="team-section">
        <h3>Đội Ngũ Của Chúng Tôi</h3>
        <div class="team-grid">
            <div class="team-member">
                <h4>Nguyễn Thành Phát</h4>
                <p>Founder & Head Barista</p>
            </div>
            <div class="team-member">
                <h4>Huỳnh Gia Huy</h4>
                <p>Quản Lý Cửa Hàng</p>
            </div>
            <div class="team-member">
                <h4>Huỳnh Nhựt Hòa</h4>
                <p>Chuyên Gia Pha Chế</p>
            </div>
            <div class="team-member">
                <h4>Phạm Thị Nhi</h4>
                <p>Kế toán thu ngân</p>
            </div>
            <div class="team-member">
                <h4>Trịnh Ngọc Minh Nhật</h4>
                <p>Làm Bánh</p>
            </div>
        </div>
    </section>
</div>

<footer style="position: relative; width: 100%; height: 200px; overflow: hidden;">
    <img src="images/logo.jpg" alt="Footer Banner" style="width: 100%; height: 100%; object-fit: cover; display: block;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; text-align: center; text-shadow: 0 0 5px black; padding: 0 20px;">
        <h2>Coffee 12%</h2>
        <p>Địa chỉ: 123 Nguyễn Trãi, Quận 5, TP.HCM</p>
        <p>Điện thoại: 0901 234 567</p>
        <p>Email: contact@example.com</p>
    </div>
</footer>

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
