/* Loading data into silver layer */
-- Insert cleaned data into silver.erp_loc_a101
INSERT INTO silver.erp_loc_a101(
	cid,
    cntry
)

/* Data Cleaning, Transformation & Standardization Section*/
-- bronze.erp_loc_a101
SELECT 
	REPLACE(cid, '-', '') AS cid,
    CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
		 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
         WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
         ELSE TRIM(cntry)
	END AS cntry
FROM bronze.erp_loc_a101;
