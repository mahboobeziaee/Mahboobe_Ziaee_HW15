
CREATE TABLE Stusents (  
    student_id INT IDENTITY(1,1) PRIMARY KEY,  
    first_name NVARCHAR(50),  
    last_name NVARCHAR(50),  
    grade INT,  
    school_name NVARCHAR(100),  
    gender BIT,  
    avreg FLOAT,  
    score FLOAT  
);
---insert 50 records
INSERT INTO Students (first_name, last_name, grade, school_name, gender, avreg, score) VALUES 
('Ali', 'Ahmadzadeh', 9, 'School A', 1, 16.5, 85.0),
('Reza', 'Mohammadi', 10, 'School B', 1, 17.0, 95.0),
('Sara', 'Karimi', 11, 'School C', 0, 18.5, 90.0),
('Zahra', 'Hosseini', 12, 'School D', 0, 19.0, 87.0),
('Mohsen', 'Gholami', 10, 'School E', 1, 15.0, 80.0),
('Mohammad', 'Farahani', 11, 'School F', 1, 17.5, 92.0),
('Niloofar', 'Asgarzadeh', 10, 'School G', 0, 18.0, 93.0),
('Kiana', 'Javadi', 12, 'School H', 0, 20.0, 98.0),
('Samira', 'Latifi', 9, 'School I', 0, 14.5, 75.0),
('Amir', 'Naseri', 12, 'School J', 1, 16.0, 82.0),
('Elaheh', 'Zarei', 11, 'School K', 0, 17.0, 88.0),
('Sohrab', 'Yazdani', 10, 'School L', 1, 18.5, 91.0),
('Parisa', 'Mohseni', 12, 'School M', 0, 19.0, 94.0),
('Hadi', 'Sadeghi', 11, 'School N', 1, 14.0, 80.0),
('Sepideh', 'Peykani', 9, 'School O', 0, 15.5, 77.0),
('Farhad', 'Tavakoli', 11, 'School P', 1, 19.5, 95.0),
('Yasamin', 'Hosseini', 10, 'School Q', 0, 17.0, 85.0),
('Salman', 'Bakhshi', 12, 'School R', 1, 16.0, 78.0),
('Ramin', 'Rad', 11, 'School S', 1, 20.0, 98.0),
('Asal', 'Rostami', 10, 'School T', 0, 18.0, 90.0),
('Navid', 'Khaki', 9, 'School U', 1, 16.5, 84.0),
('Samaneh', 'Fooladi', 12, 'School V', 0, 14.5, 76.0),
('Hooman', 'Behnam', 11, 'School W', 1, 17.5, 88.0),
('Zahra', 'Taheri', 10, 'School X', 0, 19.5, 97.0),
('Arash', 'Soleimani', 12, 'School Y', 1, 15.0, 81.0),
('Negar', 'Ebrahimi', 11, 'School Z', 0, 18.5, 89.0),
('Babak', 'Mehrabi', 10, 'School A', 1, 16.0, 83.0),
('Fatemeh', 'Rahnama', 9, 'School B', 0, 17.0, 79.0),
('Kamran', 'Mojtahedi', 11, 'School C', 1, 14.0, 72.0),
('Sami', 'Gholamzadeh', 10, 'School D', 1, 20.0, 99.0),
('Ladan', 'Poursaeedi', 12, 'School E', 0, 15.0, 75.0),
('Nima', 'Azizi', 11, 'School F', 1, 19.0, 95.0),
('Yasaman', 'Seyed', 10, 'School G', 0, 16.5, 84.0),
('Armin', 'Fathali', 12, 'School H', 1, 18.0, 90.0),
('Mahsa', 'Rostamzadeh', 9, 'School I', 0, 14.0, 70.0),
('Dariush', 'Nikzad', 10, 'School J', 1, 17.5, 87.0),
('Lila', 'Khalili', 11, 'School K', 0, 18.0, 92.0),
('Pasha', 'Gholipour', 10, 'School L', 1, 16.0, 79.0),
('Nazanin', 'Vahidi', 12, 'School M', 0, 19.5, 98.0);
---insert 50 records

DECLARE @i INT = 0;

WHILE @i < 50
BEGIN
    INSERT INTO Students (first_name, last_name, grade, school_name, gender, avreg, score)
    VALUES (
        CONCAT('First', @i),                 -- نام اول
        CONCAT('Last', @i),                  -- نام خانوادگی
        FLOOR(RAND() * 4) + 9,               -- پایه از 9 تا 12
        CONCAT('School ', (FLOOR(RAND() * 10) + 1)),  -- نام مدرسه
        CASE WHEN RAND() < 0.5 THEN 1 ELSE 0 END,  -- جنسیت (1 برای مرد، 0 برای زن)
        ROUND(RAND() * 20 + 80, 2),          -- میانگین نمرات (از 80 تا 100)
        ROUND(RAND() * 100, 2)                -- نمره (از 0 تا 100)
    );

    SET @i = @i + 1;
END;


--کوئری که تمام ستون ها را نمایش بده

SELECT * FROM Stusents

--نمایش ستون‌های نام، نام خانوادگی، پایه تحصیلی و معدل
SELECT first_name, last_name, grade, avreg
FROM Students;

--نمایش نام و نام خانوادگی دانش‌آموزانی که معدل کمتر از 12 دارند
SELECT first_name, last_name
FROM Students
WHERE avreg < 12;  

--به‌روزرسانی نمره تمام دانش‌آموزان به مقدار صفر

UPDATE Students
SET score = 0;

--نمایش نام مدارس دانش‌آموزانی که پایه آنها بین 10 و 12 و معدل بالاتر از 18 و پایین‌تر از 19 است
SELECT DISTINCT school_name
FROM Students
WHERE grade BETWEEN 10 AND 12
  AND avreg > 18
  AND avreg < 19;

  -- به‌روزرسانی امتیاز برای تمام دانش‌آموزان با شرایط بالا به مقدار1

  UPDATE Students
SET score = 1
WHERE grade BETWEEN 10 AND 12
  AND avreg > 18
  AND avreg < 19;

  --نمایش تمام دانش‌آموزان پایه 9 و از جنسیت پسر که نام آنها علی یا رضا است
  SELECT *
FROM Students
WHERE grade = 9
  AND gender = 1  -- فرض بر این است که 1 نشان‌دهنده جنسیت پسر است
  AND (first_name = 'علی' OR first_name = 'رضا');

  --حذف دانش‌آموزان با امتیاز صفر و پایه تحصیلی کوچکتر از12
  DELETE FROM Students
WHERE score = 0
  AND grade < 12;
