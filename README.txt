README - ĐỒ ÁN LẬP TRÌNH ỨNG DỤNG WEB
====================================

NHÓM: 02
HỌC PHẦN: Lập Trình Ứng Dụng Web
Giảng viên: Trần Công Thanh

----------------------------------------------------------------------
I. THÔNG TIN THÀNH VIÊN
----------------------------------------------------------------------
- 2474802016639 - Nguyễn Thành Phát - Leader, Thuyết trình, PPT, Frontend, Database
- 2474802010135 - Huỳnh Gia Huy	- Tìm thông tin hình ảnh, Sơ đồ ERD, Triển khai, PPT, Báo cáo
- 2474802010483 - Trịnh Ngọc Minh Nhật - Frontend, Sơ đồ chức năng, Thiết kế web
- 2474802010285 - Phạm Thị Nhi - Tìm thông tin hình ảnh, sơ đồ cơ sở dữ liệu, PPT
- 2474802010118 - Huỳnh Nhựt Hòa - Backend, usecase, xử lý lỗi

----------------------------------------------------------------------
II. MÔ TẢ ĐỀ TÀI
----------------------------------------------------------------------
Tên đề tài: XÂY DỰNG WEBSITE ĐỘNG QUẢN LÝ DỮ LIỆU THỰC TÉ
QUÁN COFFEE

Mô tả ngắn:
Website mô phỏng hệ thống quản lý dữ liệu cho quán Coffee, sử dụng HTML5, CSS3, JavaScript, PHP và MySQL.  
Chức năng chính: đăng ký – đăng nhập, quản lý sản phẩm, quản lý đơn hàng, đánh giá – bình luận, xem tin tức, chatbot hỗ trợ, thống kê doanh thu và quản trị dữ liệu theo phân quyền.

----------------------------------------------------------------------
III. CÁCH CÀI ĐẶT & CHẠY DỰ ÁN (LOCALHOST - XAMPP)
----------------------------------------------------------------------
1. Cài đặt XAMPP
2. Copy toàn bộ thư mục SourceCode vào:
   htdocs/<ten_du_an>/
3. Khởi động Apache và MySQL
4. Import Database:
   - Mở phpMyAdmin
   - Tạo database mới: <ten_database>
   - Import file: Database/database.sql
5. Chạy dự án:
   http://localhost/<ten_du_an>

----------------------------------------------------------------------
IV. TÀI KHOẢN ĐĂNG NHẬP
----------------------------------------------------------------------
Ví dụ (cập nhật theo nhóm):
- chuquan / admin123
đăng ký là sẽ vô được của người dùng

----------------------------------------------------------------------
V. LINK TRIỂN KHAI ONLINE (FREE HOST)
----------------------------------------------------------------------
URL: https://thecoffeeshop.42web.io/

----------------------------------------------------------------------
VI. LINK GITHUB (BẮT BUỘC)
----------------------------------------------------------------------
Repo chính (public): 
https://github.com/NTP010205/Team2-Coffee-restaurant/tree/dev

Nhánh từng sinh viên (BẮT BUỘC):
- SV1: https://github.com/NTP010205/Team2-Coffee-restaurant/tree/Database_SV1_NguyenThanhPhat
- SV2: https://github.com/NTP010205/Team2-Coffee-restaurant/tree/So_do_ERD_SV2_HuynhGiaHuy
- SV3: https://github.com/NTP010205/Team2-Coffee-restaurant/tree/So-Do-Chuc-Nang_SV3_TrinhNgocMinhNhat
- SV4: https://github.com/NTP010205/Team2-Coffee-restaurant/tree/So-Do-CSDL_SV4_PhamThiNhi
- SV5: https://github.com/NTP010205/Team2-Coffee-restaurant/tree/Use-Case_SV5_HuynhNhutHoa

Ghi chú:
=> Mỗi thành viên phải có log commit rõ ràng xuyên suốt 3 tuần.
=> Không có log = không đạt đồ án (theo yêu cầu học phần).

----------------------------------------------------------------------
VII. CẤU TRÚC THƯ MỤC BÀI NỘP
----------------------------------------------------------------------
/SourceCode
    (Toàn bộ mã nguồn website)
    
/Database
    database.sql (script tạo bảng & dữ liệu mẫu)

/Documents
    BaoCao_DoAn_WebApp.pdf
    PhanCongThanhVien.pdf (hoặc nằm trong báo cáo)

/Slides
    SlideThuyetTrinh.pdf hoặc .pptx

/Video (tùy chọn - khuyến khích)
/README.txt

----------------------------------------------------------------------
VIII. GHI CHÚ QUAN TRỌNG
----------------------------------------------------------------------
- Website phải chạy trên XAMPP và free host.
- Database phải import được không lỗi.
- Mã nguồn phải có comment, đặt tên rõ ràng.
- Báo cáo 10–15 trang kèm sơ đồ chức năng + ERD.
- Slide thuyết trình chuẩn bị đúng hạn.
- Đảm bảo mỗi thành viên hiểu phần mình làm.
