use project_copy_dummy ; 


/*----------USER VIEW TABLES----------------*/

-- set foreign_key_checks = 0;
-- Drop Table if exists User_Class ;
CREATE TABLE IF NOT EXISTS User_Class(
class ENUM ('VIP' , 'STANDARD')  PRIMARY KEY ,
discount_rate float(10)
);

CREATE TABLE IF NOT EXISTS users (
    user_id int(8) auto_increment primary key,
    fname VARCHAR(50),
    lname VARCHAR(50),
    city VARCHAR(50),
    street VARCHAR(100),
    building varchar(100),
    floor varchar(10),
    email VARCHAR(100),
    class ENUM ('VIP' , 'STANDARD'),
    foreign key (class) references user_class(class) on delete cascade
);


-- Drop Table if exists Users;
-- CREATE TABLE IF NOT EXISTS Users(
-- f_name VARCHAR(50) NOT NULL,
-- l_name VARCHAR (50),
-- address VARCHAR(255) NOT NULL,
-- email VARCHAR(30) NOT NULL,
-- user_ID int(10) AUTO_INCREMENT PRIMARY KEY ,
-- class VARCHAR(50),
-- FOREIGN KEY(class) REFERENCES User_Class(class) ON DELETE CASCADE
-- ); 
 
/*Drop Table if exists LOGIN;*/
CREATE TABLE IF NOT EXISTS LOGIN(
user_ID INT(10),
FOREIGN KEY  (user_ID) REFERENCES Users(user_ID) ON DELETE CASCADE,
user_Name VARCHAR(50) NOT NULL,
passkey CHAR(50) NOT NULL, /*use SHA2 hashing algo during insertion*/
PRIMARY KEY (user_ID)
);

/*Drop Table if exists Payment_Method;*/
CREATE TABLE IF NOT EXISTS Payment_Method(
payment_method ENUM ('MASTERCARD' , 'OCTOPUS' , 'ALIPAY'),
user_ID INT(10),
FOREIGN KEY (user_ID) REFERENCES Users(user_ID) ON DELETE CASCADE,
account_number CHAR(22) NOT NULL UNIQUE,
PRIMARY KEY(payment_method, account_number) 
);

/*-----------------RESTAURANT VIEW-------------------*/

/*Drop Table if exists Restaurants ;*/
CREATE Table IF NOT EXISTS Restaurants(
restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
restaurant_name VARCHAR(30) NOT NULL UNIQUE,
restaurant_email VARCHAR(30)
);

/*One Restaurant/Brand has many Branches */
/*Drop Table if exists Branch ;*/
CREATE Table IF NOT EXISTS Branch(
branch_id INT NOT NULL,
restaurant_id int NOT NULL,
FOREIGN KEY(restaurant_id) references Restaurants(restaurant_id) ON DELETE CASCADE,
branch_address VARCHAR(100),
branch_phone int NOT NULL,
PRIMARY KEY(branch_id, restaurant_id)  
);

/*Each Branch of Each Restaurant has at most 3 Menu_ID type*/

/*Drop Table if exists Menu ;*/
CREATE Table IF NOT EXISTS Menu(
Menu_ID INT AUTO_INCREMENT PRIMARY KEY,
Menu_Type ENUM ('BREAKFAST' , 'LUNCH' , 'DINNER'),
Branch_ID INT,
restaurant_id INT,
FOREIGN KEY( branch_id ,restaurant_id) References Branch(branch_id, restaurant_id)
);

/* A dish is specifically owned by a Restaurant,
 and dishes of restaurants is same in all branches of a single restaurant
 but MENU in branches can be diff, while dishes are only divided*/
 
CREATE Table IF NOT EXISTS Dish(
Dish_ID INT auto_increment PRIMARY KEY ,
Dish_Price Decimal(10,2),
Dish_Name VARCHAR(45) NOT NULL,
Vegetarian BOOLEAN,
restaurant_id int,
Foreign KEY(restaurant_id) REFERENCES Restaurants(restaurant_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Menu_Dishes(
MenuID INT ,
Dish_ID INT,
FOREIGN KEY (MenuID) references Menu(Menu_ID),
FOREIGN KEY (Dish_ID) REFERENCES Dish(Dish_ID),
PRIMARY KEY(MenuID, Dish_ID)
);


/*---------- ORDER SECTION---------------------*/
set foreign_key_checks =1;
drop table orders;
CREATE TABLE IF NOT EXISTS Orders(
order_ID INT Auto_increment PRIMARY KEY,
user_ID int NOT NULL,
FOREIGN KEY (user_ID) references Users(user_ID) ON DELETE CASCADE,
Order_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
account_number char(22) NOT NULL,
driver_id int ,
Foreign key(driver_id) references drivers(driver_id),
Payment_Method ENUM ('MASTERCARD' , 'OCTOPUS' , 'ALIPAY'),
FOREIGN KEY (Payment_method ,account_number) REFERENCES Payment_Method(Payment_Method, account_number) ON DELETE CASCADE,
order_amount float DEFAULT 0,
done boolean default false
);

CREATE TABLE IF NOT EXISTS Order_Items( /*WEAK ENTITY*/
order_ID INT NOT NULL,
FOREIGN KEY (order_ID) references Orders(Order_ID)ON DELETE CASCADE ,
quantity int NOT NULL,
dishID INT,
menu_ID INT, 
foreign key (dishID , menu_ID) references menu_dishes(Dish_ID, MenuID),
Dish_Ratings INT DEFAULT NULL
);

-- drop table order_items;


/*----------DELIEVERY SECTION-----------*/

CREATE TABLE IF NOT EXISTS Drivers (
Driver_ID INT auto_increment primary key,
driver_rating float default 0,
Join_Date DATE,
fName VARCHAR(20) NOT NULL,
lName VARCHAR(10) NOT NULL,
contact_number VARCHAR(15), 
CHECK (CHAR_LENGTH(contact_number)= 8),
serving_area VARCHAR(60) NOT NULL,
idle boolean,
license_no INT unique NOT NULL
);
-- drop table drivers;






