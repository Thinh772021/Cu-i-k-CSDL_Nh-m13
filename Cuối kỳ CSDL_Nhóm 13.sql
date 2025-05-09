--Câu 3: Cài đặt CSDL - Tạo database trên SSMS, nhập dữ liệu (tự nghĩ ra mỗi bảng ít nhất 5 dòng): toàn bộ dùng lệnh SQL và nộp file database (file backup)

CREATE DATABASE QLThiTuyenSinh;
GO

USE QLThiTuyenSinh;
GO


-- Bảng Diemthi
CREATE TABLE Diemthi (
    DiemThiSo INT PRIMARY KEY,
    DiaChiDiemThi NVARCHAR(255)
);

-- Bảng Phongthi
CREATE TABLE Phongthi (
    SoPhong INT PRIMARY KEY,
    DiemThiSo INT FOREIGN KEY REFERENCES Diemthi(DiemThiSo),
    GhiChu NVARCHAR(255)
);

-- Bảng Nganh
CREATE TABLE Nganh (
    MaNganh NVARCHAR(10) PRIMARY KEY,
    TenNganh NVARCHAR(100)
);

-- Bảng Thisinh
CREATE TABLE Thisinh (
    SoBD NVARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    Phai NVARCHAR(10),
    Tinh NVARCHAR(100),
    DoiTuong NVARCHAR(10),
    KhuVuc NVARCHAR(10),
    MaNganh NVARCHAR(10) FOREIGN KEY REFERENCES Nganh(MaNganh),
    SoPhong INT FOREIGN KEY REFERENCES Phongthi(SoPhong)
);

-- Bảng Monthi
CREATE TABLE Monthi (
    MaMT NVARCHAR(10) PRIMARY KEY,
    TenMT NVARCHAR(100)
);

-- Bảng Donvi
CREATE TABLE Donvi (
    MaDonVi NVARCHAR(10) PRIMARY KEY,
    TenDonVi NVARCHAR(255)
);

-- Bảng Canbo
CREATE TABLE Canbo (
    MaCanBo NVARCHAR(10) PRIMARY KEY,
    HoTenCB NVARCHAR(100),
    MaDonVi NVARCHAR(10) FOREIGN KEY REFERENCES Donvi(MaDonVi),
    ChucVu NVARCHAR(50),
    DiemThiSo INT FOREIGN KEY REFERENCES Diemthi(DiemThiSo)
);

-- Bảng Tohopmon (bảng trung gian giữa Nganh và Monthi)
CREATE TABLE Tohopmon (
    MaNganh NVARCHAR(10) FOREIGN KEY REFERENCES Nganh(MaNganh),
    MaMT NVARCHAR(10) FOREIGN KEY REFERENCES Monthi(MaMT),
    PRIMARY KEY (MaNganh, MaMT)
);

-- Bảng Lichthi (trung gian giữa Phongthi và Monthi)
CREATE TABLE Lichthi (
    SoPhong INT FOREIGN KEY REFERENCES Phongthi(SoPhong),
    MaMT NVARCHAR(10) FOREIGN KEY REFERENCES Monthi(MaMT),
    NgayThi DATE,
    BuoiThi NVARCHAR(20),
    Phut INT,
    PRIMARY KEY (SoPhong, MaMT)
);

-- Dữ liệu Diemthi
INSERT INTO Diemthi VALUES 
(1, N'Trường PTTH Nguyễn Thị Minh Khai'),
(2, N'Trường PTTH Bùi Thị Xuân'),
(3, N'Trường PTTH Lê Quý Đôn'),
(4, N'Trường PTTH Trưng Vương'),
(5, N'Trường PTTH Nguyễn Du');

-- Dữ liệu Phongthi
INSERT INTO Phongthi VALUES 
(101, 1, N'Dãy A, lầu 1'),
(102, 1, N'Dãy A, lầu 2'),
(201, 2, N'Dãy B, lầu 1'),
(202, 2, N'Dãy B, lầu 2'),
(301, 3, N'Dãy C, lầu 1');

-- Dữ liệu Nganh
INSERT INTO Nganh VALUES 
('01', N'Công nghệ thông tin'),
('02', N'Cơ điện tử'),
('03', N'Kế toán'),
('04', N'Marketing'),
('05', N'Công nghệ thực phẩm');

-- Dữ liệu Thisinh
INSERT INTO Thisinh VALUES 
('TS001', N'Lê Văn An', '2004-05-10', N'Nam', N'Tiền Giang', '1A', 'KV1', '01', 101),
('TS002', N'Nguyễn Thị Bích', '2004-03-21', N'Nữ', N'Bình Định', '2B', 'KV2', '02', 102),
('TS003', N'Phạm Văn Cường', '2003-11-30', N'Nam', N'TP.HCM', '3C', 'KV3', '03', 201),
('TS004', N'Trần Thị Hạnh', '2004-01-01', N'Nữ', N'Cần Thơ', '1A', 'KV1', '01', 301),
('TS005', N'Lý Minh Khoa', '2004-07-15', N'Nam', N'Bến Tre', '2B', 'KV2', '05', 202);

-- Dữ liệu Monthi
INSERT INTO Monthi VALUES 
('M01', N'Toán'),
('M02', N'Lý'),
('M03', N'Hóa'),
('M04', N'Văn'),
('M05', N'Anh');


-- Dữ liệu Donvi
INSERT INTO Donvi VALUES 
('DV01', N'Khoa CNTT'),
('DV02', N'Trường THPT Ngôi Sao'),
('DV03', N'Phòng Đào Tạo'),
('DV04', N'Phòng Tổ chức'),
('DV05', N'Khoa Kế Toán');

-- Dữ liệu Canbo
INSERT INTO Canbo VALUES 
('CB01', N'Nguyễn Văn A', 'DV01', N'Giám sát', 1),
('CB02', N'Trần Thị B', 'DV02', N'Cán bộ coi thi', 2),
('CB03', N'Lê Văn C', 'DV03', N'Thư ký', 3),
('CB04', N'Phạm Thị D', 'DV04', N'Phục vụ', 1),
('CB05', N'Hoàng Văn E', 'DV05', N'Điểm trưởng', 2);

-- Dữ liệu Tohopmon
INSERT INTO Tohopmon VALUES 
('01', 'M01'), -- CNTT thi Toán
('01', 'M02'), -- CNTT thi Lý
('01', 'M03'), -- CNTT thi Hóa

('02', 'M01'), -- Cơ điện tử thi Toán
('02', 'M02'),

('03', 'M01'), -- Kế toán thi Toán
('03', 'M04'), -- Kế toán thi Văn
('03', 'M05'), -- Kế toán thi Anh

('04', 'M04'), -- Marketing thi Văn
('04', 'M05'),

('05', 'M01'), -- CNTP thi Toán
('05', 'M03'),
('05', 'M05');

INSERT INTO Lichthi VALUES
(101, 'M01', '2025-07-01', N'Sáng', 120),
(101, 'M02', '2025-07-02', N'Chiều', 90),
(102, 'M03', '2025-07-03', N'Sáng', 90),
(201, 'M04', '2025-07-04', N'Chiều', 180),
(202, 'M05', '2025-07-05', N'Sáng', 120),
(301, 'M01', '2025-07-01', N'Sáng', 120); -- M01 cũng thi ở 301

--4. Tự cho câu hỏi và trả lời : 12 câu (2 truy vấn kết nối nhiều bảng, 2 update, 2 delete, 2 group by, 2 sub query, 2 câu bất kì) 
--I.	Truy vấn kết nối nhiều bảng (JOIN) :
--1.	Liệt kê danh sách thí sinh gồm Số báo danh, Họ tên, Tên ngành đăng ký,
--Tên môn thi, Ngày thi, Buổi thi, và Phòng thi của từng thí sinh. (Đặng Thị Thanh Trúc)
SELECT TS.SoBD, TS.HoTen, N.TenNganh, MT.TenMT, LT.NgayThi, LT.BuoiThi, PT.SoPhong 
FROM Thisinh TS 
JOIN Nganh N ON TS.MaNganh = N.MaNganh 
JOIN Tohopmon THM ON N.MaNganh = THM.MaNganh 
JOIN Monthi MT ON THM.MaMT = MT.MaMT 
JOIN Lichthi LT ON TS.SoPhong = LT.SoPhong AND MT.MaMT = LT.MaMT JOIN Phongthi PT ON TS.SoPhong = PT.SoPhong 
ORDER BY TS.SoBD;
--Kết quả: 4 rows
 
  --2. Liệt kê họ tên cán bộ, tên đơn vị, địa chỉ điểm thi mà cán bộ đó làm việc, chỉ lấy những cán bộ có chức vụ là Giám sát và điểm thi đặt tại các trường ở Quận 1. (Huỳnh Lê Thuỳ Linh)
SELECT cb.HoTenCB, dv.TenDonVi, dt.Diachidiemthi
FROM CanBo cb
JOIN DonVi dv ON cb.MaDonVi = dv.MaDonVi
JOIN DiemThi dt ON cb.DiemThiSo = dt.DiemThiSo
WHERE cb.ChucVu = 'Giám sát'
   AND dt.DiaChiDiemThi LIKE '%Quận 1%'
--Kết quả: 0 rows
 --II.	Câu lệnh cập nhật (UPDATE): 
--1. Cập nhật GhiChu của các phòng thi có thí sinh thi môn Toán (M01) vào buổi sáng ngày 01/07/2025, thêm dòng "Thi Toán buổi sáng". (Võ Phú Thịnh)
UPDATE PT 
SET PT.GhiChu = CONCAT(ISNULL(PT.GhiChu, N''), N' Thi Toán buổi sáng') 
FROM Phongthi PT 
JOIN Lichthi LT ON PT.SoPhong = LT.SoPhong 
WHERE LT.MaMT = 'M01' 
AND LT.BuoiThi = N'Sáng' 
AND LT.NgayThi = '2025-07-01'
 
 --2. Cập nhật chức vụ thành phụ trách hậu cần cho tất cả cán bộ có tên đơn vị chứa "Phục vụ" và hiện tại đang có chức vụ là "Phục vụ". (Huỳnh Phương Anh)
UPDATE Canbo
SET ChucVu = 'Phụ trách hậu cần'
WHERE ChucVu = 'Phục vụ'
   AND MaDonVi IN (
    SELECT MaDonVi
    FROM Donvi
    WHERE TenDonVi LIKE '%Phục vụ%' )

--III. Câu lệnh xóa (DELETE)
--1. Xóa tất cả cán bộ coi thi có chức vụ là Thư ký, làm việc tại điểm thi đặt ở trường PTTH Bùi Thị Xuân. Trường PTTH Bùi Thị Xuân ( Nguyễn Kiều Trinh)
DELETE FROM Canbo
WHERE ChucVu = 'Thư ký'
AND DiemThiSo IN (
    SELECT DiemThiSo
    FROM Diemthi
    WHERE Diachidiemthi LIKE '%PTTH Bùi Thị Xuân%') 
--2.  Xóa tất cả thí sinh đã đăng ký ngành "Công nghệ thực phẩm", thi tại phòng không có lịch thi môn Hóa (M03) từ ngày 01/07/2025 đến 05/07/2025. (Huỳnh Lê Thùy Linh)
DELETE FROM Thisinh
WHERE MaNganh = '05'
AND NOT EXISTS (
    SELECT 1
    FROM Lichthi LT
    WHERE LT.SoPhong = Thisinh.SoPhong
      AND LT.MaMT = 'M03'
      AND LT.NgayThi BETWEEN '2025-07-01' AND '2025-07-05'
);
--IV.	Truy vấn nhóm (GROUP BY)
--1. Thống kê theo mỗi khu vực và ngành số thí sinh, điểm trung bình, tổng thời gian thi và số ca thi trong toàn bộ dữ liệu. (Võ Phú Thịnh)
SELECT t.KhuVuc,  t.MaNganh,  
  COUNT(DISTINCT t.SoBD)          AS SoThiSinh,  
  ROUND(AVG (p.DiemThiSo * 1.0), 2) AS DiemTrungBinh,  
  SUM (l.Phut)                     AS TongPhutThi,  
  COUNT (l.BuoiThi)                AS SoCaThi  
FROM Thisinh  AS t  
JOIN Phongthi AS ph ON t.SoPhong = ph.SoPhong  
JOIN Lichthi  AS l  ON ph.SoPhong = l.SoPhong  
JOIN Diemthi  AS p  ON ph.DiemThiSo = p.DiemThiSo  
GROUP BY t.KhuVuc, t.MaNganh  
ORDER BY t.KhuVuc,  t.MaNganh;
--Kết quả: 3 rows
 

  --2. Tính cho tháng và buổi (Sáng/Chiều) trong năm 2025: tổng số thí sinh, tổng phút thi, điểm trung bình, phút thi nhỏ nhất và lớn nhất. (Huỳnh Phương Anh)
SELECT
  MONTH(l.NgayThi)               AS Thang,  
  l.BuoiThi,  
  COUNT(DISTINCT t.SoBD)         AS SoThiSinh,  
  SUM(l.Phut)                    AS TongPhut,  
  ROUND(AVG(l.Phut * 1.0), 2)    AS PhutTrungBinh,  
  MIN(l.Phut)                    AS PhutNhoNhat,  
  MAX(l.Phut)                    AS PhutLonNhat  
FROM Lichthi  AS l  
JOIN Phongthi AS ph ON l.SoPhong  = ph.SoPhong  
JOIN Thisinh  AS t  ON ph.SoPhong = t.SoPhong  
WHERE YEAR(l.NgayThi) = 2025  
GROUP BY  MONTH(l.NgayThi),  l.BuoiThi  
ORDER BY  Thang,   l.BuoiThi;
--Kết quả: 2 rows
 

--V.	Truy vấn con (SUBQUERY)
--1. Liệt kê họ tên thí sinh cùng với địa chỉ điểm thi của họ (Nguyễn Kiều Trinh)
Select t.HoTen,
(
  select d.Diachidiemthi
  from Diemthi d
 where d.DiemThiSo = (
    select p.DiemThiSo
    from Phongthi p
    where p.SoPhong = t.SoPhong
  )
) as Diachidiemthi
from Thisinh t
--Kết quả: 5 rows
 

  --2. Hãy tìm ngành MaNganh, TenNganh có số thí sinh đăng ký nhiều nhất. (Đặng Thị Thanh Trúc)
Select n.MaNganh, n.TenNganh,
count(*) as SoLuongTS
from Thisinh t
join Nganh n on t.MaNganh = n.MaNganh
group by n.MaNganh, n.TenNganh
having count(*) = (
  select max(SoLuong)
  from (
    select count(*) as SoLuong
    from Thisinh
    group by MaNganh
  ) as ds
)
--Kết quả: 1 rows 
 

--VI.	Hai câu bất kỳ
--1. Tìm thí sinh lớn tuổi nhất trong mỗi ngành. Hiển thị số báo danh, họ tên, ngày sinh và mã ngành. (Nguyễn Kiều Trinh)
Select ts.SoBD, ts.HoTen, ts.NgaySinh, ts.MaNganh
From Thisinh ts
Where ts.NgaySinh = (
        Select min(ts2.NgaySinh)
        From Thisinh ts2
        Where ts2.MaNganh = ts.MaNganh)
--Kết quả: 4 rows
 

  --2. Tìm 5 môn có tổng thời gian thi (TongPhut) lớn nhất trên toàn bộ dữ liệu, kèm: SoThiSinh (số thí sinh dự thi), PhutTB (thời gian trung bình mỗi ca), PhutMin / PhutMax (nhỏ nhất / lớn nhất) (Võ Phú Thịnh)
SELECT TOP 5 m.MaMT, m.TenMT, COUNT(DISTINCT t.SoBD) AS SoThiSinh,
  SUM(l.Phut) AS TongPhut,
  ROUND (AVG (l.Phut * 1.0), 2) AS PhutTB,
  MIN(l.Phut)  AS PhutMin,
  MAX(l.Phut) AS PhutMax
FROM Monthi AS m
JOIN Lichthi AS l  ON m.MaMT = l.MaMT
JOIN Phongthi AS ph ON l.SoPhong  = ph.SoPhong
JOIN Thisinh AS t  ON ph.SoPhong  = t.SoPhong
GROUP BY m.MaMT, m.TenMT
ORDER BY TongPhut DESC;
--Kết quả: 5 rows 
 

--VII.	Câu hỏi cá nhân
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
--Kết quả: 4 rows
 
--* Liệt kê toàn bộ phòng thi cùng địa chỉ điểm thi của nó. (câu hỏi bất kỳ)
SELECT p.SoPhong, d.DiaChiDiemThi
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
SELECT DISTINCT TenMT
FROM Monthi
WHERE MaMT IN (
    SELECT MaMT
    FROM Lichthi
    WHERE SoPhong IN (
        SELECT SoPhong
        FROM Lichthi
        GROUP BY SoPhong
        HAVING COUNT(MaMT) > 1
    )
);
--Kết quả: 2 rows
 
--3. Huỳnh Lê Thuỳ Linh
--* Tính tổng thời gian thi của mỗi thí sinh
SELECT ts.SoBD, ts.HoTen, SUM(lt.Phut) AS TongPhutThi
FROM Thisinh ts
JOIN Lichthi lt  ON ts.SoPhong = lt.SoPhong
GROUP BY ts.SoBD, ts.HoTen
ORDER BY TongPhutThi DESC;
--Kết quả: 6 rows
 
--* Đếm số phòng thi theo từng điểm thi, chỉ lấy điểm thi có >= 2 phòng
SELECT dt.DiemThiSo, dt.DiaChiDiemThi, COUNT(pt.SoPhong) AS SoPhongThi
FROM Diemthi dt
JOIN Phongthi pt ON dt.DiemThiSo = pt.DiemThiSo
GROUP BY dt.DiemThiSo, dt.DiaChiDiemThi
HAVING COUNT(pt.SoPhong) >= 2
--Kết quả: 2 rows 
 
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
--Kết quả: 1 rows
 
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
JOIN Phongthi p ON ts.SoPhong = p.SoPhong
JOIN DiemThi dt ON p.DiemThiSo = dt.DiemThiSo
GROUP BY n.TenNganh, dt.DiemThiSo
--Kết quả: 5 rows
 
--* Liệt kê các ngành mà tất cả thí sinh đều sinh sau năm 2000.
SELECT DISTINCT n.MaNganh, n.TenNganh
FROM Nganh n
WHERE NOT EXISTS (
    SELECT 1
    FROM ThiSinh t
    WHERE t.MaNganh = n.MaNganh AND t.NgaySinh < '2000-01-01'
)
--Kết quả: 5 rows
 
--* Xóa dữ liệu các thí sinh trong bảng ThiSinh có SoPhong với DiemThiSo không tồn tại trong danh sách DiemThiSo của bảng DiemThi.
DELETE FROM ThiSinh
WHERE SoPhong IN (
    SELECT SoPhong 
    FROM Phongthi
    WHERE DiemThiSo NOT IN (            
        SELECT DiemThiSo FROM DiemThi
    )
)
--5. Võ Phú Thịnh
--* Hãy liệt kê số báo danh, họ tên, tên ngành, ghi chú phòng thi và địa chỉ điểm thi của tất cả thí sinh, rồi sắp xếp kết quả theo thứ tự tăng dần của địa chỉ điểm thi, ghi chú phòng thi và họ tên thí sinh. (Truy vấn kết nối nhiều bảng)
Select ts.SoBD, ts.HoTen, ng.TenNganh,
    	     pt.GhiChu as GhiChuPhongThi,
    	     dt.DiaChiDiemThi
From Thisinh ts
Join Nganh ng on ts.MaNganh = ng.MaNganh
Join Phongthi pt on ts.SoPhong = pt.SoPhong
Join Diemthi dt on pt.DiemThiSo = dt.DiemThiSo
Order by dt.DiaChiDiemThi, pt.GhiChu, ts.HoTen;
--Kết quả: 4 rows
 
--* Hãy liệt kê mã ngành, tên ngành và số lượng thí sinh của mỗi ngành có ít nhất một thí sinh đăng ký, rồi sắp xếp kết quả theo số lượng thí sinh giảm dần. (Truy vấn sử dụng group by)
Select ng.MaNganh, ng.TenNganh, count(ts.SoBD) as SoLuongThiSinh
From Nganh ng
JOIN Thisinh ts on ng.MaNganh = ts.MaNganh
Group by ng.MaNganh, ng.TenNganh
Having count(ts.SoBD) > 0
Order by SoLuongThiSinh desc;
--Kết quả: 3 rows
 
--* Cập nhật trường GhiChu thành Phòng thi nhiều ca cho tất cả các phòng thi xuất hiện từ 2 ca thi trở lên trong lịch thi.( Truy vấn sử dụng Subquery)
UPDATE Phongthi
SET GhiChu = N'Phòng thi nhiều ca'
WHERE SoPhong IN (
        SELECT SoPhong
        FROM Lichthi
        GROUP BY SoPhong
        HAVING 
            COUNT(*) >= 2
    );
--Kết quả: 0 rows
 
--* Với mỗi ngành và mỗi môn thi, hãy đếm số thí sinh tham dự, rồi sắp xếp theo số thí sinh giảm dần và tên ngành tăng dần. (Truy vấn GROUP BY)
SELECT ng.MaNganh, ng.TenNganh, mt.MaMT, mt.TenMT,
 	     COUNT(ts.SoBD) AS SoLuongThiSinh
FROM Thisinh  AS ts
JOIN Nganh AS ng ON ts.MaNganh = ng.MaNganh
JOIN Lichthi AS l  ON ts.SoPhong = l.SoPhong
JOIN Monthi AS mt ON l.MaMT = mt.MaMT
GROUP BY ng.MaNganh, ng.TenNganh, mt.MaMT, mt.TenMT
HAVING COUNT(ts.SoBD) > 0
ORDER BY SoLuongThiSinh DESC, ng.TenNganh
--Kết quả: 4 rows
 
--* Liệt kê Số báo danh và Họ tên của tất cả thí sinh thuộc ngành có số lượng thí sinh lớn nhất. (Truy vấn SUB QUERY)
SELECT ts.SoBD, ts.HoTen
FROM Thisinh AS ts
WHERE ts.MaNganh = (
        SELECT TOP 1
            MaNganh
        FROM Thisinh
        GROUP BY MaNganh
        ORDER BY COUNT(*) DESC )
ORDER BY ts.HoTen;
--Kết quả: 2 rows
