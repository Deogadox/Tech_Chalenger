
USE DB_CHALLENGER;
GO

CREATE OR ALTER PROCEDURE TC1.sp_carga_olist
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        PRINT '========================================';
        PRINT 'INICIANDO CARGA DATASET OLIST';
        PRINT '========================================';


        -- =============================================
        -- LIMPEZA DAS TABELAS
        -- =============================================

        PRINT 'Limpando tabelas...';

        TRUNCATE TABLE TC1.customers_dataset;
        TRUNCATE TABLE TC1.geolocation;
        TRUNCATE TABLE TC1.order_items;
        TRUNCATE TABLE TC1.order_payments;
        TRUNCATE TABLE TC1.order_reviews;
        TRUNCATE TABLE TC1.orders;
        TRUNCATE TABLE TC1.products;
        TRUNCATE TABLE TC1.sellers;
        TRUNCATE TABLE TC1.product_category;


        -- =============================================
        -- CUSTOMERS
        -- =============================================

        PRINT 'Carregando CUSTOMERS...';

        BULK INSERT TC1.customers_dataset
        FROM 'C:\Users\felip\Downloads\archive\olist_customers_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );


        -- =============================================
        -- GEOLOCATION
        -- =============================================

        PRINT 'Carregando GEOLOCATION...';

        BULK INSERT TC1.geolocation
        FROM 'C:\Users\felip\Downloads\archive\olist_geolocation_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );


        -- =============================================
        -- ORDER ITEMS
        -- =============================================

        PRINT 'Carregando ORDER ITEMS...';

        BULK INSERT TC1.order_items
        FROM 'C:\Users\felip\Downloads\archive\olist_order_items_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );


        -- =============================================
        -- ORDER PAYMENTS
        -- =============================================

        PRINT 'Carregando ORDER PAYMENTS...';

        BULK INSERT TC1.order_payments
        FROM 'C:\Users\felip\Downloads\archive\olist_order_payments_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );




        -- =============================================
        -- ORDERS
        -- =============================================

        PRINT 'Carregando ORDERS...';

        BULK INSERT TC1.orders
        FROM 'C:\Users\felip\Downloads\archive\olist_orders_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );


        -- =============================================
        -- PRODUCTS
        -- =============================================

        PRINT 'Carregando PRODUCTS...';

        BULK INSERT TC1.products
        FROM 'C:\Users\felip\Downloads\archive\olist_products_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );


        -- =============================================
        -- SELLERS
        -- =============================================

        PRINT 'Carregando SELLERS...';

        BULK INSERT TC1.sellers
        FROM 'C:\Users\felip\Downloads\archive\olist_sellers_dataset.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );


        -- =============================================
        -- PRODUCT CATEGORY
        -- =============================================

        PRINT 'Carregando PRODUCT CATEGORY...';

        BULK INSERT TC1.product_category
        FROM 'C:\Users\felip\Downloads\archive\product_category_name_translation.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDQUOTE = '"',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );


        PRINT '========================================';
        PRINT 'CARGA FINALIZADA COM SUCESSO';
        PRINT '========================================';

    END TRY

    BEGIN CATCH

        PRINT '========================================';
        PRINT 'ERRO DURANTE A CARGA';
        PRINT '========================================';

        PRINT ERROR_MESSAGE();

        THROW;

    END CATCH

END;
GO

