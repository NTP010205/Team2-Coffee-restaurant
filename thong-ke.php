<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản Trị - Thống Kê Doanh Thu</title>
  
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
  <style>
    * { box-sizing: border-box; font-family: Arial, sans-serif; }
    body { margin: 0; background-color: #f4f6f9; color: #333; }

    /* --- THANH ĐIỀU HƯỚNG --- */
    header {
        background-color: #4b3621;
        color: white;
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    header h1 { margin: 0; font-size: 20px; }
    .btn-home {
        text-decoration: none;
        color: white;
        background: #d35400;
        padding: 8px 15px;
        border-radius: 5px;
        font-weight: bold;
        transition: 0.3s;
    }
    .btn-home:hover { background: #e67e22; }

    /* --- CONTAINER CHÍNH --- */
    .container { max-width: 1200px; margin: 20px auto; padding: 0 15px; }

    /* --- 1. CÁC THẺ KPI (Tổng quan) --- */
    .kpi-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }
    .kpi-card {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        text-align: center;
        border-left: 5px solid #4b3621;
    }
    .kpi-card h3 { margin: 0 0 10px; font-size: 16px; color: #777; }
    .kpi-card p { margin: 0; font-size: 28px; font-weight: bold; color: #333; }
    .kpi-card span { font-size: 14px; color: green; }

    /* --- 2. KHU VỰC BIỂU ĐỒ --- */
    .charts-grid {
        display: grid;
        grid-template-columns: 2fr 1fr; /* Cột trái to gấp đôi */
        gap: 20px;
        margin-bottom: 30px;
    }
    .chart-box {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    h2.section-title { font-size: 18px; margin-bottom: 15px; border-bottom: 2px solid #eee; padding-bottom: 10px; }

    /* --- 3. BẢNG CHI TIẾT ĐƠN HÀNG --- */
    .table-box {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        overflow-x: auto;
    }
    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background-color: #f8f9fa; font-weight: bold; }
    tr:hover { background-color: #f1f1f1; }
    .status {
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: bold;
    }
    .status.done { background: #d4edda; color: #155724; } /* Xanh lá */
    .status.pending { background: #fff3cd; color: #856404; } /* Vàng */

    /* Responsive cho mobile */
    @media (max-width: 768px) {
        .charts-grid { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>

  <header>
    <h1>☕ Admin Dashboard - Coffee 12%</h1>
    <div>
        <span>Xin chào, <b>Chủ Quán</b></span> | 
        <a href="index.php" class="btn-home">Về Trang Chủ</a>
    </div>
  </header>

  <div class="container">

    <div class="kpi-grid">
        <div class="kpi-card" style="border-left-color: #28a745;">
            <h3>Doanh Thu Thực Tế</h3>
            <p id="kpi-revenue">0 đ</p> 
            <span>Dựa trên đơn hàng</span>
        </div>
        <div class="kpi-card" style="border-left-color: #17a2b8;">
            <h3>Tổng Đơn Hàng</h3>
            <p id="kpi-orders">0</p>
            <span>Đơn đã đặt</span>
        </div>
        <div class="kpi-card" style="border-left-color: #ffc107;">
            <h3>Sản Phẩm Bán Chạy</h3>
            <p>Cà Phê Muối</p>
            <span>Top 1 yêu thích</span>
        </div>
        <div class="kpi-card" style="border-left-color: #dc3545;">
            <h3>Khách Hàng</h3>
            <p id="kpi-customers">1</p>
            <span>Thành viên hệ thống</span>
        </div>
    </div>

    <div class="charts-grid">
        <div class="chart-box">
            <h2 class="section-title">📈 Biểu Đồ Doanh Thu (Cập nhật T12 theo thực tế)</h2>
            <div style="height: 350px; position: relative;">
                <canvas id="revenueChart"></canvas>
            </div>
        </div>
        
        <div class="chart-box">
            <h2 class="section-title">Tỷ Trọng Món Ăn/Uống</h2>
            <div style="height: 350px; position: relative;">
                <canvas id="productChart"></canvas>
            </div>
        </div>
    </div>

    <div class="table-box">
        <h2 class="section-title">📋 Giao Dịch Gần Nhất</h2>
        <table>
            <thead>
                <tr>
                    <th>Mã Đơn</th>
                    <th>Khách Hàng</th>
                    <th>Món Đặt</th>
                    <th>Tổng Tiền</th>
                    <th>Trạng Thái</th>
                </tr>
            </thead>
            <tbody id="transactionTable">
                </tbody>
        </table>
    </div>

  </div>
<script>
    // --- 1. BẢO MẬT ---
    const role = localStorage.getItem('userRole');
    if (role !== 'admin') {
        alert("Bạn không có quyền truy cập trang này!");
        window.location.href = "index.php"; 
    }

    // --- 2. LẤY DỮ LIỆU TỪ KHO & TÍNH TOÁN ---
    let transactions = JSON.parse(localStorage.getItem('listDonHang')) || [];
    let totalRevenue = 0;
    let totalOrders = transactions.length;

    // Lấy số lượng khách hàng từ kho (Mới thêm)
    // Nếu chưa có ai đăng ký thì mặc định hiển thị là 0
    let totalCustomers = localStorage.getItem('customerCount') || 0;

    transactions.forEach(order => {
        let money = parseInt(order.total.replace(/\./g, '').replace('đ', ''));
        if (!isNaN(money)) {
            totalRevenue += money;
        }
    });

    // --- 3. CẬP NHẬT SỐ LIỆU LÊN CÁC Ô VUÔNG (KPI) ---
    document.getElementById('kpi-revenue').innerText = new Intl.NumberFormat('vi-VN').format(totalRevenue) + ' đ';
    document.getElementById('kpi-orders').innerText = totalOrders;
    
    // Cập nhật số lượng Khách hàng (Dòng này mới thêm)
    document.getElementById('kpi-customers').innerText = totalCustomers;

    // --- 4. VẼ BIỂU ĐỒ CỘT ---
    const ctxRev = document.getElementById('revenueChart').getContext('2d');
    let monthlyData = [45000000, 52000000, 48000000, 60000000, 55000000, 70000000, 68000000, 75000000, 80000000, 65000000, 90000000, totalRevenue];

    new Chart(ctxRev, {
        type: 'bar', 
        data: {
            labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12 (Hiện tại)'],
            datasets: [{
                label: 'Doanh thu (VNĐ)',
                data: monthlyData,
                backgroundColor: [
                    'rgba(75, 54, 33, 0.5)', 'rgba(75, 54, 33, 0.5)', 'rgba(75, 54, 33, 0.5)',
                    'rgba(75, 54, 33, 0.5)', 'rgba(75, 54, 33, 0.5)', 'rgba(75, 54, 33, 0.5)',
                    'rgba(75, 54, 33, 0.5)', 'rgba(75, 54, 33, 0.5)', 'rgba(75, 54, 33, 0.5)',
                    'rgba(75, 54, 33, 0.5)', 'rgba(75, 54, 33, 0.5)', 
                    '#d35400'
                ],
                borderRadius: 5
            }]
        },
        options: { responsive: true, maintainAspectRatio: false }
    });

    // --- 5. VẼ BIỂU ĐỒ TRÒN ---
    const ctxProd = document.getElementById('productChart').getContext('2d');
    new Chart(ctxProd, {
        type: 'doughnut', 
        data: {
            labels: ['Cà phê', 'Trà sữa', 'Bánh ngọt', 'Trà'],
            datasets: [{ data: [40, 30, 10, 20], backgroundColor: ['#4b3621', '#d35400', '#f1c40f', '#27ae60'] }]
        },
        options: { responsive: true, maintainAspectRatio: false }
    });

    // --- 6. HIỆN BẢNG DANH SÁCH ĐƠN HÀNG ---
    const tableBody = document.getElementById('transactionTable');
    tableBody.innerHTML = ""; 

    if (transactions.length === 0) {
        tableBody.innerHTML = "<tr><td colspan='5' style='text-align:center;'>Chưa có đơn hàng nào</td></tr>";
    } else {
        transactions.forEach(t => {
            let statusHTML = t.status === 'done' 
                ? '<span class="status done">Hoàn thành</span>' 
                : '<span class="status pending">Đang chờ</span>';
            
            tableBody.innerHTML += `
                <tr>
                    <td>${t.id}</td>
                    <td>${t.user}</td>
                    <td>${t.item}</td>
                    <td>${t.total}</td>
                    <td>${statusHTML}</td>
                </tr>
            `;
        });
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
