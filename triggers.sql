USE bankSysDb;
 
CREATE TRIGGER trg_Ownership_Insert
ON car
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @CarID INT, @OwnerType VARCHAR(10), @OwnerID INT;

    SELECT @CarID = Car_ID, @OwnerType = Owner_Type, @OwnerID = Owner_ID
    FROM inserted;

    IF @OwnerType = 'Employee' AND EXISTS (SELECT 1 FROM Employee WHERE Emp_ID = @OwnerID)
    BEGIN
        INSERT INTO Car (Car_ID, Owner_Type, Owner_ID)
        VALUES (@CarID, @OwnerType, @OwnerID);
    END
    ELSE IF @OwnerType = 'Customer' AND EXISTS (SELECT 1 FROM Customer WHERE Customer_ID = @OwnerID)
    BEGIN
        INSERT INTO Car(Car_ID, Owner_Type, Owner_ID)
        VALUES (@CarID, @OwnerType, @OwnerID);
    END
    ELSE
    BEGIN
        RAISERROR('Invalid OwnerType or OwnerID', 16, 1);
    END
END;