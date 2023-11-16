CREATE DATABASE QuanLyQuanCafe
GO -- 

USE QuanLyQuanCafe
GO

-- Food
-- Table
-- FoodCategory
-- Account
-- Bill 1 hóa đơn có nhìu món ăn
-- Bill info 



CREATE TABlE TableFood 
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'bàn chưa có tên',
	 status NVARCHAR(100) NOT NULL DEFAULT N'Trống'-- còn trống, có người
)
GO

CREATE TABLE Account 
(
		UserName NVARCHAR(100)  PRIMARY KEY,
		DisplayName NVARCHAR(100) NOT NULL DEFAULT N'hiu',
		
		Password NVARCHAR(1000) NOT NULL DEFAULT 0,
		Type int NOT NULL DEFAULT 0 --1: admin && 0 staff 
)
GO

CREATE TABLE FoodCategory 
( id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'chưa đặt ten'
)
GO

CREATE TABLE Food
(   id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'chưa đặt ten',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0

	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,

	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE ,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1 thanh toán || 2 chưa thanh toán

	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)


)
GO

CREATE TABLE BillInfo 
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0

	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)

)
GO


INSERT INTO dbo.Account
	(UserName,
	DisplayName,
	Password,
	Type
	)
VALUES (N'K9',	--UserName -nvarchar(100)
		N'RongK9', --DisplayName -nvarchar(100)
		N'1', --PasWord -nvarchar(100)
		1  --Type -int
		)

INSERT INTO dbo.Account
	(UserName,
	DisplayName,
	Password,
	Type
	)
VALUES (N'Hiu',	--UserName -nvarchar(100)
		N'TrungHieu', --DisplayName -nvarchar(100)
		N'123456', --PasWord -nvarchar(100)
		1  --Type -int
		)		
INSERT INTO dbo.Account
	(UserName,
	DisplayName,
	Password,
	Type
	)
VALUES (N'staff',	--UserName -nvarchar(100)
		N'staff', --DisplayName -nvarchar(100)
		N'1', --PasWord -nvarchar(100)
		0  --Type -int
		)
GO

CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO

EXEC dbo.USP_GetAccountByUserName @userName = N'K9' --varchar (100)
GO
CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
END
Go


--THêm bàn
DECLARE @i INT = 1

While @i <= 20
BEGIN
INSERT dbo.TableFood (name)VALUES (N'Bàn' + CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END
GO

CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.TableFood
GO
EXEC dbo.USP_GetTableList




-- thêm category
INSERT dbo.FoodCategory
	(name)
VALUES (N'Hải sản'
		)

INSERT dbo.FoodCategory
	(name)
VALUES (N'Nông sản'
		)

INSERT dbo.FoodCategory
	(name)
VALUES (N'Lâm sản'
		)

INSERT dbo.FoodCategory
	(name)
VALUES (N'Sản sản'
		)

INSERT dbo.FoodCategory
	(name)
VALUES (N'Nước'
		)
 
 -- thêm món ăn

 INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Mực nướng sa tế', --name, -nvarchar(100)
			1,		--id category - int 
			120000)		---price -float
 INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Mực nướng muối ớt', --name, -nvarchar(100)
			1,		--id category - int 
			99000)		---price -float


INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Nghêu hâp xả', --name, -nvarchar(100)
			1,		--id category - int 
			60000)		---price -float
			
INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Dú dê nướng sữa', --name, -nvarchar(100)
			2,		--id category - int 
			100000)		---price -float
INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Heo rừng nướng', --name, -nvarchar(100)
			3,		--id category - int 
			100000)		---price -float


INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Cơm chiên mushi', --name, -nvarchar(100)
			4,		--id category - int 
			99000)		---price -float

INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Cơm chiên rau nấm', --name, -nvarchar(100)
			4,		--id category - int 
			65000)		---price -float

INSERT dbo.Food 
			(name, idCategory, price)

VALUES		(N'7up', --name, -nvarchar(100)
			5,		--id category - int 
			12000)		---price -float

INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Tiger', --name, -nvarchar(100)
			5,		--id category - int 
			20000)		---price -float

INSERT dbo.Food 
			(name, idCategory, price)
VALUES		(N'Sài Gòn', --name, -nvarchar(100)
			5,		--id category - int 
			20000)		---zz -float





-- Thêm bill
INSERT dbo.Bill
		( DateCheckIn,
		DateCheckOut,
		idTable,
		status
		)
VALUES (GETDATE() , -- datecheckin --date
		NULL,
		1, --idtable int
		0) -- status - int

-----------------------------------------------
INSERT dbo.Bill
		( DateCheckIn,
		DateCheckOut,
		idTable,
		status
		)
VALUES (GETDATE() , -- datecheckin --date
		NULL,
		2, --idtable int
		0) -- status - int




INSERT dbo.Bill
		( DateCheckIn,
		DateCheckOut,
		idTable,
		status
		)
VALUES (GETDATE() , -- datecheckin --date
		GETDATE(),
		3, --idtable int
		1) -- status - int


INSERT dbo.Bill
		( DateCheckIn,
		DateCheckOut,
		idTable,
		status
		)
VALUES (GETDATE() , -- datecheckin --date
		NULL,
		4, --idtable int
		0) -- status - int



-- Thêm bill info

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (1, --idBill -int
		7, --idfood - int
		2 --count - int
		)

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (1, --idBill -int
		3, --idfood - int
		4 --count - int
		)


INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (1, --idBill -int
		5, --idfood - int
		1 --count - int
		)

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (2, --idBill -int
		2, --idfood - int
		2 --count - int
		)


INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (2, --idBill -int
		6, --idfood - int
		2 --count - int
		)

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (2, --idBill -int
		5, --idfood - int
		2 --count - int
		)

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (3, --idBill -int
		4, --idfood - int
		2 --count - int
		)

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (3, --idBill -int
		6, --idfood - int
		2 --count - int
		)

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (3, --idBill -int
		4, --idfood - int
		2 --count - int
		)

INSERT dbo.BillInfo
			(idBill, idFood, count )
VALUES (5, --idBill -int
		4, --idfood - int
		2 --count - int
		)


GO
---------------------------------------------------

delete from dbo.Bill where id = 1
delete from dbo.Bill where id = 2
delete from dbo.Bill where id = 3
delete from dbo.Bill where id = 4
delete from dbo.Bill where id = 5
delete from dbo.Bill where id = 6
delete from dbo.Food where id = 17
delete from dbo.Food where id = 18
delete from dbo.Food where id = 19
delete from dbo.Food where id = 20
-------------------------------------------
delete from dbo.TableFood where id = 21
delete from dbo.TableFood where id = 22
delete from dbo.TableFood where id = 23
delete from dbo.TableFood where id = 24
delete from dbo.TableFood where id = 25
delete from dbo.TableFood where id = 26
delete from dbo.TableFood where id = 27
delete from dbo.TableFood where id = 28
delete from dbo.TableFood where id = 29
delete from dbo.TableFood where id = 30
delete from dbo.TableFood where id = 31
delete from dbo.TableFood where id = 32
delete from dbo.TableFood where id = 33
delete from dbo.TableFood where id = 34
delete from dbo.TableFood where id = 35
delete from dbo.TableFood where id = 36
delete from dbo.TableFood where id = 37
delete from dbo.TableFood where id = 38
delete from dbo.TableFood where id = 39
delete from dbo.TableFood where id = 40




---------------------------------------------------
select * from TableFood
SELECT * FROM Bill
SELECT * FROM BillInfo
SELECT * FROM Food
SELECT * FROM FoodCategory
select * from Food where idCategory =id

select MAX(id) from dbo.Bill
---------------------------------------------------



SELECT f.name, bi.count, f.price, f.price*bi.count as totalPrice FROM dbo.BillInfo AS bi, dbo.Bill AS b, dbo.Food AS f 
WHERE bi.idBill = b.id AND bi.idFood = f.id AND b.idTable = 4

-- cập nhật có người

UPDATE dbo.TableFood SET STATUS = N'Trống' where id = 6

UPDATE dbo.TableFood SET STATUS = N'Trống' where id = 8

----------------------------------------------------------------

ALTER PROC USP_InsertBill
@idTable INT
AS
BEGIN
	INSERT dbo.Bill
			( DateCheckIn ,
			DateCheckOut,
			idTable,
			status,
			discount)
	VALUES  (GETDATE () ,
			NULL,
			@idTable ,
			0,
			0
			)

END
Go

-----------------------------------------------------------------------------

alter PROC USP_InsertBill
@idTable INT
AS
BEGIN
	INSERT dbo.Bill 
	        ( DateCheckIn ,
	          DateCheckOut ,
	          idTable ,
	          status,
	          discount
	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0,  -- status - int
	          0
	        )
END
GO

alter PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT
AS
BEGIN

	DECLARE @isExitsBillInfo INT
	DECLARE @foodCount INT = 1
	
	SELECT @isExitsBillInfo = id, @foodCount = b.count 
	FROM dbo.BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood

	IF (@isExitsBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @foodCount + @count
		IF (@newCount > 0)
			UPDATE dbo.BillInfo	SET count = @foodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT	dbo.BillInfo
        ( idBill, idFood, count )
		VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
	END
END
GO

-----------------------------------------------------------------------------
CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT
AS
BEGIN
		DECLARE @isExitsBillInfo INT
		DECLARE @foodCount INT = 1

		SELECT @isExitsBillInfo = id, @foodCount = b.count FROM dbo.BillInfo as b WHERE idBill = @idBill AND idFood = @idFood
		
		IF (@isExitsBillInfo > 0)
			BEGIN 
				DECLARE @newCount INT = @foodCount + @count
				if (@newCount > 0)
					UPDATE dbo.BillInfo SET count = @foodCount + @count WHERE idFood = @idFood
				ELSE
					DELETE dbo.BillInfo WHERE idBill = @idBIll AND idFood = @idFood
			END
		ELSE

	BEGIN
		INSERT dbo.BillInfo
				(idBill, idFood, count )

		VALUES (@idBill, --idBill -int
				@idFood, --idfood - int
				@count --count - int
				)
	END

END
GO
	
UPDATE dbo.Bill SET status = 1 WHERE id = 1
--------

ALTER TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = idBill FROM Inserted
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0	
	
	UPDATE dbo.TableFood SET status = N'Có người' where id = @idTable
	

	
END
GO

alter TRIGGER UTG_UpdateTable
ON dbo.TableFood FOR UPDATE
AS
BEGIN
			DECLARE @idTable INT
			DECLARE @status NVARCHAR(100) 


			select @idTable = id,  @status = Inserted.status from  Inserted	
			DECLARE @idBill INT	
			SELECT @idBill = id FROM dbo.Bill WHERE idTable = @idTable AND status = 0
			DECLARE @coundBillInfo INT 
			SELECT @coundBillInfo = count(*) FROM dbo.BillInfo WHERE idBill = @idBill


			IF(@coundBillInfo > 0 AND @status <> N'Có người')
				UPDATE dbo.TableFood SET status = N'Có người' WHERE id = @idTable
			ELSE IF (@coundBillInfo <= 0 AND @status <> N'Trống')
				UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable

			


END
GO


ALTER TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT
	
	SELECT @idBill = id FROM Inserted	
	
	DECLARE @idTable INT
	
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count int = 0
	
	SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO

--------


delete dbo.BillInfo
delete dbo.Account



AlTER TABLE dbo.Bill
ADD discount INT

UPDATE dbo.Bill SET discount = 0

------------------------chuyển bàn-------------
ALTER PROC [dbo].[USP_SwitchTabel]
@idTable1 INT, @idTable2 int
AS BEGIN

	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill INT
	
	DECLARE @isFirstTablEmty INT = 1
	DECLARE @isSecondTablEmty INT = 1
	
	
	SELECT @idSeconrdBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idFirstBill IS NULL)
	BEGIN
		PRINT '0000001'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable1 , -- idTable - int
		          0  -- status - int
		        )
		        
		SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
		
	END
	
	SELECT @isFirstTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idFirstBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'
	
	IF (@idSeconrdBill IS NULL)
	BEGIN
		PRINT '0000002'
		INSERT dbo.Bill
		        ( DateCheckIn ,
		          DateCheckOut ,
		          idTable ,
		          status
		        )
		VALUES  ( GETDATE() , -- DateCheckIn - date
		          NULL , -- DateCheckOut - date
		          @idTable2 , -- idTable - int
		          0  -- status - int
		        )
		SELECT @idSeconrdBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0
		
	END
	
	SELECT @isSecondTablEmty = COUNT(*) FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	PRINT @idFirstBill
	PRINT @idSeconrdBill
	PRINT '-----------'

	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSeconrdBill
	
	UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill = @idFirstBill
	
	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable
	
	IF (@isFirstTablEmty = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable2
		
	IF (@isSecondTablEmty= 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable1
END
GO

select * from dbo.Bill

DECLARE @idBillNew INT = 18
select * from dbo.BillInfo where idBill = @idBillNew

DECLARE @idBillold INT = 10
UPDATE dbo.BillInfo SET idBill = @idBillold where id IN (select * from dbo.BillInfo where idBill = @idBillNew)

EXEC dbo.USP_SwitchTabel @idTable1 = 5,
	@idTable2 = 6




CREATE TRIGGER UTG_DeleteBillInfo
ON dbo.BillInfo FOR DELETE
AS 
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT
	SELECT @idBillInfo = id, @idBill = Deleted.idBill FROM Deleted
	
	DECLARE @idTable INT
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count INT = 0
	
	SELECT @count = COUNT(*) FROM dbo.BillInfo AS bi, dbo.Bill AS b WHERE b.id = bi.idBill AND b.id = @idBill AND b.status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
END
GO




CREATE PROC USP_UpdateAccount
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END
GO


select * from dbo.Food
select * from dbo.FoodCategory
select * from dbo.BillInfo
select * from dbo.Bill
delete from dbo.Bill where id = 5036
delete from dbo.Bill where id = 5037
delete from dbo.Bill where id = 5038
delete from dbo.Bill where id = 5039

delete from dbo.Food where id = 5005
delete from dbo.Food where id = 5006
delete from dbo.Food where id = 5007
delete from dbo.Food where id = 5008
delete from dbo.Food where id = 5009
delete from dbo.Food where id = 5010
delete from dbo.Food where id = 5011
delete from dbo.Food where id = 5012
delete from dbo.Food where id = 5013
delete from dbo.Food where id = 5014
delete from dbo.Food where id = 5015
delete from dbo.Food where id = 5016
delete from dbo.Food where id = 5017

delete from dbo.FoodCategory where id = 4003
delete from dbo.FoodCategory where id = 4004

delete from dbo.FoodCategory where id = 4005

delete from dbo.FoodCategory where id = 4006
delete from dbo.FoodCategory where id = 4007
delete from dbo.FoodCategory where id = 4008
delete from dbo.FoodCategory where id = 4009
delete from dbo.FoodCategory where id = 4010




