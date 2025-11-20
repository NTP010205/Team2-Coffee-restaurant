// ========== DANH SÁCH SẢN PHẨM ========== //
let products = [
    // --- Menu Cà Phê (Coffee) ---
    { name: "Caramel Macchiato", price: "32 - 39", image:"images/caramel.jpg "},
    { name: "Cappuccino", price: 40, image:"images/Capuchino.png" },
    { name: "Salt Coffee", price: "35 - 40", image:"images/Muoi.jpg" },
    { name: "Egg Coffee", price: "37 - 45" , image:"images/CF trứng.png" },
    { name: "Americano", price: "32 - 39" , image:"images/americano.jpg" },
    { name: "Charcoal Coffee", price: "32 - 39", image:"images/CF Than.png"  },
    { name: "Coffee Mocha", price: "42 - 47", image:"images/mocha.jpg"  },
    { name: "Honey Vanilla Machiato", price: "42 - 47" , image:"images/Gemini_Generated_Image_ncy9efncy9efncy9.png" },

    // --- Menu Trà (Tea) ---
    { name: "Lychee Jelly Tea <br> (Trà Thạch Vải)", price: "40 - 45", image:"images/Trà thạch vải.png"  },
    { name: "Matcha Red Bean Tea <br> (Trà xanh đậu đỏ)", price: "45 - 50" , image:"images/Matcha Red Been Tea.png" },
    { name: "Green Tea With Honey (Lục trà mật ong)", price: "40 - 45" , image:"images/mật ong.jpg" },
    { name: "Lyche Tea <br> (Trà long nhãn)", price: "40 - 45", image:"images/Long nhãn.jpg"  },
    { name: "Peach Tea <br> (Trà đào)", price: "40 - 45" , image:"images/trà đào.png" },
    { name: "Black Grape Tea <br> (Trà nho đen)", price: "42 - 47" , image:"images/trà nho đen.png" },
    { name: "Strawberry Tea <br> (Trà dâu)", price: "42 - 47", image:"images/trà dâu.png"  },
    { name: "Melon Tea <br> (Trà dưa lưới)", price: "42 - 47", image:"images/trà dưa lưới.png"  },

    // --- Menu Trà Sữa (Milk Tea) ---
    { name: "Traditional Bubble Milk Tea <br> (Trà sữa trân châu truyền thống)", price: "40 - 45" , image:"images/TS truyền thống.png" },
    { name: "Grill Milk Tea <br> (Trà sữa Nướng)", price: "45 - 50", image:"images/TS nướng.png"  },
    { name: "Thai Green/Red Milk Tea <br> (Trà sữa Thái Xanh/Thái Đỏ)", price: "40 - 45" , image:"images/Trà sữa thái xanhdo.png" },
    { name: "Taro Milk Tea <br> (Trà sữa khoai môn)", price: "40 - 45" , image:"images/TS khoai môn.png" },
    { name: "Taro Jasmine Milk Tea <br> (Lục trà sữa song hỷ khoai môn)", price: "42 - 47", image:"images/Song hỷ.png"  },
    { name: "Jasmine Milk Tea <br> (Trà sữa tuyết lài)", price: "40 - 45", image:"images/Tuyet lài.png"  },
    { name: "Matcha Milk Tea <br> (Trà sữa matcha)", price: "42 - 47" , image:"images/MAtcha.png" },
    { name: "Oreo Milk Tea <br> (Trà sữa Oreo)", price: "45 - 50" , image:"images/Oreo.png" },
    
    // --- Menu Bánh (Cake) ---
    { name: "Mango Tiramisu", price: 45 , image:"images/Bánh xoài.png"},
    { name: "Socola Tiramisu", price: 40 , image:"images/Bánh Socola.png"},
    { name: "Strawberry Mouse Cake", price: 40 , image:"images/Bánh dâu.png"},
    { name: "Caramel Swis Roll", price: 30 , image:"images/Bánh cuộn.png"},
    { name: "Cream Croissant Matcha", price: 55 , image:"images/bánh sừng bò.png"}, 
    { name: "Cream Puffs", price: 25 , image:"images/Bánh su kem.png"},
    { name: "Baked Cheesecake", price: 30 , image:"images/Bánh phô mai nướng.png"},
    { name: "Egg Tarts", price: 15, image:"images/bánh trứng.png" }
];

// Hàm này sẽ chuẩn hóa hiển thị giá, thêm "đ" và xử lý các khoảng giá
function formatPrice(price) {
    if (typeof price === 'number') {
        return price + "K"; 
    }
    return price.replace(/-/g, ' - ') + "K"; 
}

function renderProducts() {
  const list = document.getElementById('productList');
  if (!list) return; // Chặn lỗi nếu không ở trang chủ
  list.innerHTML = "";
  products.forEach((p, i) => {
    list.innerHTML += `
      <div class="product">
        <img src="${p.image}" alt="${p.name}">
        <h3>${p.name}</h3>
        <p>Giá: ${p.price.toLocaleString()}K</p>
        <button onclick="openPopup('${p.name}', '${p.image}')">Đặt hàng</button>
      </div>`;
  });
}

renderProducts();

// ========== QUẢN LÝ TÀI KHOẢN (ĐÃ SỬA ĐỂ HIỆN TÊN) ========== //

// 1. Chạy kiểm tra ngay khi trang web tải xong
window.addEventListener('load', function() {
    checkLoginStatus();
});

// 2. Hàm kiểm tra trạng thái (CẬP NHẬT: Hiển thị tên)
function checkLoginStatus() {
    const role = localStorage.getItem('userRole');
    const isLoggedIn = localStorage.getItem('isLoggedIn');
    const username = localStorage.getItem('currentUsername'); 

    // Lấy các thẻ HTML
    const adminLink = document.getElementById('adminLink');
    const loginBtn = document.getElementById('loginBtn');
    const logoutBtn = document.getElementById('logoutBtn');
    const adminControls = document.getElementById('adminControls');
    const welcomeUser = document.getElementById('welcomeUser'); 

    // Nếu ĐÃ ĐĂNG NHẬP
    if (isLoggedIn === 'true') {
        // Ẩn nút Đăng nhập, hiện nút Đăng xuất
        if(loginBtn) loginBtn.style.display = 'none';
        if(logoutBtn) logoutBtn.style.display = 'inline-block';

        // --- MỚI: HIỂN THỊ TÊN TRÊN MENU ---
        if (welcomeUser) {
            welcomeUser.style.display = 'inline-block';
            if (role === 'admin') {
                welcomeUser.innerHTML = "Xin chào, <b>Chủ Quán</b>";
            } else {
                welcomeUser.innerHTML = `Xin chào, <b>${username}</b>`;
            }
        }

        // RIÊNG ADMIN: Hiện nút Thống kê & Quản lý
        if (role === 'admin') {
            if(adminLink) {
                adminLink.style.display = 'inline-block'; 
                adminLink.style.color = 'red'; 
            }
            if(adminControls) {
                adminControls.style.display = 'block'; 
            }
        }
    }
}

// ⭐ SỬA: Hàm Đăng Xuất (Thêm xóa SĐT, Địa chỉ)
function dangXuat() {
    // Xóa tất cả thông tin phiên đăng nhập
    localStorage.removeItem('userRole');
    localStorage.removeItem('isLoggedIn');
    localStorage.removeItem('currentUsername');
    localStorage.removeItem('currentUserPhone'); // <-- Dòng mới
    localStorage.removeItem('currentUserAddress'); // <-- Dòng mới
    
    alert("Đã đăng xuất thành công!");
    
    // Tải lại trang để giao diện quay về mặc định
    window.location.href = "index.html"; 
}

// ========== XỬ LÝ ĐĂNG NHẬP & ĐĂNG KÝ ========== //

function showRegister() {
    document.getElementById('loginForm').style.display = 'none';
    document.getElementById('registerForm').style.display = 'block';
}

function showLogin() {
    document.getElementById('registerForm').style.display = 'none';
    document.getElementById('loginForm').style.display = 'block';
}

// ⭐ SỬA: Nâng cấp hàm register để lưu SĐT, Địa chỉ
function register() {
    // 1. Lấy thông tin cơ bản
    let username = document.getElementById('reg-username').value;
    let email = document.getElementById('reg-email').value;
    let pass = document.getElementById('reg-password').value;
    
    // 2. THÊM 2 DÒNG LẤY SĐT VÀ ĐỊA CHỈ
    // (Lấy ID từ file login.html của bạn)
    let phone = document.getElementById('phone').value;
    let address = document.getElementById('address').value;
    // (Giới tính tui chưa thấy ID nên chưa thêm, nếu cần bạn báo tui)

    // 3. Sửa kiểm tra
    if(username == "" || email == "" || pass == "" || phone == "" || address == "") {
        alert("Vui lòng nhập đầy đủ Tên, Email, Mật khẩu, SĐT và Địa chỉ!");
        return;
    }

    // 4. Kiểm tra trùng lặp
    if (localStorage.getItem('user_' + username)) {
        alert("Tên đăng nhập này đã tồn tại!");
        return;
    }

    // 5. SỬA CÁCH LƯU: Chuyển sang lưu bằng JSON Object
    const userAccount = {
        password: pass,
        email: email,
        phone: phone,
        address: address
    };
    localStorage.setItem('user_' + username, JSON.stringify(userAccount)); // Lưu "gói"

    // 6. Tăng số lượng khách hàng (Giữ nguyên)
    let count = parseInt(localStorage.getItem('customerCount')) || 0;
    count++;
    localStorage.setItem('customerCount', count);
    
    alert("Đăng ký thành công! Mời bạn đăng nhập.");
    showLogin(); 
}

// ⭐ SỬA: Nâng cấp hàm login để đọc SĐT, Địa chỉ
function login() {
    let username = document.getElementById('login-username').value;
    let pass = document.getElementById('login-password').value;

    // 1. ADMIN (Giữ nguyên)
    if (username === 'chuquan' && pass === 'admin123') {
        alert("Xin chào Chủ Quán! Đang vào hệ thống...");
        localStorage.setItem('userRole', 'admin'); 
        localStorage.setItem('isLoggedIn', 'true');
        localStorage.setItem('currentUsername', 'Chủ Quán'); 
        
        window.location.href = "index.html"; 
        return;
    }

    // 2. KHÁCH HÀNG (Sửa lại để đọc JSON)
    let storedUserString = localStorage.getItem('user_' + username); // Lấy "gói"
    
    if (storedUserString) {
        // Nếu tìm thấy, giải nén "gói"
        const userAccount = JSON.parse(storedUserString);

        // So sánh mật khẩu BÊN TRONG gói
        if (userAccount.password === pass) {
            // Đăng nhập đúng
            alert("Đăng nhập thành công!");
            localStorage.setItem('userRole', 'customer');
            localStorage.setItem('isLoggedIn', 'true');
            localStorage.setItem('currentUsername', username); 
            
            // LƯU SĐT VÀ ĐỊA CHỈ ĐỂ DÙNG CHO MODAL
            localStorage.setItem('currentUserPhone', userAccount.phone);
            localStorage.setItem('currentUserAddress', userAccount.address);
            
            window.location.href = "index.html"; 
        
        } else {
            alert("Sai mật khẩu rồi!");
        }
    } else {
        alert("Tên đăng nhập không tồn tại!");
    }
}

// ========== QUẢN LÝ SẢN PHẨM (ADMIN) ========== //
function addProduct() {
    const nameInput = document.getElementById('newName');
    const priceInput = document.getElementById('newPrice');
    const name = nameInput ? nameInput.value.trim() : "";
    const price = priceInput ? priceInput.value.trim() : "";
    
    if (name && price) {
        products.push({ name: name, price: price }); 
        renderProducts();
        alert(`Thêm sản phẩm "${name}" thành công!`);
        if (nameInput) nameInput.value = '';
        if (priceInput) priceInput.value = '';
    } else {
         alert("Vui lòng nhập đầy đủ Tên và Giá sản phẩm.");
    }
}

// ========== ĐƠN HÀNG ========== //
let cart = [];

function orderProduct(i) {
    const today = new Date().toLocaleDateString('vi-VN');
    const existingItem = cart.find(item => item.name === products[i].name);
    if (existingItem) {
        existingItem.quantity += 1;
    } else {
        cart.push({
            name: products[i].name,
            price: products[i].price,
            date: today,
            quantity: 1
        });
    }
    document.getElementById('cartCount').innerText = cart.reduce((sum, item) => sum + item.quantity, 0);
    alert(`Đã thêm "${products[i].name}" vào giỏ hàng!`);
}

// =======Cho chọn size =====
let selectedProduct = null;

function openPopup(productName, productImage) {
  selectedProduct = productName;
  document.getElementById('productName').innerText = "Sản phẩm: " + productName;
  document.getElementById('popupImage').src = productImage;
  document.getElementById('sizePopup').style.display = 'block';
}

function closePopup() {
  document.getElementById('sizePopup').style.display = 'none';
}

function showToast(message) {
  const toast = document.getElementById('toast');
  toast.textContent = message;
  toast.classList.add('show');
  setTimeout(() => {
    toast.classList.remove('show');
  }, 3000); // Ẩn sau 3 giây
}

function confirmOrder() {
  const selectedSize = document.querySelector('input[name="size"]:checked');
  if (!selectedSize) {
    showToast('Vui lòng chọn size!');
    return;
  }
  const size = selectedSize.value;
  const price = selectedSize.dataset.price;
  cart.push({ name: selectedProduct + " - Size " + size, price: price, quantity: 1 });
  document.getElementById('cartCount').innerText = cart.reduce((sum, item) => sum + item.quantity, 0);
  showToast(`Đã thêm ${selectedProduct} (Size ${size}) vào giỏ hàng với giá ${price}đ`);
  closePopup();
}

// Sự kiện click vào icon giỏ hàng
document.getElementById('cartIcon').addEventListener('click', () => {
    const cartPopup = document.getElementById('cartPopup');
    const cartItems = document.getElementById('cartItems');
    cartItems.innerHTML = '';

    if (cart.length === 0) {
        cartItems.innerHTML = '<li>Giỏ hàng trống</li>';
    } else {
        cart.forEach(item => {
            const li = document.createElement('li');
            li.textContent = `${item.name} - ${item.price}K`; // Lưu ý: giá đang là chuỗi hoặc số
            cartItems.appendChild(li);
        });
        
        // --- THÊM NÚT THANH TOÁN ---
        const payBtn = document.createElement('button');
        payBtn.innerText = "Thanh Toán Ngay";
        payBtn.style.marginTop = "10px";
        payBtn.style.backgroundColor = "green";
        payBtn.style.color = "white";
        payBtn.id = "btnThanhToanNgay";// Gọi hàm thanh toán sửa
        cartItems.appendChild(payBtn);
    }
    cartPopup.style.display = 'block';
});


// ========== GÓP Ý KHÁCH HÀNG ========== //
function sendFeedback(e) {
    e.preventDefault();
    const rate = document.getElementById('rating').value; 
    const cmt = document.getElementById('comment').value; 
    
    if (rate && cmt) {
        alert(`Cảm ơn góp ý của bạn!\nMức đánh giá: ${rate} sao\nNội dung: ${cmt}`);
        e.target.reset();
    } else {
        alert("Vui lòng nhập đầy đủ Đánh giá và Nội dung góp ý.");
    }
}

// ========== THỐNG KÊ (Chart.js) ========== //
function drawRevenueChart() {
    // --- THÊM ĐOẠN NÀY: Nếu không tìm thấy biểu đồ thì dừng lại (tránh lỗi trang chủ) ---
    const chartElement = document.getElementById('myChart');
    if (!chartElement) return; 
    // -----------------------------------------------------------------------------------

    const ctx = chartElement.getContext('2d');
    let gradient = ctx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, 'rgba(111, 78, 55, 0.9)'); 
    gradient.addColorStop(1, 'rgba(243, 229, 171, 0.4)'); 

    const monthlyRevenue = [
        45000000, 52000000, 48000000, 60000000, 
        55000000, 70000000, 68000000, 75000000, 
        80000000, 65000000, 90000000, 120000000
    ];

    new Chart(ctx, {
        type: 'bar', 
        data: {
            labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
            datasets: [{
                label: 'Doanh thu (VNĐ)',
                data: monthlyRevenue,
                backgroundColor: gradient, 
                borderColor: '#4b3621',  
                borderWidth: 1,
                borderRadius: 5,         
                hoverBackgroundColor: '#d35400', 
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false, 
            plugins: {
                legend: { display: true, position: 'top' },
                tooltip: { 
                    backgroundColor: 'rgba(0, 0, 0, 0.8)',
                    padding: 10,
                    callbacks: {
                        label: function(context) {
                            let value = context.raw;
                            return ' Doanh thu: ' + new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'K' }).format(value);
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', maximumSignificantDigits: 3 }).format(value);
                        }
                    },
                    grid: { color: '#f0f0f0' }
                },
                x: { grid: { display: false } }
            }
        }
    });
}

// Gọi hàm vẽ 
drawRevenueChart();

// ========== CHATBOT ========== //
const chatInput = document.getElementById('chatInput');
const chatMessages = document.getElementById('chatMessages');

if (chatInput && chatMessages) {
    chatInput.addEventListener('keypress', e => {
        if (e.key === 'Enter' && chatInput.value.trim() !== "") {
            let user = chatInput.value.trim();
            chatMessages.innerHTML += `<p class="user-message"><b>Bạn:</b> ${user}</p>`; 
            
            let bot = "Xin lỗi, tôi chưa hiểu ý bạn."; 
            let lowerCaseUser = user.toLowerCase();

            if (lowerCaseUser.includes("giờ")) {
                bot = "Quán mở cửa từ 7h sáng đến 10h tối mỗi ngày, kể cả cuối tuần.";
            } else if (lowerCaseUser.includes("địa chỉ")) {
                bot = "Địa chỉ chính thức của 12% Coffee là: 123 Nguyễn Văn Cừ, Quận 5, TP.HCM.";
            } else if (lowerCaseUser.includes("giá")) {
                bot = "Mức giá đồ uống và bánh của chúng tôi dao động từ 15.000đ đến 55.000đ.";
            } else if (lowerCaseUser.includes("chào") || lowerCaseUser.includes("hello")) {
                bot = "Chào bạn! Tôi là bot hỗ trợ của 12% Coffee.";
            } else if (lowerCaseUser.includes("cảm ơn")) {
                bot = "Không có gì, rất vui được phục vụ bạn!";
            }

            chatMessages.innerHTML += `<p class="bot-message"><b>Bot:</b> ${bot}</p>`;
            chatInput.value = "";
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }
    });
}

// ========== SCRIPT XỬ LÝ MODAL HÓA ĐƠN (Phiên bản JS) ==========
// Dán vào cuối file .js của bạn

// 1. CHỜ TRANG TẢI XONG
document.addEventListener('DOMContentLoaded', function() {
    
    // 2. LẤY CÁC KHUNG POP-UP (Từ file HTML của bạn)
    const paymentOverlay = document.getElementById('paymentOverlay');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const confirmOrderBtn = document.getElementById('confirmOrderBtn');

    // Lấy các ô để điền thông tin
    const modalHoTen = document.getElementById('modalHoTen');
    const modalSdt = document.getElementById('modalSdt');
    const modalDiaChi = document.getElementById('modalDiaChi');
    const modalBillItems = document.getElementById('modalBillItems');
    const modalTotal = document.getElementById('modalTotal');

    // 3. HÀM MỞ POP-UP (Sẽ được gọi bằng nút 'btnThanhToanNgay')
    function openPaymentModal() {
        
        // 3.1. Lấy thông tin đăng nhập từ LOCALSTORAGE
        const userIsLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
        const userHoTen = localStorage.getItem('currentUsername');

        // 3.2. Kiểm tra đăng nhập
        if (userIsLoggedIn === false) {
            alert('Vui lòng đăng nhập để thanh toán!');
            window.location.href = 'login.html'; // Chuyển đến trang login
            return;
        }

        // 3.3. Kiểm tra giỏ hàng (mảng 'cart' toàn cục của bạn)
        if (cart.length === 0) {
            alert('Giỏ hàng của bạn đang trống!');
            return;
        }

        // 3.4. ĐIỀN THÔNG TIN NGƯỜI DÙNG VÀO POP-UP
        modalHoTen.innerText = userHoTen || "Khách vãng lai";
        
        // ⚠️ LƯU Ý: Hệ thống login CŨ của bạn CHƯA LƯU SĐT/Địa chỉ.
        // Tạm thời hiển thị thế này:
        // ⭐ SỬA: Đọc SĐT và Địa chỉ từ localStorage
        modalSdt.innerText = localStorage.getItem('currentUserPhone') || "Chưa có";
        modalDiaChi.innerText = localStorage.getItem('currentUserAddress') || "Chưa có";
        
        // (Khi nào bạn muốn sửa hàm register/login để lưu SĐT/Địa chỉ, 
        //  hãy báo tui, tui sẽ sửa 2 dòng trên lại)


        // 3.5. ĐIỀN HÓA ĐƠN TỪ MẢNG 'cart'
        modalBillItems.innerHTML = ''; // Xóa hóa đơn cũ
        let tongTien = 0;

        for (const item of cart) {
            // Tạo một dòng mới cho mỗi sản phẩm
            const itemHtml = document.createElement('p');
            // Dùng item.name và item.price từ mảng 'cart'
            // Chuyển giá từ chuỗi sang số để tính
            let itemPrice = parseFloat(item.price) || 0; 
            let itemTotal = itemPrice * item.quantity;
            
            itemHtml.innerText = `${item.name} (SL: ${item.quantity}) - ${itemTotal}K`;
            modalBillItems.appendChild(itemHtml);
            
            // Tính tổng tiền
            tongTien += itemTotal;
        }
        
        // Hiển thị tổng tiền
        modalTotal.innerText = `${tongTien}K`;

        // 3.6. HIỂN THỊ POP-UP LÊN
        document.getElementById('cartPopup').style.display = 'none'; // Đóng giỏ hàng nhỏ
        paymentOverlay.style.display = 'flex'; // Hiện pop-up hóa đơn
    }

    // 4. LẮNG NGHE SỰ KIỆN CLICK
    // Vì nút 'btnThanhToanNgay' được tạo sau, ta phải lắng nghe trên 'document'
    document.body.addEventListener('click', function(event) {
        // Nếu nhấn đúng nút 'Thanh Toán Ngay'
        if (event.target.id === 'btnThanhToanNgay') {
            openPaymentModal();
        }
    });

    // 5. KHI NHẤN NÚT "X" ĐỂ TẮT (Nếu có)
    if (closeModalBtn) {
        closeModalBtn.addEventListener('click', function() {
            paymentOverlay.style.display = 'none'; // Ẩn pop-up
        });
    }

    // 6. KHI NHẤN NÚT "HOÀN TẤT ĐẶT HÀNG" (Nếu có)
    if (confirmOrderBtn) {
        confirmOrderBtn.addEventListener('click', function() {
            const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;

            // Lấy thông tin đơn hàng
            let currentUser = localStorage.getItem('currentUsername') || "Khách vãng lai";
            let madon = "#DH" + Math.floor(Math.random() * 10000);
            let orderDetails = cart.map(c => `${c.name} (x${c.quantity})`).join(', ');
            let total = modalTotal.innerText; // Lấy tổng tiền đã tính

            // TẠO ĐƠN HÀNG MỚI (Giống hàm thanhToan cũ của bạn)
            let newOrder = {
                id: madon,
                user: currentUser,
                item: orderDetails,
                total: total,
                status: "pending",
                payment: paymentMethod // Thêm phương thức thanh toán
            };

            // Lấy danh sách đơn hàng cũ và lưu
            let listDonHang = JSON.parse(localStorage.getItem('listDonHang')) || [];
            listDonHang.unshift(newOrder);
            localStorage.setItem('listDonHang', JSON.stringify(listDonHang));

            // Thông báo
            if (paymentMethod === 'cash') {
                alert(`Đặt hàng thành công! Mã đơn: ${madon}\nBạn sẽ thanh toán bằng Tiền Mặt khi nhận hàng.`);
            } else {
                alert(`Đặt hàng thành công! Mã đơn: ${madon}\nCảm ơn bạn đã thanh toán qua Banking!`);
            }

            // Xóa giỏ hàng
            cart = [];
            document.getElementById('cartCount').innerText = "0";
            paymentOverlay.style.display = 'none'; // Ẩn pop-up
        });
    }

    // 7. Tắt pop-up khi nhấn ra ngoài nền mờ (Nếu có)
    if (paymentOverlay) {
        paymentOverlay.addEventListener('click', function(event) {
            if (event.target === paymentOverlay) {
                paymentOverlay.style.display = 'none';
            }
        });
    }
});