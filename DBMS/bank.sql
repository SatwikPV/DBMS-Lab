CREATE TABLE BRANCH
(
branch_name varchar2(10),
branch_city varchar2(10),
assets number(20,5),
primary key (branch_name)
)
INSERT INTO BRANCH VALUES(&#39;&amp;branch_name&#39;, &#39;&amp;branch_city&#39;,&amp;assets);
SELECT * FROM BRANCH

CREATE TABLE ACCOUNTS
(
accno NUMBER(15),
branch_name varchar2(10),
balance NUMBER(7,2),
PRIMARY KEY (accno),
FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
)
INSERT INTO ACCOUNTS VALUES(&#39;&amp;accno&#39;, &#39;&amp;branch_name&#39;, &amp;balance);
SELECT * FROM ACCOUNTS

CREATE TABLE CUSTOMER
( customer_name varchar2(10),
customer_street varchar2(10),
customer_city varchar2(10),
PRIMARY KEY (customer_name)
)
INSERT INTO CUSTOMER VALUES(&#39;&amp;customer_name&#39; , &#39;&amp;customer_street&#39;, &#39;&amp;customer_city&#39;)
SELECT * FROM CUSTOMER

CREATE TABLE DEPOSITOR
(
customer_name varchar2(10),
accno NUMBER(15),
PRIMARY KEY (customer_name,accno),
FOREIGN KEY (accno) REFERENCES ACCOUNTS(accno),
FOREIGN KEY (customer_name) REFERENCES CUSTOMER(customer_name)
)
INSERT INTO DEPOSITOR VALUES(&#39;&amp;customer_name&#39; , &#39;&amp;accno&#39;);
SELECT * FROM DEPOSITOR

CREATE TABLE LOAN
(
loan_number NUMBER(15),
branch_name varchar2(10),
amount NUMBER(7,2),
PRIMARY KEY(loan_number),
FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
)
INSERT INTO LOAN VALUES(&#39;&amp;loan_number&#39;, &#39;&amp;branch_name&#39;, &amp;amount);
SELECT * FROM LOAN;

CREATE TABLE BORROWER
(
customer_name varchar2(10),
loan_number NUMBER(15),
PRIMARY KEY (customer_name),
FOREIGN KEY (loan_number) REFERENCES LOAN(loan_number)

)
INSERT INTO BORROWER VALUES(&#39;&amp;customer_name&#39;,&#39;&amp;loan_number&#39;);
SELECT * FROM BORROWER;