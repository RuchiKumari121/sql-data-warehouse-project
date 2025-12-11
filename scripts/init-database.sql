/*
Create Database and Schemas
===========================
*/

USE master;
GO
  
--Drop and create "DataWarehouse" database
  IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
  BEGIN 
      ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
      DROP DATABASE DataWarehouse;
END;
GO
  
--Create a database called "DataWarehouse"
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
