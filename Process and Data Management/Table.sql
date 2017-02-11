-- Script to create tables, insert data, and query data--

-- Create table for customers--
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID  VARCHAR2(20) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(30) NOT NULL,
    STREET VARCHAR2(30),
    CITY VARCHAR2(30),
    ZIP_CODE NUMBER(5),
    PHONE_NUMBER NUMBER(10) NOT NULL,
    EMAIL_ADRESS VARCHAR2(30) NOT NULL,
    CONTACT_PERSON_LAST_NAME VARCHAR2(30) NOT NULL,
    CONTACT_PERSON_FIRST_NAME VARCHAR2(30) NOT NULL);

-- Insert data for customers--    
INSERT into CUSTOMERS VALUES 
(1, 'Pizzeria Roma', '12 Temple Street', 'Hartford', 06103, 8602881234, 
'Roma@pizza.com', 'di Guilio', 'Raffaele');
INSERT into CUSTOMERS VALUES 
(2, 'City Steam', '357 Main Street', 'Hartford', 06103, 8602579534, 
'CitySteam@gmail.com', 'Smith', 'John') ;
INSERT into CUSTOMERS VALUES 
(3, 'Salute', '100 Trumbull Street', 'Hartford', 06103, 8602881235, 
'Salute@uconn.edu', 'Wilson', 'John');
INSERT into CUSTOMERS VALUES 
(4, 'Max Downtown', '185 Asylum Street', 'Hartford', 06103, 8602579537, 
'Max185@gmail.com', 'Mad', 'Max') ;
INSERT into CUSTOMERS VALUES 
(5, 'Treva', '980 Farmington Ave', 'West Hartford', 06107, 8602701235, 
'Treva@resto.com', 'Doe' ,'John');
INSERT into CUSTOMERS VALUES 
(6, 'Restaurant Bricco', '78 LaSalle Rd', 'West Hartford', 06108, 8502579127, 
'Br@co.com', 'Rizzola' , 'Bricco') ;

-- Create table for suppliers--
CREATE TABLE SUPPLIERS (
    SUPPLIER_ID  VARCHAR2(20) PRIMARY KEY,
    SUPPLIER_NAME VARCHAR2(30) NOT NULL,
    STREET VARCHAR2(30),
    CITY VARCHAR2(30),
    ZIP_CODE NUMBER(5),
    PHONE_NUMBER NUMBER(10) NOT NULL,
    EMAIL_ADRESS VARCHAR2(30) NOT NULL,
    CONTACT_PERSON_LAST_NAME VARCHAR2(30) NOT NULL,
    CONTACT_PERSON_FIRST_NAME VARCHAR2(30) NOT NULL);

-- Insert data for suppliers--    
INSERT into SUPPLIERS VALUES 
(1, 'Mushroom Breeders, Inc.', '54 Mushroom Road', 'Mushington', 05050, 8602881234, 
'Mushrooms@gmail.com', 'Prin' , 'Priotr');
INSERT into SUPPLIERS VALUES 
(2, 'Shii-Take Import', '12 Harbor Street', 'New Haven', 06020, 825175923, 
'Riosokku.Ling@gmail.com', 'Ling', 'Riosokku') ;
INSERT into SUPPLIERS VALUES 
(3, 'Asparagus Field', '100 Farmington Street', 'Hartford', 06103, 8602887979, 
'Aspargus.Avanti@uconn.edu', 'Wilson' ,'John');
INSERT into SUPPLIERS VALUES 
(4, 'Crazy Mushrooms', '5 Broadway', 'New York', 00550, 1234567878, 
'Donal.Trunt@gmail.com', 'Trump' , 'Donald') ;

-- Create table for products--   
CREATE TABLE PRODUCTS (
    PRODUCT_ID  VARCHAR2(20) PRIMARY KEY,
    SUPPLIER_ID VARCHAR2(30) REFERENCES SUPPLIERS(SUPPLIER_ID),
    PRODUCT_DESCRIPTION VARCHAR2(140),
    UNIT_WEIGHT_KG NUMBER(*,2) NOT NULL,
    STANDARD_UNIT_PRICE NUMBER(*,2) NOT NULL);
    
-- Insert data for products--    
INSERT into PRODUCTS VALUES 
(1, 1, 'White Mushrooms from Poland', 1, 4.07);

INSERT into PRODUCTS VALUES 
(2, 1, 'Brown Mushrooms from Poland', 1, 4.28);

INSERT into PRODUCTS VALUES 
(3, 3, 'Asparagus', 2.5, 9.87);

INSERT into PRODUCTS VALUES 
(4, 1, 'Psychedelic Special', 1, 19.95);

INSERT into PRODUCTS VALUES 
(5, 2, 'Shii-Take', 1, 14.95);

-- Create table for demand_orders (what customers order)--   
CREATE TABLE DEMAND_ORDERS(
    DEMAND_ORDER_ID  VARCHAR2(20) PRIMARY KEY,
    CUSTOMER_ID VARCHAR2(30) REFERENCES CUSTOMERS(CUSTOMER_ID),
    PRODUCT_ID VARCHAR2(30) REFERENCES PRODUCTS(PRODUCT_ID),
    ORDER_DATE DATE DEFAULT Sysdate,
    ORDER_QUANTITY NUMBER(*,2) NOT NULL,
    RETAIL_PRICE NUMBER(*,2) NOT NULL);
 
-- Insert data for demand_orders--     
INSERT into DEMAND_ORDERS VALUES 
(1, 1, 1, to_date('11022016','MMDDYYYY'), 5,  4.28);
INSERT into DEMAND_ORDERS VALUES 
(2, 4, 3, to_date('11022016','MMDDYYYY'), 10,  11.07);
INSERT into DEMAND_ORDERS VALUES 
(3, 4, 2, to_date('11032016','MMDDYYYY'), 5,  3.91);
INSERT into DEMAND_ORDERS VALUES 
(4, 2, 1, to_date('11142016','MMDDYYYY'), 25,  4.07);
INSERT into DEMAND_ORDERS VALUES 
(5, 3, 4, to_date('11162016','MMDDYYYY'), 5,  18.56);
INSERT into DEMAND_ORDERS VALUES 
(6, 3, 4, to_date('11162016','MMDDYYYY'), 1,  26.23);
INSERT into DEMAND_ORDERS VALUES 
(7, 2, 3, to_date('11172016','MMDDYYYY'), 2,  10.15);
INSERT into DEMAND_ORDERS VALUES 
(8, 4, 4, to_date('11222016','MMDDYYYY'), 10,  20.33);
INSERT into DEMAND_ORDERS VALUES 
(9, 1, 4, to_date('11232016','MMDDYYYY'), 12,  19.43);
INSERT into DEMAND_ORDERS VALUES 
(10, 2, 3, to_date('11232016','MMDDYYYY'), 45,  9.07);
INSERT into DEMAND_ORDERS VALUES 
(11, 4, 4, to_date('11252016','MMDDYYYY'), 70,  18.56);
INSERT into DEMAND_ORDERS VALUES 
(12, 3, 1, to_date('12032016','MMDDYYYY'), 75,  3.99);


-- Create table for demand_orders (what we order from our vendors)--   
CREATE TABLE SUPPLY_ORDERS(
    SUPPLY_ORDER_ID VARCHAR2(20) PRIMARY KEY,
    SUPPLIER_ID VARCHAR2(30) REFERENCES SUPPLIERS(SUPPLIER_ID),
    PRODUCT_ID VARCHAR2(30) REFERENCES PRODUCTS(PRODUCT_ID),
    ORDER_DATE DATE DEFAULT Sysdate,
    ORDER_QUANTITY NUMBER(*,2) NOT NULL,
    PURCHASE_PRICE NUMBER(*,2) NOT NULL);

-- Insert data for supply_orders--   
INSERT into SUPPLY_ORDERS VALUES 
(1, 1, 1, to_date('11012016','MMDDYYYY'), 220,  2.23);
INSERT into SUPPLY_ORDERS VALUES 
(2, 1, 2, to_date('11052016','MMDDYYYY'), 89,  2.57);
INSERT into SUPPLY_ORDERS VALUES 
(3, 3, 3, to_date('11012016','MMDDYYYY'), 95,  7.94);
INSERT into SUPPLY_ORDERS VALUES 
(4, 2, 4, to_date('11082016','MMDDYYYY'), 465,  11.04);
