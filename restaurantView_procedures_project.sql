use project_copy_dummy 

                          /*--------------------------FOR RESTAURANT AND OUR COMPANY INTERACTION----------------------------------------*/
 /*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                                -- PROCEDURE 1
/* IF THE DELIVERY MGMT COMPANY NEEDED TO ADD MORE RESTAURANTS TO ITS DATABASE */ 
 Delimiter //
Create Procedure insertRestaurant(
  in restaurant_name VARCHAR(100) ,
  in restaurant_email VARCHAR(1000)
  ) 
  Begin 
  insert into Restaurants (restaurant_name, restaurant_email) values 
  (restaurant_name , restaurant_email) ;
  End //
  Delimiter ;
 /*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                             -- PROCEDURE 2
/* IF THE RESTAURANTS WANTED TO ADD MORE BRANCHES WHERE THEY SERVE ONLINE FOOD ORDERING*/
Delimiter //
Create Procedure insertBranches (
in restaurant_name VARCHAR(100) ,
in branch_address VARCHAR(100),
in branch_phone int
)
Begin 
Declare rest_id int ; 
Declare latest_branch_id int ;
 
-- Finding Specific REST ID
select distinct restaurant_id into rest_id
from restaurants r 
where r.restaurant_name = restaurant_name ;

-- Finding Specific Branch_ID
select MAX(branch_id) into latest_branch_id
    FROM Branch r
    group by (restaurant_id) having r.restaurant_id = rest_id  ;

-- If there is already no branch for a restaurant in branch table, then the first branch will be set to 1
select if(latest_branch_id  IS null , 1, latest_branch_id+1) into latest_branch_id ;

-- Finally Insert the Branch
insert into branch(branch_id , restaurant_id, branch_address , branch_phone) values 
(latest_branch_id  , rest_id , branch_address, branch_phone) ; 
END // 
Delimiter  ;

-- Can add like this this procedure auto detects the last branch_id and restaurant_id from trademarked restaurant_name
call insertBranches('McDonalds HK' , ' Tai Wai, 2/F, The Wai ' , 88444488) ;
call insertBranches('Pacific Coffee' , 'Central, 123 Street' , 48221023);

 /*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                           -- PROCEDURE 3
-- Filter Restaurants and their branches by Address
-- drop Procedure FilterbyCity
Delimiter // 
Create Procedure FilterbyCity(
 in city varchar(50) 
)
Begin 
Select  concat (r.restaurant_name , " on " , b.branch_address) as "Restaurants Close To You" 
from restaurants r inner join branch b 
on b.restaurant_id  = r.restaurant_id  
where branch_address like concat( '%', city, '%') ;
End // 

Delimiter ;

-- CALL 
/*Test Demonstration(WORKING CONDITION)*/
call FilterbyCity('Tai Wai');
call FilterbyCity('Mong Kok');
call FilterbyCity('Tsuen Wan');

 /*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                          -- PROCEDURE 4
/*Make functions for accessing rest_id , menu_id and call it inside procedureI(another alternative)*/
-- FILTER MENU BY SPECIFIC BRANCH OF A RESTAURANT AND TIME ACCESSED AUTOMATED.
Delimiter //
Create Procedure FilterDishesbyMenu(
in access_time time ,
in city VARCHAR(50),
in restaurant VARCHAR(50)
)
Begin 
Declare meal_type VARCHAR(50) ; Declare Bid int ; Declare Rid int ; Declare Mid int ;
Select restaurant_id into Rid
from restaurants
where lower(restaurant_name) like lower(restaurant) ; 

Select branch_id into Bid 
from branch
where restaurant_id = Rid AND branch_address like (concat('%', city , '%')) ;

IF(access_time between '06:00:00' AND '11:59:59') THEN SET meal_type = 'BREAKFAST' ; 
ELSEIF( access_time between '12:00:00' AND '17:59:59') THEN SET meal_type = 'LUNCH' ; 
ELSE SET meal_type = 'DINNER' ; 
END IF; 

Select Menu_ID into Mid 
from Menu 
where restaurant_id = Rid  AND branch_id = Bid  AND lower(menu_type) like lower(meal_type) ;

Select Dish_Name, Dish_Price, Vegetarian
from menu_dishes m  inner join dish d
on m.Dish_ID = d.Dish_ID
where m.MenuID = Mid ;

END //
delimiter ;
  Call FilterDishesbyMenu(current_timestamp() ,'Tai Wai' , 'McDonalds HK' );
  Call FilterDishesbyMenu(current_timestamp() ,'Tsuen Wan' , 'KFC HK' );
  /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                              -- PROCEDURE 5
/*Sort by Price in a City's Restaurant*/
-- 
Delimiter // 
Create procedure SortbyPrice (
in city VARCHAR(50),
in restaurant VARCHAR(50)
)
Begin 
Select distinct dish_name , dish_price 
from dish inner join
menu_dishes on dish.Dish_ID  = menu_dishes.Dish_ID 
where dish.restaurant_id  = (select restaurant_id from restaurants where restaurant_name like concat('%', restaurant, '%'))
AND   menu_dishes.MenuID in ( 
                             select MenuID from menu 
                             where menu.Branch_ID = 
                                (select branch_id from branch 
                                 where branch.branch_address like concat('%' , city , '%')
								)
							) 
order by  Dish_Price desc;

END // 
Delimiter ;

-- CALL 5
call SortbyPrice('Tai Wai', 'McDonalds');

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                              -- PROCEDURE 6
	/* FIND VEG RESTAURANT IN A CITY */

Delimiter // 
CREATE PROCEDURE `findVegRestaurant`(
in city varchar(50) 
)
Begin 
Select restaurant_name , dish_name
from restaurants inner join dish
on restaurants.restaurant_id = dish.restaurant_id
inner join branch on branch.restaurant_id = dish.restaurant_id
where Vegetarian = true
and branch_address like concat('%' , city , '%') ; 
End // 
Delimiter ; 

-- Call 
Call findVegRestaurant('Tai Wai');
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/







