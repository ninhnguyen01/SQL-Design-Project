
CREATE TABLE customers (
  customerNumber INTEGER PRIMARY KEY NOT NULL,
  customerName varchar(50) NOT NULL,
  contactLastName varchar(50) NOT NULL,
  contactFirstName varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  addressLine1 varchar(50) NOT NULL,
  addressLine2 varchar(50) DEFAULT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) DEFAULT NULL,
  postalCode varchar(15) DEFAULT NULL,
  country varchar(50) NOT NULL,
  salesRepEmployeeNumber INTEGER DEFAULT NULL,
  creditLimit decimal(10,2) DEFAULT NULL
  );



/*Table structure for table employees */


CREATE TABLE employees (
  employeeNumber INTEGER PRIMARY KEY NOT NULL,
  lastName varchar(50) NOT NULL,
  firstName varchar(50) NOT NULL,
  extension varchar(10) NOT NULL,
  email varchar(100) NOT NULL,
  officeCode varchar(10) NOT NULL,
  reportsTo INTEGER DEFAULT NULL,
  jobTitle varchar(50) NOT NULL,
  CONSTRAINT fk_employee_manager FOREIGN KEY (reportsTo)
      REFERENCES employees (employeeNumber)
        ON DELETE CASCADE
  );

/*Table structure for table offices */


CREATE TABLE offices (
  officeCode varchar(10) PRIMARY KEY NOT NULL,
  city varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  addressLine1 varchar(50) NOT NULL,
  addressLine2 varchar(50) DEFAULT NULL,
  state varchar(50) DEFAULT NULL,
  country varchar(50) NOT NULL,
  postalCode varchar(15) NOT NULL,
  territory varchar(10) NOT NULL
);

/*Table structure for table orderdetails */

CREATE TABLE orderdetails (
  orderNumber INTEGER NOT NULL,
  productCode  NVARCHAR2(50) NOT NULL,
  quantityOrdered INTEGER NOT NULL,
  priceEach decimal(10,2) NOT NULL,
  orderLineNumber INTEGER NOT NULL
);

ALTER TABLE orderdetails
    ADD PRIMARY KEY (orderNumber, productCode) DISABLE;

/*Table structure for table orders */

CREATE TABLE orders (
  orderNumber INTEGER PRIMARY KEY NOT NULL,
  orderDate VARCHAR2(1000) NOT NULL,
  requiredDate  VARCHAR2(1000) NOT NULL,
  shippedDate  VARCHAR2(1000) DEFAULT NULL,
  status varchar(15) NOT NULL,
  comments VARCHAR2(4000),
  customerNumber INTEGER NOT NULL,
  CONSTRAINT fk_orders_customers FOREIGN KEY(customerNumber)
  REFERENCES customers(customerNumber)
);


/*Table structure for table payments */

CREATE TABLE payments (
  customerNumber INTEGER NOT NULL,
  checkNumber varchar(50) NOT NULL,
  paymentDate  VARCHAR2(1000) NOT NULL,
  amount DECIMAL(10,2) NOT NULL
);
ALTER TABLE payments
    ADD PRIMARY KEY (customerNumber, checkNumber) DISABLE;
ALTER TABLE payments
    ADD CONSTRAINT fk_payments_customers FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber);


/*Table structure for table productlines */


CREATE TABLE productlines (
  productLine varchar(50) PRIMARY KEY NOT NULL,
  textDescription varchar(4000) DEFAULT NULL,
  htmlDescription CLOB,
  image CLOB
);

/*Table structure for table products */

CREATE TABLE products (
  productCode  NVARCHAR2(50) PRIMARY KEY NOT NULL,
  productName varchar(70) NOT NULL,
  productLine varchar(50) NOT NULL,
  productScale varchar(10) NOT NULL,
  productVendor varchar(50) NOT NULL,
  productDescription CLOB NOT NULL,
  quantityInStock INTEGER NOT NULL,
  buyPrice decimal(10,2) NOT NULL,
  MSRP decimal(10,2) NOT NULL,
  CONSTRAINT fk_products_productLine FOREIGN KEY (productLine)
  REFERENCES productLines(productLine)
);

/* ADD Foreign Key to customers table
*/
ALTER TABLE customers
    ADD CONSTRAINT fk_customers_employees FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber);




/*ADD Foreign Key Constraints to employees table */
ALTER TABLE employees
    ADD  CONSTRAINT fk_employees_officeCode FOREIGN KEY (officeCode) REFERENCES offices(officeCode);


/* ADD Foreign Key Constraints to orderdetails table */
ALTER TABLE orderdetails
    ADD CONSTRAINT fk_orderdetails_orders FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber);
ALTER TABLE orderdetails
    ADD CONSTRAINT fk_orderdetails_products FOREIGN KEY (productCode) REFERENCES products (productCode);

/* ADD FOREIGN KEY CONSTRAINT TO PAYMENTS TABLE */
ALTER TABLE payments
    ADD CONSTRAINT fk_payments_customers FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber);

/* ADD FOREIGN KEY CONSTRAINT TO PRODUCTS TABLE */