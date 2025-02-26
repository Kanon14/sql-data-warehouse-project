/* Loading data into silver layer */
-- Insert cleaned data into silver.erp_px_cat_g1v2
INSERT INTO silver.erp_px_cat_g1v2(
	id,
    cat, 
    subcat,
    maintenance
)

/* Data Cleaning, Transformation & Standardization Section*/
-- bronze.erp_px_cat_g1v2
SELECT
	id,
    cat,
    subcat,
    maintenance
FROM bronze.erp_px_cat_g1v2
