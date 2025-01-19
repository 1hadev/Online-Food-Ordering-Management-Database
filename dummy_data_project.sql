use project_copy_dummy ;


                                        /*------------------RESTAURANT SECTION---------------------------*/
insert into Restaurants (restaurant_name, restaurant_email) values
('McDonalds HK', 'info@mcdonalds.hk'), ('Burger King HK', 'contact@burgerking.hk'), ('Subway HK', 'support@subway.hk'), ('Pizza Hut HK', 'help@pizzahut.hk'), ('Starbucks HK', 'service@starbucks.hk'),
('Wendys HK', 'info@wendys.hk'), ('Dominos Pizza HK', 'contact@dominos.hk'), ('KFC HK', 'info@kfc.hk'), ('Pacific Coffee', 'info@pacificcoffee.hk'), ('Dimsum House', 'contact@dimsumhouse.hk'),
('Tsui Wah Restaurant', 'info@tsuiwah.hk'), ('Tim Ho Wan', 'contact@timhowan.hk');

                   /*---------------------------------BRANCH SECTION---------------------------------*/
insert into Branch (branch_id, restaurant_id, branch_address, branch_phone) VALUES
(1, 1, '123 Nathan Road, Kowloon', 52669796), (1, 2, '456 Queen\'s Road, Hong Kong', 1234568), (2, 2, '789 Tsim Sha Tsui, Kowloon',   1234569), (1, 3, '101 Causeway Bay, HK', 1234570),
(1, 4, '202 Central, Hong Kong',1234571), (2, 4, '303 Mong Kok, Kowloon', 1234572), (3, 4, '404 Sha Tin, NT', 1234573), (1, 5, '505 Wan Chai, HK', 1234574), (2, 5, '606 Tuen Mun, NT', 1234575),
(1, 6, '707 Kwai Fong, NT', 234576), (1, 7, '808 Kowloon Bay, Kowloon', 1234577), (2, 7, '909 North Point, HK', 1234578), (3, 7, '1010 Yuen Long, NT', 1234579), (1, 8, '1111 Tsuen Wan, NT', 1234580),
(2, 8, '1212 Prince Edward, Kowloon', 1234581), (1, 9, '1313 Tsim Sha Tsui, Kowloon', 1234582), (1, 10, '1414 Sha Tin, NT', 1234583), (2, 10, '1515 Central, HK', 234584),
(1, 11, '1616 Mong Kok, Kowloon', 1234585), (2, 11, '1717 Wan Chai, HK', 1234586), (3, 11, '1818 Kowloon Bay, Kowloon', 1234587), (1, 12, '1919 Yuen Long, NT', 1234588), (2, 12, '2020 Causeway Bay, HK', 234589);

                             /*---------------------------------ADDING DISH SECTION --------------------------------- */
-- McDonalds HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(10.99, 'Big Mac', 0, 1), (8.50, 'Fries', 1, 1), (5.99, 'McChicken Nuggets', 0, 1), (12.99, 'Filet-O-Fish', 0, 1), (20.00, 'McVeggie Burger', 1, 1), (15.50, 'Double Cheeseburger', 0, 1), 
(6.50, 'Apple Pie', 1, 1), (7.75, 'Sundae', 1, 1);

-- Burger King HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(12.75, 'Whopper', 0, 2), (10.00, 'Veggie King', 1, 2), (6.50, 'Chicken Fries', 0, 2), (7.25, 'Onion Rings', 1, 2), (9.99, 'Bacon Double Cheeseburger', 0, 2), (11.50, 'Grilled Chicken Sandwich', 0, 2),
(5.75, 'Soft Serve Cone', 1, 2), (8.25, 'French Toast Sticks', 1, 2);

-- Subway HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(7.50, 'Veggie Delight Sub', 1, 3), (8.75, 'Italian BMT Sub', 0, 3), (9.50, 'Chicken Teriyaki Sub', 0, 3), (6.99, 'Tuna Salad', 0, 3), (5.50, 'Subway Cookies', 1, 3),
(10.25, 'Meatball Marinara Sub', 0, 3), (6.50, 'Egg Mayo Sandwich', 1, 3), (7.00, 'Chocolate Chip Muffin', 1, 3);

-- Pizza Hut HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(20.00, 'Pepperoni Pizza', 0, 4), (18.50, 'Margherita Pizza', 1, 4), (25.00, 'BBQ Chicken Pizza', 0, 4), (16.75, 'Garlic Bread', 1, 4), (22.50, 'Pasta Alfredo', 1, 4),
(30.00, 'Supreme Pizza', 0, 4), (12.99, 'Cheesy Garlic Sticks', 1, 4), (15.00, 'Tandoori Paneer Pizza', 1, 4);

-- Starbucks HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(8.50, 'Espresso', 1, 5), (12.00, 'Caramel Macchiato', 1, 5), (10.75, 'Latte', 1, 5), (6.99, 'Blueberry Muffin', 1, 5), (7.25, 'Chocolate Croissant', 1, 5), (9.50, 'Cold Brew', 1, 5),
(5.99, 'Banana Bread', 1, 5), (8.25, 'Pumpkin Spice Latte', 1, 5);

-- Wendy's HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(13.99, 'Baconator', 0, 6), (10.25, 'Spicy Chicken Sandwich', 0, 6), (8.99, 'Frosty', 1, 6), (6.50, 'Crispy Fries', 1, 6), (11.75, 'Asiago Ranch Club', 0, 6), (9.50, 'Garden Salad', 1, 6),
(7.75, 'Baked Potato', 1, 6), (10.00, 'Classic Chicken Wrap', 0, 6);

-- Domino's Pizza HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(18.00, 'Pepperoni Feast', 0, 7), (16.00, 'Veggie Supreme', 1, 7), (20.50, 'Chicken Dominator', 0, 7), (12.50, 'Cheese Sticks', 1, 7), (15.25, 'Hawaiian Pizza', 0, 7), (22.00, 'Extravaganza Pizza', 0, 7),
(8.50, 'Stuffed Garlic Bread', 1, 7), (9.99, 'Brownie Squares', 1, 7);

-- KFC HK
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(14.50, 'Original Recipe Chicken', 0, 8), (9.99, 'Popcorn Chicken', 0, 8), (7.50, 'Mashed Potatoes', 1, 8), (6.75, 'Coleslaw', 1, 8), (18.00, 'Zinger Burger', 0, 8),
(12.00, 'Crispy Strips', 0, 8), (10.00, 'Corn on the Cob', 1, 8), (8.25, 'Chocolate Lava Cake', 1, 8);

-- Pacific Coffee
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(6.75, 'Americano', 1, 9), (9.25, 'Caffe Latte', 1, 9), (8.50, 'Vanilla Muffin', 1, 9), (7.99, 'Cinnamon Roll', 1, 9), (11.50, 'Iced Mocha', 1, 9),(5.75, 'Lemon Tart', 1, 9),
(6.50, 'Hot Chocolate', 1, 9), (8.00, 'Chai Latte', 1, 9);

-- Dimsum House
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(15.00, 'Steamed Pork Dumplings', 0, 10), (18.00, 'BBQ Pork Buns', 0, 10), (10.75, 'Vegetable Spring Rolls', 1, 10), (8.50, 'Fried Tofu', 1, 10), (12.25, 'Egg Tart', 1, 10),
(20.00, 'Shrimp Siu Mai', 0, 10), (16.50, 'Lotus Leaf Rice', 0, 10), (14.75, 'Custard Bun', 1, 10);

-- Tsui Wah Restaurant
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(25.00, 'Hainanese Chicken Rice', 0, 11), (20.75, 'Fried Beef Hor Fun', 0, 11), (18.50, 'Vegetable Stir Fry', 1, 11), (14.00, 'Pineapple Bun', 1, 11), (22.50, 'Shrimp Fried Rice', 0, 11),
(16.75, 'Beef Brisket Noodles', 0, 11), (12.50, 'Milk Tea', 1, 11), (19.00, 'Seafood Fried Noodles', 0, 11);

-- Tim Ho Wan
INSERT INTO dish (dish_price, dish_name, vegetarian, restaurant_id) VALUES
(15.00, 'BBQ Pork Buns', 0, 12),(12.50, 'Pan Fried Turnip Cake', 1, 12),(18.00, 'Steamed Egg Cake', 1, 12),(20.50, 'Shrimp Dumplings', 0, 12),(14.75, 'Beef Rice Rolls', 0, 12),(10.25, 'Vegetarian Dumplings', 1, 12),
(11.50, 'Sweet Lotus Buns', 1, 12), (17.00, 'Pork Ribs in Black Bean Sauce', 0, 12);


                                                /*-----------------MENU SECTION-------------------*/
INSERT INTO Menu (menu_type, branch_id, restaurant_id) VALUES 
('BREAKFAST', 1, 1), ('LUNCH', 1, 1), ('DINNER', 1, 1),  ('BREAKFAST', 2, 1), ('LUNCH', 2, 1), ('DINNER', 2, 1),('BREAKFAST', 1, 2), ('LUNCH', 1, 2), ('DINNER', 1, 2), 
('BREAKFAST', 2, 2), ('LUNCH', 2, 2), ('DINNER', 2, 2), ('BREAKFAST', 1, 3), ('LUNCH', 1, 3),  ('BREAKFAST', 1, 4), ('LUNCH', 1, 4),   ('BREAKFAST', 2, 4), ('LUNCH', 2, 4),     
('BREAKFAST', 3, 4), ('LUNCH', 3, 4), ('BREAKFAST', 1, 5), ('LUNCH', 1, 5), ('BREAKFAST', 2, 5), ('LUNCH', 2, 5), ('BREAKFAST', 1, 6), ('LUNCH', 1, 6),
('BREAKFAST', 1, 7), ('LUNCH', 1, 7), ('DINNER', 1, 7), ('BREAKFAST', 2, 7), ('LUNCH', 2, 7), ('BREAKFAST', 3, 7), ('LUNCH', 3, 7), ('DINNER', 3, 7),
('BREAKFAST', 1, 8), ('LUNCH', 1, 8), ('DINNER', 1, 8), ('BREAKFAST', 2, 8), ('LUNCH', 2, 8), ('BREAKFAST', 1, 9), ('LUNCH', 1, 9), ('DINNER', 1,9),('BREAKFAST',2 ,9) ,
('LUNCH' ,2 ,9) , ('BREAKFAST' ,1 ,10) ,('LUNCH' ,1 ,10) , ('DINNER' ,1 ,10) ,('BREAKFAST' ,2 ,10) ,('LUNCH' ,2 ,10) ,('BREAKFAST' ,1 ,11) ,('LUNCH' ,1 ,11) ,
('DINNER' ,1 ,11) , ('BREAKFAST' ,2 ,11) ,('DINNER' ,2 ,11) , ('LUNCH' ,3 ,11) ,('BREAKFAST' ,3 ,11) , ('LUNCH' ,3 ,11) , ('LUNCH' ,1 ,12) ,('DINNER' ,1 ,12) ,('BREAKFAST' ,2 ,12) ,
('LUNCH' ,2 ,12);

                                     /*-------------------------------------MENU_DISH SECTION-------------------------*/
/*A insertion technique where there is already two elements fetched in databse, I used query operation to fill in 5 dishes to a menu */
INSERT INTO Menu_Dishes (MenuID, Dish_ID)
SELECT MenuID, Dish_ID
FROM (
    SELECT 
        m.Menu_ID AS MenuID, 
        d.Dish_ID, 
        ROW_NUMBER() OVER (PARTITION BY m.Menu_ID ORDER BY RAND()) AS row_num /*Got the idea online*/
    FROM Menu m
    JOIN Dish d ON m.Restaurant_ID = d.Restaurant_ID
) AS ranked_dishes
WHERE row_num <= 5; 

                                        /*----------------------USER_DUMMY DATA-----------------------------*/
                                        
/*This data is generated using OPENAI API for intelligent dataset generation, we donot own this data and are only using to test our design, accessible at: www.openAI.com*/
/*Tried using Mockaroo but couldnt generate realistic data based on HK*/

insert into User_Class (class, discount_rate) VALUES
('VIP', 15.0),
('STANDARD', 5.0);

insert into users (fname, lname, city, street, building, floor, email, class) VALUES
('John', 'Chan', 'Tsim Sha Tsui', '123 Nathan Road', 'Block A', '5', 'john.chan@example.com', 'VIP'),
('Sarah', 'Lee', 'Central', '456 Queen\'s Road', 'Building B', '3', 'sarah.lee@example.com', 'STANDARD'),
('Michael', 'Wong', 'Mong Kok', '789 Tsim Sha Tsui', 'Tower C', '10', 'michael.wong@example.com', 'VIP'),
('Emily', 'Cheng', 'Causeway Bay', '101 Causeway Bay', 'Flat D', '8', 'emily.cheng@example.com', 'STANDARD'),
('David', 'Lam', 'Wan Chai', '202 Central', 'Office 1', '12', 'david.lam@example.com', 'VIP'),
('Jessica', 'Ho', 'Mong Kok', '303 Mong Kok', 'Block E', '6', 'jessica.ho@example.com', 'STANDARD'),
('Chris', 'Tsang', 'Sha Tin', '404 Sha Tin', 'House F', '1', 'chris.tsang@example.com', 'VIP'),
('Sophia', 'Yau', 'Wan Chai', '505 Wan Chai', 'Unit G', '9', 'sophia.yau@example.com', 'STANDARD'),
('James', 'Lau', 'Tuen Mun', '606 Tuen Mun', 'Building H', '4', 'james.lau@example.com', 'VIP'),
('Anna', 'Cheung', 'Kwai Fong', '707 Kwai Fong', 'Block I', '7', 'anna.cheung@example.com', 'STANDARD'),
('Peter', 'Kwok', 'Kowloon Bay', '808 Kowloon Bay', 'Building J', '3', 'peter.kwok@example.com', 'VIP'),
('Karen', 'Leung', 'North Point', '909 North Point', 'Flat K', '2', 'karen.leung@example.com', 'STANDARD'),
('Tony', 'Ng', 'Yuen Long', '1010 Yuen Long', 'House L', '5', 'tony.ng@example.com', 'VIP'),
('Emily', 'Lui', 'Tsuen Wan', '1111 Tsuen Wan', 'Building M', '4', 'emily.lui@example.com', 'STANDARD'),
('Jason', 'Ip', 'Prince Edward', '1212 Prince Edward', 'Unit N', '3', 'jason.ip@example.com', 'VIP'),
('Amy', 'Tam', 'Tsim Sha Tsui', '1313 Tsim Sha Tsui', 'Block O', '8', 'amy.tam@example.com', 'STANDARD'),
('Ben', 'Au', 'Sha Tin', '1414 Sha Tin', 'Flat P', '6', 'ben.au@example.com', 'VIP'),
('Olivia', 'Poon', 'Central', '1515 Central', 'Building Q', '2', 'olivia.poon@example.com', 'STANDARD'),
('Leo', 'Chow', 'Mong Kok', '1616 Mong Kok', 'Flat R', '5', 'leo.chow@example.com', 'VIP'),
('Mandy', 'Fung', 'Wan Chai', '1717 Wan Chai', 'Building S', '7', 'mandy.fung@example.com', 'STANDARD'),
('Vincent', 'Yip', 'Kowloon Bay', '1818 Kowloon Bay', 'Block T', '2', 'vincent.yip@example.com', 'VIP'),
('Zoe', 'Mak', 'Yuen Long', '1919 Yuen Long', 'House U', '1', 'zoe.mak@example.com', 'STANDARD'),
('Luke', 'Yeung', 'Causeway Bay', '2020 Causeway Bay', 'Flat V', '6', 'luke.yeung@example.com', 'VIP');

insert into payment_method (user_ID , payment_method , account_number) values
(1, 'Mastercard', '4111111111111111'), (2, 'Alipay', '9876543210123456'), (3, 'Octopus', '123456789123'), (4, 'Mastercard', '4222222222222222'), (5, 'Alipay', '9876543210456789'),
(6, 'Octopus', '987654321987'), (7, 'Mastercard', '4333333333333333'), (8, 'Alipay', '9876543210789012'), (9, 'Octopus', '456789123456'), (10, 'Mastercard', '4444444444444444'),
(11, 'Alipay', '9876543210112233'), (12, 'Octopus', '321654987321'), (13, 'Mastercard', '4555555555555555'), (14, 'Alipay', '9876543210998765'), (15, 'Octopus', '147258369147'),
(16, 'Mastercard', '4666666666666666'), (17, 'Alipay', '9876543210543210'), (18, 'Octopus', '963852741963'), (19, 'Mastercard', '4777777777777777'), (20, 'Alipay', '9876543210212345'),
(21, 'Octopus', '741852963741'), (22, 'Mastercard', '4888888888888888'), (23, 'Alipay', '9876543210678901'), (24, 'Octopus', '852963741852'),
(1, 'Alipay', '9876543210222222'), (3, 'Mastercard', '4333444433334444'), (5, 'Octopus', '123000987654'), (6, 'Mastercard', '5222333344445555');


                 /*------------------------------------------Driver SECTION-------------------------------------------------------------------------*/
insert into drivers (join_date, fName, lName, contact_number, serving_area, idle, license_no) values
( '2023-01-15', 'Chan', 'Tak-Wai', '12345678', 'Tsim Sha Tsui', true, 987654321),
( '2022-06-22', 'Li', 'Ming', '23456789', 'Causeway Bay', false, 123456789),
( '2021-11-30', 'Wong', 'Chun-Ho', '34567890', 'Mong Kok', true, 234567890),
( '2023-03-14', 'Ng', 'Pui-Fong', '45678901', 'Kowloon Bay', true, 345678901),
( '2022-07-25', 'Leung', 'Ka-Yan', '56789012', 'Wan Chai', false, 456789012),
('2021-08-10', 'Cheung', 'Ho-Kwan', '67890123', 'Sha Tin', true, 567890123);


				  /*------------------------------Order Section-------------------------*/
insert into Orders (user_ID, account_number, driver_id, Payment_Method, order_amount, done) VALUES
( 1, '4111111111111111', 1, 'MASTERCARD', 100, FALSE),
( 2, '9876543210123456', 2, 'ALIPAY', 200, TRUE),
( 1, '4333444433334444', 3, 'MASTERCARD', 150, FALSE);

INSERT INTO Order_Items (order_ID, quantity, dishID, menu_ID, Dish_Ratings)
VALUES
(1, 2, 1, 1, 3),  
(1, 1, 3, 1, 4),  
(2, 3, 7, 1, 4),  
(3, 1, 6, 2, NULL); 







