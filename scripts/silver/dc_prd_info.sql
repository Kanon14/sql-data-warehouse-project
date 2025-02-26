/* Loading data into silver layer */
-- Insert cleaned data into silver.crm_prd_info
INSERT INTO silver.crm_prd_info (   
	prd_id,       
	cat_id,		 
	prd_key,      
	prd_nm,       
	prd_cost,     
	prd_line,     
	prd_start_dt, 
	prd_end_dt  
)

/* Data Cleaning, Transformation & Standardization Section*/
-- bronze.crm_prd_info
SELECT
    prd_id,
    REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_id,
    SUBSTRING(prd_key, 7, LENGTH(prd_key)) AS prd_key,
    prd_nm,
    prd_cost, 
    CASE UPPER(TRIM(prd_line))
		 WHEN 'M' THEN 'Mountain'
		 WHEN 'R' THEN 'Road'
         WHEN 'S' THEN 'Other Sales'
         WHEN 'T' THEN 'Touring'
         ELSE 'n/a'
	END AS prd_line,
    CAST(prd_start_dt AS DATE) AS prd_start_dt,
    CAST(DATE_SUB(LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt), INTERVAL 1 DAY) AS DATE) AS prd_end_dt_test
FROM bronze.crm_prd_info;
