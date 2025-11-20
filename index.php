<?php
session_start(); // Cần có session_start() ở mọi trang dùng session
if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
    echo "Xin chào, " . $_SESSION['username'] . "! ";
    echo "<a href='logout.php'>Đăng xuất</a>"; // Đây là liên kết logout
} else {
    echo "<a href='login.html'>Đăng nhập</a> | <a href='register.html'>Đăng ký</a>";
}
?>
<!DOCTYPE html>
  <html lang="vi">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Quán Cà Phê</title>
    <link rel="stylesheet" href="style.css">
  </head>
<style>
    /* ========== CSS CHO POP-UP HÓA ĐƠN ========== */

    /* Lớp nền mờ */
    #paymentOverlay {
        display: none; /* Mặc định ẩn đi */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: 1000;
        justify-content: center;
        align-items: center;
        padding: 20px;
        box-sizing: border-box;
    }

    /* Khung pop-up */
    #paymentModal {
        background-color: #fff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        position: relative;
        width: 500px;
        max-width: 100%;
        z-index: 1001;
        max-height: 90vh; /* Chống tràn màn hình */
        overflow-y: auto; /* Tự động có thanh cuộn nếu dài */
    }

    /* Nút X để đóng */
    #closeModalBtn {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 28px;
        font-weight: bold;
        color: #888;
        cursor: pointer;
    }
    #closeModalBtn:hover {
        color: #000;
    }

    #paymentModal h2 {
        text-align: center;
        margin-top: 0;
        margin-bottom: 20px;
    }

    .modal-section {
        margin-bottom: 20px;
    }

    .modal-section h4 {
        border-bottom: 1px solid #eee;
        padding-bottom: 5px;
        margin-bottom: 10px;
    }

    #modalBillItems p {
        margin: 5px 0;
    }

    .payment-options {
        display: flex;
        justify-content: space-around;
    }

    .payment-options label {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        cursor: pointer;
        width: 45%;
    }
    .payment-options label:has(input:checked) {
        background-color: #f0f8ff;
        border-color: #007bff;
    }

    #confirmOrderBtn {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    #confirmOrderBtn:hover {
        background-color: #218838;
    }
    /* ========== HẾT CSS POP-UP ========== */
</style>
  <body>
    <!-- ======== THANH ĐIỀU HƯỚNG ======== -->
    <header>
        
    <h1>☕ Coffee 12% </h1>
    <nav>
        <a href="#menu">Sản phẩm</a>
        <a href="about.php">Giới thiệu</a>
        <a href="lienhe.php">Liên hệ</a>
        <a href="news.php">Tin tức</a>
        <a href="chamsoc.php">Chăm sóc</a>
        
        <a href="thong-ke.php" id="revenueLink" style="display: none">Doanh thu</a> 
        <a href="admin.php" id="adminPageLink" style="display:none">Admin</a>    
        
        <a href="dangnhap.php" id="loginBtn">Đăng nhập</a>
        <a href="#" id="logoutBtn" style="display:none;" onclick="dangXuat()">Đăng xuất</a>
         <span id="welcomeUser" style="
        display: none; 
        position: absolute; 
        top: 15px;          
        right: 60px;        
        font-weight: bold; 
        color: #ffffff;      
        font-size: 18px;    
        z-index: 100;
    "></span>
    </nav>
    <div id="cartIcon" class = "cart">
        🛒 <span id="cartCount">0</span>
    </div>
    
</header>
<!-- ===== HERO BANNER ===== -->
<div class="about-hero">
    <div class="hero-content">
        <h2>Hương Vị Cà Phê - Đánh Thức Đam Mê</h2>
        <p>Chào mừng bạn đến với ngôi nhà của những hạt cà phê thượng hạng.</p>
    </div>
</div>

    <!-- ======== 2. MENU SẢN PHẨM ======== -->
    <section id="menu" class="section">
      <div id="productList" class="menu-container"></div>
    </section>

    <!-- ======== 3. ĐƠN HÀNG ======== -->
      <!--Phần này là để dành cho giỏ hàng -->
    <div id="cartPopup" class="shoppingcart">
    <h3>Giỏ hàng</h3>
    <ul id="cartItems"></ul>
    <button onclick="dongCuaSo()">Đóng</button>
</div>

    
<!-- ======== POPUP CHỌN SIZE ======== -->
<div id="sizePopup" class="popup">
  <div class="popup-content">
    <div class="popup-left">
      <img id="popupImage" src="" alt="Hình sản phẩm">
    </div>
    <div class="popup-right">
      <h2 id="popupTitle">Chọn kích cỡ</h2>
      <p id="productName"></p>
      <div class="size-options">
        <label>
          <input type="radio" name="size" value="M" data-price="30000"> Size M (30.000đ)
        </label><br>
        <label>
          <input type="radio" name="size" value="L" data-price="40000"> Size L (40.000đ)
        </label>
      </div>
      <button onclick="confirmOrder()">Xác nhận</button>
      <button onclick="closePopup()">Hủy</button>
    </div>
  </div>
</div>


  <!-- Footer đặt ngoài container -->
  <footer style="position: relative; width: 100%; height: 200px; overflow: hidden;">
      <!-- Ảnh nền full-width theo trang web -->
      <img src="images/logo.jpg" alt="Footer Banner"
          style="width: 100%; height: 100%; object-fit: cover; display: block;">

      <!-- Chữ đè lên ảnh -->
      <div style="
          position: absolute; 
          top: 50%; 
          left: 50%; 
          transform: translate(-50%, -50%); 
          color: white; 
          text-align: center; 
          text-shadow: 0 0 5px black;
          padding: 0 20px;
      ">
          <h2>Coffee 12%</h2>
          <p>Địa chỉ: 123 Nguyễn Trãi, Quận 5, TP.HCM</p>
          <p>Điện thoại: 0901 234 567</p>
          <p>Email: contact@example.com</p>
      </div>
  </footer>




    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="script.js"></script>
    <div id="toast" class="toast"></div>
    
  </body>
  

  
  
  <!--thêm bill-->
  <div id="paymentOverlay">
    <div id="paymentModal">
        <span id="closeModalBtn">&times;</span>
        <h2>Xác Nhận Đơn Hàng</h2>

        <div class="modal-section">
            <h4>Thông tin giao hàng:</h4>
            <p><strong>Tên:</strong> <span id="modalHoTen"></span></p>
            <p><strong>SĐT:</strong> <span id="modalSdt"></span></p>
            <p><strong>Địa chỉ:</strong> <span id="modalDiaChi"></span></p>
        </div>

        <div class="modal-section">
            <h4>Chi tiết sản phẩm:</h4>
            <div id="modalBillItems">
                </div>
            <hr>
            <p><strong>Tổng cộng: <span id="modalTotal" style="color:red; font-size: 1.2em;"></span></strong></p>
        </div>

        <div class="modal-section">
            <h4>Chọn phương thức thanh toán:</h4>
            <div class="payment-options">
                <label>
                    <input type="radio" name="paymentMethod" value="cash" checked>
                    <img src="https://cdn-icons-png.flaticon.com/128/11428/11428055.png" alt="Tiền mặt" style="width: 25px;">
                    Tiền mặt
                </label>
                <label>
                    <input type="radio" name="paymentMethod" value="banking">
                    <img src="https://cdn-icons-png.flaticon.com/128/6959/6959146.png" alt="Banking" style="width: 25px;">
                    Banking
                </label>
            </div>
        </div>

        <button id="confirmOrderBtn">Hoàn Tất Đặt Hàng</button>
    </div>
</div>
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