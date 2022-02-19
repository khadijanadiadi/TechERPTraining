---Assignment Date- 10th February,2022

--Roles

CREATE ROLES common;

GRANT SELECT, INSERT, UPDATE, DELETE
ON customers
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON contacts
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON products
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON product_categories
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON warehouses
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON locations
TO mdm;

GRANT SELECT, INSERT, UPDATE, DELETE
ON employees
TO mdm;

CREATE USER alice IDENTIFIED BY abcd1234;

GRANT CREATE SESSION TO alice;

GRANT mdm TO alice;

SET ROLE mdm;

SELECT * FROM session_roles;

CREATE ROLE order_entry IDENTIFIED BY xyz123;

GRANT SELECT, INSERT, UPDATE, DELETE
ON orders
TO order_entry;

GRANT SELECT, INSERT, UPDATE, DELETE
ON order_items
TO order_entry;
GRANT order_entry TO alice;
SET ROLE 
    order_entry IDENTIFIED BY xyz123,
    mdm;
SELECT * FROM session_roles;

--profiles

CREATE PROFILE CRM_USERS LIMIT 
    SESSIONS_PER_USER          UNLIMITED
    CPU_PER_SESSION            UNLIMITED 
    CPU_PER_CALL               3000 
    CONNECT_TIME               15;

