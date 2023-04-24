# Bank Transaction Tracking

## Overview
This is a SQL-based project that tracks the flow of money within a bank database. The aim of the project is to find out where a specific amount of money has come from and where it is going to. Tracking the flow of money is a crucial task for banks to ensure that all transactions are legitimate and comply with the law. In addition, tracking the source of the money is important to prevent money laundering and illegal activities. The project displays every transaction that matches the exact amount of money in the input on the same day. Additionally, it tracks the money in ascending order of time until the sum of transactions adds up to the input transaction amount. If the new amount when adding up exceeds the input amount plus 10 percent of the amount, then the project doesn't add the transaction. The similar process is taken for the source deposit too.

The project also stops tracking transactions in two scenarios:
* When the money gets out of the bank or enters the bank from another bank.
* When the money is in the bank and has no further transactions.

The bank relational database consists of six tables that store information related to customers, transactions, deposits, deposit types, deposit statuses, and branches. 

## Tables 
### Customers
* CID (int): a unique identifier for each customer.
* Name (varchar): the name of the customer.
* NatCod (varchar): a 10-digit code indicating the customer's nationality.
* Birthdate (date): the customer's date of birth.
* Add (varchar): the customer's address.
* Tel (varchar): the customer's telephone number.

### Trn_Src_Des
* Voucherid (varchar): a unique identifier for each transaction, up to 10 digits.
* TrnDate (date): the date of the transaction.
* TrnTime (varchar): the time of the transaction in a 24-hour format, such as 123408 for 12:34:08.
* Amount (bigint): the amount of money involved in the transaction.
* SourceDep (int): the ID of the deposit from which the money was subtracted.
* DesDep (int): the ID of the deposit to which the money was added.
* Branch_id (int): the ID of the branch where the transaction took place.
* Trn_Desc (varchar): an optional description for the transaction.

### Deposit
* Dep_id (int): a unique identifier for each deposit.
* Dep_type (int): the code for the type of deposit.
* CID (int): the ID of the customer who opened the deposit.
* OpenDate (date): the date when the deposit was opened.
* Status (int): the code for the status of the deposit.

### Deposit_type
* Dep_type (int): the code for the type of deposit.
* Dep_typ_Desc (varchar): a description of the deposit type.

### Deposit_status
* Status (int): the code for the status of the deposit.
* Status_Desc (varchar): a description of the deposit status.

### Branch
* Branch_id (int): a unique identifier for each branch.
* Branch_name (varchar): the name of the branch.
* Branch_Add (varchar): the address of the branch.
* Branch_tel (varchar): the telephone number of the branch.

The project also uses functions to track the flow of money. A limited number of fake records are inserted in the tables of the database.

Apart from tracking the money flow, the project also has a view of customers that validates their national code to follow specific rules of national codes. (Without using functions)
