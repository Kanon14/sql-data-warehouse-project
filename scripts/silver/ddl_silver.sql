/*
===============================================================================
DDL Script: Create Silver Tables (MySQL Version)
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

-- Step 1: Create database and use it
DROP DATABASE IF EXISTS silver;
CREATE DATABASE IF NOT EXISTS silver;
USE silver;

-- Step 2: Drop tables to avoid conflicts
DROP TABLE IF EXISTS crm_cust_info;
DROP TABLE IF EXISTS crm_prd_info;
DROP TABLE IF EXISTS crm_sales_details;
DROP TABLE IF EXISTS erp_loc_a101;
DROP TABLE IF EXISTS erp_cust_az12;
DROP TABLE IF EXISTS erp_px_cat_g1v2;

-- Step 3: Create tables
-- Source: CRM
CREATE TABLE crm_cust_info
	(   cst_id              INT,
		cst_key             VARCHAR(50),
		cst_firstname       VARCHAR(50),
		cst_lastname        VARCHAR(50),
		cst_marital_status  VARCHAR(50),
		cst_gndr            VARCHAR(50),
		cst_create_date     DATE,
        dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE crm_prd_info
	(   prd_id       INT,
		prd_key      VARCHAR(50),
		prd_nm       VARCHAR(50),
		prd_cost     INT,
		prd_line     VARCHAR(50),
		prd_start_dt DATETIME,
		prd_end_dt   DATETIME,
        dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    
CREATE TABLE crm_sales_details
	(   sls_ord_num  VARCHAR(50),
		sls_prd_key  VARCHAR(50),
		sls_cust_id  INT,
		sls_order_dt INT,
		sls_ship_dt  INT,
		sls_due_dt   INT,
		sls_sales    INT,
		sls_quantity INT,
		sls_price    INT,
        dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Source: ERP
CREATE TABLE erp_loc_a101
	(   cid    VARCHAR(50),
		cntry  VARCHAR(50),
        dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    
CREATE TABLE erp_cust_az12
	(   cid    VARCHAR(50),
		bdate  DATE,
		gen    VARCHAR(50),
        dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    
CREATE TABLE erp_px_cat_g1v2
	(   id           VARCHAR(50),
		cat          VARCHAR(50),
		subcat       VARCHAR(50),
		maintenance  VARCHAR(50),
        dwh_create_date     DATETIME DEFAULT CURRENT_TIMESTAMP
    );
