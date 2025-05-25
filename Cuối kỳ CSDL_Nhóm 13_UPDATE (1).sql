--Câu 2: Chuyển đổi sang lược đồ quan hệ 
--DIEMTHI (DIEMTHISO, DIACHIDIEMTHI)  
--PHONGTHI (MAPHONGTHI, DIEMTHISO, GHICHU)  
--NGANH (MANGANH, TENNGANH)  
--DONVI (MADONVI, TENDONVI)  
--CANBO (MACANBO, HOTENCB, CHUCVU, MADONVI, DIEMTHISO)  
--MONTHI (MAMT, TENMT, NGAYTHI, MAPHONGTHI, BUOITHI, PHUT, 
--MACANBO)  
--THISINH (SOBD, MANGANH, KHUVUC, TINH, HOTEN, NGAYSINH, PHAI, 
--DOITUONG, MAPHONGTHI). 
--Câu 3:  Cài đặt lược đồ quan hệ vào trong hệ quản trị CSDL SQL Sever – 
CREATE DATABASE QUANLICOITHITUYENSINH; 
GO
USE QUANLICOITHITUYENSINH;
GO
--Tạo bảng Điểm thi 
CREATE TABLE DIEMTHI ( 
DIEMTHISO NVARCHAR(100) PRIMARY KEY, 
DiaChiDiemThi NVARCHAR(255) 
); 
--Tạo bảng Phòng thi 
CREATE TABLE PHONGTHI ( 
MAPhongThi NVARCHAR(100) PRIMARY KEY, 
DIEMTHISO NVARCHAR(100), 
GHICHU NVARCHAR(100) 
); 
--Tạo bảng Thí sinh 
CREATE TABLE THISINH ( 
SBD INT PRIMARY KEY, 
DoiTuong NVARCHAR(100), 
Phai NVARCHAR(15), 
NgaySinh DATE, 
HoTen NVARCHAR(100), 
Tinh NVARCHAR(50), 
KhuVuc NVARCHAR(50), 
MANGANH INT, 
DIEMTHISO NVARCHAR(100), 
MAPHONGTHI NVARCHAR(100) 
); 
--Tạo bảng Ngành 
CREATE TABLE NGANH ( 
MaNganh INT PRIMARY KEY, 
TenNganh NVARCHAR(100) 
); 
--Tạo bảng Cán bộ 
CREATE TABLE CANBO ( 
MaCanBo NVARCHAR(50) PRIMARY KEY, 
HoTenCB NVARCHAR(100), 
ChucVu NVARCHAR(50), 
MaDonVi NVARCHAR(100), 
DIEMTHISO NVARCHAR(100) 
); 
--Tạo bảng Đơn vị 
CREATE TABLE DONVI ( 
MaDonVi NVARCHAR(100) PRIMARY KEY, 
TenDonVi NVARCHAR(100) 
); 
--Tạo bảng môn thi 
CREATE TABLE MONTHI ( 
MaMT NVARCHAR(100) PRIMARY KEY, 
MAPHONGTHI NVARCHAR(100), 
MACANBO NVARCHAR(50), 
TenMT NVARCHAR(100), 
NgayThi DATE, 
BuoiThi NVARCHAR(100), 
Phut INT 
); 
--Tạo thuộc tính khóa phụ 
ALTER TABLE PHONGTHI  
ADD CONSTRAINT FK_DiemThiSo_DIEMTHI  
FOREIGN KEY (DIEMTHISO) REFERENCES DIEMTHI(DIEMTHISO); 
ALTER TABLE THISINH 
ADD CONSTRAINT FK_MaNganh_NGANH 
FOREIGN KEY (MANGANH) REFERENCES NGANH(MaNganh); 
ALTER TABLE THISINH 
ADD CONSTRAINT FK_MaphongThi_PHONGTHI 
FOREIGN KEY (MAPHONGTHI) REFERENCES PHONGTHI(MAPHONGTHI); 
ALTER TABLE CANBO 
ADD CONSTRAINT FK_MADONVI_DONVI  
FOREIGN KEY (MaDonVi) REFERENCES DONVI(MaDonVi); 
ALTER TABLE CANBO 
ADD CONSTRAINT FK_DIEMTHISO2_DIEMTHI 
FOREIGN KEY (DIEMTHISO) REFERENCES DIEMTHI(DIEMTHISO); 
ALTER TABLE MONTHI  
ADD CONSTRAINT FK_MAPHONGTHI2_PHONGTHI 
FOREIGN KEY (MAPHONGTHI) REFERENCES PHONGTHI(MAPHONGTHI); 
ALTER TABLE MONTHI 
ADD CONSTRAINT FK_MACANBO_CANBO 
FOREIGN KEY (MACANBO) REFERENCES CANBO(MaCanBo); 
--Nhập dữ liệu 
--Nhập dữ liệu Điểm thi 
INSERT INTO DIEMTHI (DIEMTHISO, DiaChiDiemThi) 
VALUES  
(N'ĐIỂM THI SỐ 1', N'Trường Đại học Công Nghiệp TP. Hồ Chí Minh - 12 Nguyễn Văn Bảo, 
Phường 4, Gò Vấp, Thành phố Hồ Chí Minh'), 
(N'ĐIỂM THI SỐ 2', N'Trường Đại học Công Nghệ TP. Hồ Chí Minh - 31/36 Ung Văn Khiêm, 
Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh'), 
(N'ĐIỂM THI SỐ 3', N'Trường Đại học Tôn Đức Thắng - 19 Đ. Nguyễn Hữu Thọ, Tân Hưng, 
Quận 7, Thành phố Hồ Chí Minh'), 
(N'ĐIỂM THI SỐ 4', N'Trường Đại học Kinh Tế TP. Hồ Chí Minh - 279 Đ. Nguyễn Tri Phương, 
Phường 5, Quận 10, Thành phố Hồ Chí Minh'), 
(N'ĐIỂM THI SỐ 5', N'Trường Đại học Mở - 97 Võ Văn Tần, Phường 6, Quận 3, Thành phố Hồ 
Chí Minh'); 
SELECT * 
FROM DIEMTHI 
--Nhập dữ liệu Phòng thi 
INSERT INTO PHONGTHI (MAPhongThi, DIEMTHISO, GHICHU) 
VALUES  
(N'IUH-X10.01', N'ĐIỂM THI SỐ 1', N'Phòng thi 1 nằm ở dãy nhà X lầu 10 - điểm thi số 1 - 
trường Đại học Công Nghiệp TP. Hồ Chí Minh'), 
(N'HUTECH-H11.04', N'ĐIỂM THI SỐ 2', N'Phòng thi 4 nằm ở dãy nhà H lầu 11 - điểm thi số 2 - trường Đại học Công Nghệ TP. Hồ Chí Minh'), 
(N'TDTU-V12.02', N'ĐIỂM THI SỐ 3', N'Phòng thi 2 nằm ở dãy nhà V lầu 12 - điểm thi số 3 - 
trường Đại học Tôn Đức Thắng'), 
(N'UEH-A2.04', N'ĐIỂM THI SỐ 4', N'Phòng thi 4 nằm ở dãy nhà A lầu 2 - điểm thi số 4 - 
trường Đại học Kinh Tế TP. Hồ Chí Minh'), 
(N'OU-A3.04', N'ĐIỂM THI SỐ 5', N'Phòng thi 4 nằm ở dãy nhà A lầu 3 - điểm thi số 5 - trường 
Đại học Mở TP. Hồ Chí Minh'); 
SELECT * 
FROM PHONGTHI 
--Nhập dữ liệu Ngành 
INSERT INTO NGANH (MaNganh, TenNganh) 
VALUES  
(01, N'Thương Mại Điện Tử'), 
(02, N'Quản trị Marketing'), 
(03, N'Quản trị kinh doanh'), 
(04, N'Du lịch lữ hành'), 
(05, N'Ngôn ngữ Anh'); 
SELECT * 
FROM NGANH 
--Nhập dữ liệu Đơn vị 
INSERT INTO DONVI (MaDonVi, TenDonVi) 
VALUES 
(N'IUH-TMDL', N'Khoa Thương Mại Du Lịch IUH'), 
(N'HUTECH-NNA', N'Khoa Ngôn Ngữ Anh HUTECH'), 
(N'UEH-TMDL', N'Khoa Thương Mại Du Lịch UEH'), 
(N'TDTU-QTKD', N'Khoa Quản Trị Kinh Doanh TDTU'), 
(N'OU-KT', N'Khoa Kinh Tế OU'); 
SELECT * 
FROM DONVI 
--Nhập dữ liệu Cán bộ 
INSERT INTO CANBO (MaCanBo, HoTenCB, ChucVu, MaDonVi, DIEMTHISO) 
VALUES 
    (N'IUH-1011',  N'Lê Văn Hiếu',  N'Giáo Viên Gác Thi', N'IUH-TMDL',   N'ĐIỂM THI SỐ 1'), 
    (N'TDTU-3036', N'Trần Tuấn Vũ', N'Giáo Viên Gác Thi', N'TDTU-QTKD', N'ĐIỂM THI SỐ 3'), 
    (N'OU-5012',   N'Nguyễn Ngọc Ánh',N'Giáo Viên Gác Thi', N'OU-KT',     N'ĐIỂM THI SỐ 5'), 
    (N'HUTECH-2047',N'Trần Văn Tâm', N'Giáo Viên Gác Thi', N'HUTECH-NNA',N'ĐIỂM THI SỐ 2'), 
    (N'UEH-4011',  N'Trần Văn Tâm', N'Giáo Viên Gác Thi', N'UEH-TMDL', N'ĐIỂM THI SỐ 4');
SELECT * 
FROM CANBO 
--Môn thi 
INSERT INTO MONTHI (MaMT, TenMT, NgayThi, MAPHONGTHI, BuoiThi, Phut, 
MACANBO) 
VALUES 
(N'TOAN101', N'Toán', '2025-07-11', N'IUH-X10.01', N'Chiều', 90, N'IUH-1011'), 
(N'HOA204', N'Hóa', '2025-07-12', N'HUTECH-H11.04', N'Sáng', 60, N'HUTECH-2047'), 
(N'VAN501', N'Văn', '2025-07-11', N'OU-A3.04', N'Sáng', 90, N'OU-5012'), 
(N'LY401', N'Lý', '2025-07-12', N'UEH-A2.04', N'Chiều', 60, N'UEH-4011'), 
(N'ANHVAN303', N'Anh Văn', '2025-07-13', N'TDTU-V12.02', N'Sáng', 60, N'TDTU-3036'); 
SELECT * 
FROM MONTHI 
--Thí sinh 
INSERT INTO THISINH (HoTen, SBD, NgaySinh, Phai, Tinh, KhuVuc, DoiTuong, 
MANGANH, MAPHONGTHI, DIEMTHISO) 
VALUES  
(N'Võ Duy Khang', 22735651, '2004-07-19', N'Phái Nam', N'Chợ Định Hoà- Đồng Tháp', N'2', 
N'2B', 02, N'IUH-X10.01', N'ĐIỂM THI SỐ 1'), 
(N'Nguyễn Tuấn Phong', 2665701, '2004-12-12', N'Phái Nam', N'Tân Phú-TP.Hồ Chí Minh', N'1', 
N'1B', 01, N'HUTECH-H11.04', N'ĐIỂM THI SỐ 2'), 
(N'Ngô Hào Nam', 22674931, '2004-09-15', N'Phái Nam', N'Mỏ Cày Nam- Bến Tre', N'3', N'1B', 
03, N'UEH-A2.04', N'ĐIỂM THI SỐ 4'), 
(N'Lê Thị Yến Nhi', 22657371, '2004-02-11', N'Phái Nữ', N'Phước Hưng- Tiền Giang', N'5', 
N'5B', 05, N'TDTU-V12.02', N'ĐIỂM THI SỐ 3'), 
(N'Võ Ánh Hồng', 21735451, '2003-09-21', N'Phái Nữ', N'Chợ Mới- An Giang', N'1', N'1G', 04, 
N'OU-A3.04', N'ĐIỂM THI SỐ 5'); 
SELECT * 
FROM THISINH 
ORDER BY HOTEN ASC 
--Câu 4: Tự cho câu hỏi và trả lời : 12 câu (2 truy vấn kết nối nhiều bảng, 2 update, 2 delete, 2 group by, 2 sub query, 2 câu bất kì)  
--1. Các truy vấn kết nối nhiều bảng 
--Câu hỏi 1:. Liệt kê tất cả các thí sinh và địa chỉ điểm thi tương ứng. 
SELECT TS.HoTen, TS.SBD, TS.NgaySinh, DT.DiaChiDiemThi 
FROM THISINH TS 
JOIN DIEMTHI DT ON TS.DIEMTHISO = DT.DIEMTHISO; 
--Kết quả: 5 rows
--Câu hỏi 2: Lấy thông tin về môn thi, ngày thi và cán bộ coi thi cho mỗi thí sinh. 
SELECT TS.HoTen, TS.SBD, MT.TenMT, MT.NgayThi, CB.HoTenCB 
FROM THISINH TS 
join PHONGTHI PT ON PT.MAPhongThi=TS.MAPHONGTHI 
JOIN MONTHI MT ON MT.MAPHONGTHI = PT.MAPhongThi 
JOIN CANBO CB ON MT.MACANBO = CB.MACANBO; 
---Kết quả:5 rows
--2. Cập nhật (UPDATE) truy vấn 
--Câu hỏi 1: Cập nhật địa chỉ của một điểm thi cụ thể. 
UPDATE DIEMTHI 
SET DiaChiDiemThi = N'Trường Đại học Sư phạm TP. Hồ Chí Minh - 280 An Dương Vương, 
Phường 4, Quận 5, Thành phố Hồ Chí Minh' 
WHERE DIEMTHISO = N'ĐIỂM THI SỐ 1'; 
---Kết quả: 0 rows
--Câu hỏi 2: Thay đổi tên cho một thí sinh cụ thể. 
UPDATE THISINH 
SET  [HoTen] = N'LAVIS ' 
WHERE SBD = 22735651; 
---Kết quả: 0 rows
--3. Xóa (DELETE) truy vấn 
--Câu hỏi 1: Xóa hồ sơ của một thí sinh. 
DELETE FROM THISINH 
WHERE SBD = 21735451; 
---Kết quả: 0 rows 
--Câu hỏi 2: Xóa thí sinh đang ở trong phòng thi
DELETE FROM THISINH
WHERE MAPHONGTHI = N'HUTECH-H11.04';
--Kết quả: 0 rows
--4. Truy vấn sử dụng GROUP BY 
--Câu hỏi 1: Đếm số lượng thí sinh theo từng điểm thi. 
SELECT PH.DIEMTHISO, COUNT(TS.SBD) AS SoLuongThiSinh 
FROM THISINH TS 
JOIN PHONGTHI PH ON TS.DIEMTHISO = PH.DIEMTHISO 
GROUP BY PH.DIEMTHISO; 
--Kết quả: 4 rows
--Câu hỏi 2: Tìm số lượng thí sinh theo từng môn thi. 
SELECT MT.TenMT, COUNT(TS.SBD) AS SoLuongThiSinh 
FROM THISINH TS 
join PHONGTHI PT ON PT.MAPhongThi=TS.MAPHONGTHI 
JOIN MONTHI MT ON MT.MAPHONGTHI = PT.MAPhongThi 
GROUP BY MT.TenMT; 
--Kết quả: 3 rows
--5. Truy vấn con (Subqueries) 
--Câu hỏi 1: Tìm tên thí sinh thi dưới sự giám sát của 'LÊ VĂN HIẾU'. 
SELECT TS.HoTen 
FROM THISINH TS 
join PHONGTHI PT ON PT.MAPhongThi=TS.MAPHONGTHI 
JOIN MONTHI MT ON MT.MAPHONGTHI = PT.MAPhongThi 
WHERE TS.MAPHONGTHI = (SELECT MT.MAPHONGTHI  
FROM MONTHI MT 
JOIN CANBO CB ON MT.MACANBO = CB.MACANBO 
WHERE CB.HoTenCB = N'LÊ VĂN HIẾU'); 
---Kết quả: 1 rows
--Câu hỏi 2: Tìm tên và môn thi của các thí sinh thi vào ngày 13/07/2025. 
SELECT TS.HoTen, MT.TenMT 
FROM THISINH TS 
join PHONGTHI PT ON PT.MAPhongThi=TS.MAPHONGTHI 
JOIN MONTHI MT ON MT.MAPHONGTHI = PT.MAPhongThi 
WHERE MT.NgayThi = '2025-07-13';
---Kết quả: 1 rows
--6. Hai câu bất kỳ
--Câu hỏi 1: Liệt kê họ tên thí sinh, số báo danh, tên phòng thi và địa chỉ điểm thi. 
--Kết quả sắp theo tên phòng thi (theo thứ tự bảng chữ cái tăng dần), trong mỗi phòng thì sắp theo SBD tăng dần. 
--Chỉ hiển thị 20 kết quả đầu.
SELECT TOP 20
    ts.HoTen AS TenThiSinh,
    ts.SBD,
    pt.GHICHU AS TenPhongThi,
    dt.DiaChiDiemThi AS DiaChiDiemThi
FROM THISINH ts
  INNER JOIN PHONGTHI pt  
    ON ts.MAPHONGTHI = pt.MAPHONGTHI
  INNER JOIN DIEMTHI dt  
    ON ts.DIEMTHISO   = dt.DIEMTHISO
ORDER BY
    pt.GHICHU ASC,
    ts.SBD ASC;
--Kết quả: 3 rows

--Câu hỏi 2: Liệt kê số thí sinh theo từng phòng thi, gồm mã phòng, ghi chú phòng thi và số lượng thí sinh, sắp xếp giảm dần theo số thí sinh.
SELECT 
  p.MAPhongThi    AS PhongThi,
  p.GHICHU        AS GhiChu,
  COUNT(t.SBD)    AS SoThiSinh
FROM PHONGTHI p
LEFT JOIN THISINH t 
  ON t.MAPHONGTHI = p.MAPhongThi
GROUP BY 
  p.MAPhongThi, p.GHICHU
ORDER BY 
  SoThiSinh DESC;
--Két quả: 5 rows

--CÂU HỎI CÁ NHÂN UPDATEUBNHNJB
--1. Huỳnh Phương Anh
--* Cho biết số lượng cán bộ theo từng đơn vị (Group by)
SELECT dv.TenDonvi AS DonVi,
       COUNT(cb.MaCanBo)  AS SoCanbo
FROM Canbo cb
JOIN Donvi dv ON cb.MaDonvi = dv.MaDonvi
GROUP BY dv.TenDonvi
--Kết quả: 5 rows
 
--* Những cán bộ nào được phân công ở địa điểm thi có nhiều phòng thi nhất.(Subquery)
SELECT c.HoTenCB, c.DiemThiSo
FROM Canbo c
WHERE c.DiemThiSo IN (
    SELECT pt.DiemThiSo
    FROM Phongthi pt
    GROUP BY pt.DiemThiSo
    HAVING COUNT(*) = (
        SELECT MAX(roomCount)
        FROM (
            SELECT COUNT(*) AS roomCount
            FROM Phongthi
            GROUP BY DiemThiSo
        ) AS sub
    )
);
--Kết quả: 5 rows
 
--* Liệt kê toàn bộ phòng thi cùng địa chỉ điểm thi của nó. (câu hỏi bất kỳ)
SELECT p.MAPhongThi, d.DiaChiDiemThi
FROM Phongthi p
JOIN Diemthi d ON p.DiemThiSo = d.DiemThiSo;
--Kết quả: 5 rows
 
--2. Nguyễn Kiều Trinh
--* Thống kê số lượng thí sinh theo từng ngành, chỉ hiển thị những ngành có từ 2 thí sinh trở lên và có thí sinh đến từ tỉnh "TP.HCM"( group by)
SELECT N.TenNganh, COUNT(*) AS SoLuongThiSinh
FROM Thisinh TS
JOIN Nganh N ON TS.MaNganh = N.MaNganh
WHERE TS.Tinh = N'TP.HCM'
GROUP BY N.TenNganh
HAVING COUNT(*) >= 2
--Kết quả: 0 rows
 
--* Cập nhật chức vụ của cán bộ có họ tên là "Nguyễn Văn A" thành "Trưởng điểm". (update)
UPDATE Canbo
SET ChucVu = N'Trưởng điểm'
WHERE HoTenCB = N'Nguyễn Văn A'
SELECT * 
FROM Canbo
WHERE HoTenCB = N'Nguyễn Văn A'
--* Liệt kê tên các môn thi được tổ chức tại phòng thi có nhiều hơn 1 môn thi (câu hỏi bất kỳ)
SELECT 
    PT.MAPHONGTHI,
    PT.GHICHU,
    COUNT(T.SBD) AS SoThiSinh
FROM PHONGTHI PT
LEFT JOIN THISINH T 
    ON PT.MAPHONGTHI = T.MAPHONGTHI
GROUP BY 
    PT.MAPHONGTHI,
    PT.GHICHU
ORDER BY 
    SoThiSinh DESC;
--Kết quả: 5 rows
 
----3. Huỳnh Lê Thuỳ Linh
-- tính tổng thời gian thi của các thí sinh
SELECT 
    TS.SBD,
    TS.HoTen,
    SUM(MT.Phut) AS TongThoiGianThi
FROM 
    THISINH TS
JOIN 
    MONTHI MT ON TS.MAPHONGTHI = MT.MAPHONGTHI
GROUP BY 
    TS.SBD, TS.HoTen;
--Kết quả: 3 rows
-- Liệt kê mỗi cán bộ coi thi, số môn thi mà họ đã coi, tổng thời gian các buổi thi mà họ phụ trách, sắp xếp theo tổng thời gian giảm dần.
SELECT 
    CB.HoTenCB AS TenCanBo,
    COUNT(MT.MaMT) AS SoMonCoiThi,
    SUM(MT.Phut) AS TongThoiGianPhut
FROM 
    CANBO CB
JOIN 
    MONTHI MT ON CB.MaCanBo = MT.MaCanBo
GROUP BY 
    CB.HoTenCB
ORDER BY 
    TongThoiGianPhut DESC;
--Kết quả: 4 rows

--* Danh sách cán bộ coi thi kèm tên đơn vị và địa chỉ điểm thi
SELECT cb.MaCanBo, cb.HoTenCB, dv.TenDonVi, dt.DiaChiDiemThi
FROM Canbo cb
JOIN Donvi dv ON cb.MaDonVi = dv.MaDonVi
JOIN Diemthi dt ON cb.DiemThiSo = dt.DiemThiSo
ORDER BY cb.MaCanBo
--Kết quả: 5 rows
 
--* Tìm tên các ngành hiện tại không có thí sinh nào đăng ký.
SELECT n.MaNganh, n.TenNganh
FROM Nganh AS n
WHERE n.MaNganh NOT IN (
    SELECT DISTINCT ts.MaNganh
    FROM Thisinh AS ts
);
--Kết quả: 2 rows
 
--4. Đặng Thị Thanh Trúc
--* Cập nhật DiaChiDiemThi của bảng DiemThi thành ‘Chưa sử dụng điểm thi’ nếu như DiemThiSo của nó chưa được sử dụng trong bảng Phongthi.
UPDATE DiemThi
SET DiaChiDiemThi = 'Chưa sử dụng điểm thi'
WHERE DiemThiSo NOT IN (
    SELECT DISTINCT DiemThiSo FROM Phongthi
)
 
--* Cập nhật ChucVu của bảng CanBo nếu ChucVu chưa có dữ liệu và MaDonVi có TenDonVi chứa từ ‘Tổ chức’.
UPDATE CanBo
SET ChucVu = 'Chấm thi'
WHERE ChucVu IS NULL
  AND MaDonVi IN (
    SELECT MaDonVi
    FROM DonVi                  
    WHERE TenDonVi LIKE '%Tổ chức%'
)
 
--* Đếm số lượng các thí sinh có chung ngành tại cùng một điểm thi.
SELECT n.TenNganh, dt.DiemThiSo, COUNT(*) AS SoThiSinh
FROM ThiSinh ts
JOIN Nganh n ON ts.MaNganh = n.MaNganh
JOIN Phongthi p ON ts.Maphongthi = p.Maphongthi
JOIN DiemThi dt ON p.DiemThiSo = dt.DiemThiSo
GROUP BY n.TenNganh, dt.DiemThiSo
--Kết quả: 3 rows
 
--* Liệt kê các ngành mà tất cả thí sinh đều sinh sau năm 2000.
SELECT DISTINCT n.MaNganh, n.TenNganh
FROM Nganh n
WHERE NOT EXISTS (
    SELECT 1
    FROM ThiSinh t
    WHERE t.MaNganh = n.MaNganh AND t.NgaySinh < '2000-01-01'
)
--Kết quả: 5 rows
 
--* Xóa dữ liệu các thí sinh trong bảng ThiSinh có Maphongthi với DiemThiSo không tồn tại trong danh sách DiemThiSo của bảng DiemThi.
DELETE FROM ThiSinh
WHERE Maphongthi IN (
    SELECT Maphongthi 
    FROM Phongthi
    WHERE DiemThiSo NOT IN (            
        SELECT DiemThiSo FROM DiemThi
    )
)

--5. Võ Phú Thịnh
--* Liệt kê SBD, Họ tên, Tên ngành, Ghi chú phòng thi và Địa chỉ điểm thi của tất cả thí sinh
	SELECT
		ts.SBD,
		ts.HoTen,
		ng.TenNganh,
		pt.GhiChu AS GhiChuPhongThi,
		dt.DiaChiDiemThi
	FROM THISINH ts
	JOIN NGANH ng ON ts.MANGANH = ng.MaNganh
	JOIN PHONGTHI pt ON ts.MAPHONGTHI = pt.MAPHONGTHI
	JOIN DIEMTHI dt ON pt.DIEMTHISO = dt.DIEMTHISO
	ORDER BY
		dt.DiaChiDiemThi ASC,
		pt.GhiChu ASC,
		ts.HoTen ASC;
	--Kết quả: 3 rows
--* Liệt kê mã ngành, tên ngành và số lượng thí sinh của mỗi ngành
Select ng.MaNganh, ng.TenNganh, count(ts.SBD) as SoLuongThiSinh
From Nganh ng
JOIN Thisinh ts on ng.MaNganh = ts.MaNganh
Group by ng.MaNganh, ng.TenNganh
Order by SoLuongThiSinh desc;
--kết quả: 3 rows
--* Cập nhật trường GhiChu thành Phòng thi nhiều ca cho tất cả các phòng thi xuất hiện từ 2 ca thi trở lên trong lịch thi.
UPDATE PHONGTHI
SET
    GhiChu = N'Phòng thi nhiều ca'
WHERE
    MAPHONGTHI IN (
        SELECT
            MAPHONGTHI
        FROM MONTHI
        GROUP BY MAPHONGTHI
        HAVING COUNT(*) >= 2
    );

--* Với mỗi ngành và mỗi môn thi, hãy đếm số thí sinh tham dự, rồi sắp xếp theo số thí sinh giảm dần và tên ngành tăng dần. 
SELECT
    ng.MaNganh,
    ng.TenNganh,
    mt.MaMT,
    mt.TenMT,
    COUNT(ts.SBD) AS SoLuongThiSinh
FROM
    Thisinh  AS ts
    JOIN Nganh   ng ON ts.MaNganh = ng.MaNganh
    JOIN Monthi  mt ON ts.MAPHONGTHI =  mt.MAPHONGTHI
GROUP BY
    ng.MaNganh,
    ng.TenNganh,
    mt.MaMT,
    mt.TenMT
HAVING
    COUNT(ts.SBD) > 0
ORDER BY
    SoLuongThiSinh DESC,
    ng.TenNganh ASC;
--Kết quả: 3 rows
--* Liệt kê Số báo danh và Họ tên của tất cả thí sinh thuộc ngành có số lượng thí sinh lớn nhất. 
SELECT
    ts.SBD,
    ts.HoTen
FROM Thisinh ts
WHERE
    ts.MaNganh = (
        SELECT TOP 1
            MaNganh
        FROM Thisinh
        GROUP BY MaNganh
        ORDER BY COUNT(*) DESC
    )
ORDER BY ts.HoTen;
--Kết quả: 1 rows

-- diemthi phụ thuộc thisinh
ALTER TABLE diemthi
ADD CONSTRAINT fk_diemthi_thisinh
FOREIGN KEY (ma_thisinh) REFERENCES thisinh(id)
ON DELETE CASCADE;

-- monthi phụ thuộc thisinh (nếu có liên hệ)
ALTER TABLE monthi
ADD CONSTRAINT fk_monthi_thisinh
FOREIGN KEY (ma_thisinh) REFERENCES thisinh(id)
ON DELETE CASCADE;

-- phongthi phụ thuộc thisinh (nếu có liên hệ)
ALTER TABLE phongthi
ADD CONSTRAINT fk_phongthi_thisinh
FOREIGN KEY (ma_thisinh) REFERENCES thisinh(id)
ON DELETE CASCADE;

DELETE FROM thisinh WHERE hoten = 'Võ Duy Khang';

select *
from thisinh
where hoten = 'Võ Duy Khang';
