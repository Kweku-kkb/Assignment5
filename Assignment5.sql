/*
--1.	What is an object in SQL?
	It is a database object which can be used for storing or referencing data. 
	It can also be used for the manipulation of data. Tables, views, Indexes and sequences are some objects in sql

-- 2.	What is Index? What are the advantages and disadvantages of using Indexes?
	An index is a schema object used by the server to speed up the retrieval of rows by using a pointer.
	Indexes can be helps to speed up select queries and where clauses by using rapid path access methods to locate data quickly.
	On the other hand, indexes slows up update and insert statements in queries.

--3.	What are the types of Indexes?
	Clustered Index: Clustered indexes sort and store rows data in a table or view based on their fundamental values
	Non-Clustered Index: Non-clustered index poses a structure, which is separated from data rows
	Unique Index: The unique index in SQL guarantees and confirms that the index key does not contain any duplicate values and therefore, enables the users to analyze that every row in the table is unique in one or the other way
	Filtered Index: A filtered index is created when a column has only a small number of relevant values for queries on the subset of values
	Columnstore Index: A column store index is a standard form of the index when it comes to storing and querying large data warehousing fact tables
	Hash Index: 
Hash Index in SQL is simply an array of N buckets or slots containing a pointer and a row on each bucket or slot

--4.	Does SQL Server automatically create indexes when a table is created? If yes, under which constraints?
	No, unless a primary key or a unique is created in the table. Since, a table does not require a primary or unique key always, indexes are not automatically created.

--5.	Can a table have multiple clustered index? Why?
	No, a table can only have one clustered index because the rows can only be stored in one order.

--6.	Can an index be created on multiple columns? Is yes, is the order of columns matter?
	Yes, it is known as a composite index. The order of the columns matters in order to achieve faster speed in the query processing.

--7.	Can indexes be created on views?
	Yes, indexes can be created on views for a faster query performance.
	
8.	What is normalization? What are the steps (normal forms) to achieve normalization?
	Normalization is the process organization data to reduce redundancy and improve data integrity
	i) 1st Normal Form (1NF)
	ii) 2nd Normal Form (1NF)
	iii) 3rd Normal Form (1NF)
	iV) Boyce Codd Normal Form (BCNF)

9.	What is denormalization and under which scenarios can it be preferable?
	Denormalization is a database optimization technique in which we add redundant data to one or more tables.
	This can help us avoid costly joins in a relational database. It can enhance query performance and make the database more convenient to manage

10.	How do you achieve Data Integrity in SQL Server?
	Data intergrity in SQL Server can be achieved by using constraints, domain, entity and referential integrity to achieve desired results.

11.	What are the different kinds of constraint do SQL Server have?
	Not Null Constraint.
	Check Constraint.
	Default Constraint.
	Unique Constraint.
	Primary key Constraint.
	Foreign key Constraint.

12.	What is the difference between Primary Key and Unique Key?
	Primary key uniquely identify a record in the table whereas a Foreign key is a field in the table that is primary key in another table.

13.	What is foreign key?
	Foreign key is a field in the table that is primary key in another table for referencing purposes.

14.	Can a table have multiple foreign keys?
	Yes, this is because a table can reference other tables

15.	Does a foreign key have to be unique? Can it be null?
	Yes, a foreign references references a primary key in another table and is unique and cannot be null

16.	Can we create indexes on Table Variables or Temporary Tables?
	Yes, the can be created implicitly using a primary key and unique constraint within the table variable or temp table

17.	What is Transaction? What types of transaction levels are there in SQL Server?
	A transaction is the logical work unit that performs a single activity or multiple activities in a database. 
	transaction levels are: Dirty Read, Non repeatable read, Phantom read
*/

Write queries for following scenarios
1.	Write an sql statement that will display the name of each customer and the sum of order totals placed by that customer during the year 2002
 
 Create table customer(cust_id int,  iname varchar (50))
 create table orders(order_id int,cust_id int,amount money,order_date smalldatetime)
 
	select c.iname, sum(o.order_id)
	from Customer c inner join Orders o
	on c.cust_id = o.order_id
	where o.order_date >='2002:01:01' and o.order_date <='2002:12:31'
	group by c.iname

 2.  The following table is used to store information about company’s personnel:
Create table person (id int, firstname varchar(100), lastname varchar(100)) write a query that returns all employees whose last names  start with “A”.

	Create table Person(Id int, FirstName varchar(100), LastName varchar(100))
	create proc spEmpWithLastName
	@emp varchar(100) out
	as
	begin
		select @emp = p.id, p.FirstName, p.LastName
		from Person p
		where p.LastName like('a%')
	end

3.  The information about company’s personnel is stored in the following table:
Create table person(person_id int primary key, manager_id int null, name varchar(100)not null) The filed managed_id contains the person_id of the employee’s manager.
Please write a query that would return the names of all top managers(an employee who does not have  a manger, and the number of people that report directly to this manager.
	create table Person(person_id int primary key, manager_id int null, name varchar(100)not null)
	create proc spTopManagers
	@ManagerName varchar(100) out
	as
	begin
		select @ManagerName = p.name
		from Person p
		where p.manager_id is null
	end

4.  List all events that can cause a trigger to be executed.
5. Generate a destination schema in 3rd Normal Form.  Include all necessary fact, join, and dictionary tables, and all Primary and Foreign Key relationships.  The following assumptions can be made:
a. Each Company can have one or more Divisions.
b. Each record in the Company table represents a unique combination 
c. Physical locations are associated with Divisions.
d. Some Company Divisions are collocated at the same physical of Company Name and Division Name.
e. Contacts can be associated with one or more divisions and the address, but are differentiated by suite/mail drop records.status of each association should be separately maintained and audited.
