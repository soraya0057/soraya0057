CREATE TABLE [Customer] (
  [Customer_id] integer PRIMARY KEY,
  [Customer_fname] nvarchar(255),
  [Customer_lname] nvarchar(255),
  [Date_record] date,
  [Facture_id] integer,
  [Customer_tell] integer,
  [Customer_address] char
)
GO

CREATE TABLE [Facture] (
  [Facture_id] integer PRIMARY KEY,
  [Ware_id] integer,
  [Ware_name] nvarchar(255),
  [Ware_number] integer,
  [Ware_unit_price] integer,
  [Ware_total_price] integer,
  [Amount] integer,
  [Customer_id] integer,
  [Date_record] date
)
GO

CREATE TABLE [Ware] (
  [Ware_id] integer PRIMARY KEY,
  [Ware_name] nvarchar(255),
  [Source] nvarchar(255),
  [Receipt_number] integer,
  [Clearance_date] date,
  [Update_date] date
)
GO

CREATE TABLE [Account] (
  [Account_id] integer PRIMARY KEY,
  [Customer_id] integer,
  [Facture_id] integer,
  [Invoice_amount] integer,
  [Payment] integer
)
GO

ALTER TABLE [Customer] ADD FOREIGN KEY ([Facture_id]) REFERENCES [Facture] ([Facture_id])
GO

ALTER TABLE [Account] ADD FOREIGN KEY ([Facture_id]) REFERENCES [Facture] ([Facture_id])
GO

ALTER TABLE [Facture] ADD FOREIGN KEY ([Ware_id]) REFERENCES [Ware] ([Ware_id])
GO

ALTER TABLE [Facture] ADD FOREIGN KEY ([Customer_id]) REFERENCES [Customer] ([Customer_id])
GO

ALTER TABLE [Account] ADD FOREIGN KEY ([Customer_id]) REFERENCES [Customer] ([Customer_id])
GO
