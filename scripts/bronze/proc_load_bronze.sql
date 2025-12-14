/*
============================================
LOADING SOURCE TABLES INTO THE BRONZE LAYER
============================================
*/
/*======================
usage example :
EXEC bronze.load_bronze;
========================
*/


----CRM SOURCE
create OR alter procedure bronze.load_bronze AS
begin

	DECLARE @start_time datetime, @end_time datetime
  
	set @start_time = getdate();
	TRUNCATE TABLE bronze.crm_cust_info;
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\DELL\Downloads\sql-datawarehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
	);
	set @end_time = getdate();
	PRINT 'Loading time :' + cast(datediff(second, @start_time, @end_time) AS nvarchar) + ' seconds'; 

	TRUNCATE TABLE bronze.crm_prd_info;
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\DELL\Downloads\sql-datawarehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
	);

	TRUNCATE TABLE bronze.crm_sales_details;
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\DELL\Downloads\sql-datawarehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
	);


	-----ERP SOURCE
	TRUNCATE TABLE bronze.erp_cust_az12;
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\DELL\Downloads\sql-datawarehouse\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
	WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
	);

	TRUNCATE TABLE bronze.erp_loc_a101;
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\DELL\Downloads\sql-datawarehouse\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
	WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
	);



	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\DELL\Downloads\sql-datawarehouse\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
	WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
	);
end
