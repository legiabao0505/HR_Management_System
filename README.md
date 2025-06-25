# HR Management System

## Giới thiệu
**HR Management System** là hệ thống quản lý nhân sự hiện đại, xây dựng với ReactJS (Front-End), NodeJS/Express (Back-End) và MySQL (Database). Ứng dụng hỗ trợ quản lý nhân viên, phân ca tự động, AI đánh giá hiệu suất, phân quyền bảo mật JWT, và nhiều tính năng khác dành cho cả quản trị viên và nhân viên.

---

## Tính năng chính

- **Quản lý nhân viên:** Thêm, sửa, xóa, tìm kiếm, phân loại nhân viên.
- **Quản lý danh mục:** Thêm, sửa, xóa các danh mục phòng ban/chức vụ.
- **Phân ca tự động:** Tự động sắp xếp lịch làm việc cho nhân viên theo tuần.
- **Lịch làm việc:** Hiển thị lịch làm việc dạng bảng và dạng lịch cho từng nhân viên.
- **Đăng nhập/Đăng xuất:** Hệ thống phân quyền cho admin và nhân viên.
- **Chỉnh sửa thông tin cá nhân:** Nhân viên có thể cập nhật thông tin cá nhân.
- **AI đánh giá hiệu suất:** Tích hợp OpenAI GPT-4o đánh giá báo cáo nhân viên.
- **Bảo mật JWT:** Middleware xác thực token cho các route nhạy cảm.
- **Giao diện hiện đại:** Responsive, hiệu ứng đẹp mắt, dễ sử dụng.

---

## Công nghệ sử dụng

- **Front-End:** ReactJS, Bootstrap, React Router, React Big Calendar, Axios
- **Back-End:** NodeJS, ExpressJS, JWT, MySQL, OpenAI (GPT-4o)
- **Database:** MySQL

---

## Cài đặt & chạy thử

### 1. Clone project
```bash
git clone https://github.com/legiabao0505/HR_Management_System.git
cd HR_Management_System
```

### 2. Cài đặt dependencies cho backend và frontend
```bash
cd "Server Side"
npm install
cd "../Front-End Folder"
npm install
```

### 3. Tạo file .env cho backend (Server Side)
```
# .env ví dụ
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=yourpassword
DB_NAME=hr_management
JWT_SECRET=your_jwt_secret
OPENAI_API_KEY=your_openai_key
```

### 4. Khởi động backend
```bash
cd "Server Side"
npm start
```

### 5. Khởi động frontend
```bash
cd "../Front-End Folder"
npm run dev
```

### 6. Truy cập hệ thống
- Frontend: http://localhost:5173
- Backend API: http://localhost:3000

---

## Lưu ý
- Đảm bảo MySQL đã khởi động và import file `employeems.sql` trước khi chạy backend.
- Đổi các API endpoint trong frontend sang `/api/{module}/...` theo cấu trúc mới.
- Đọc kỹ comment trong từng file controller/route để mở rộng tính năng.