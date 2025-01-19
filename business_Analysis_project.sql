use project_copy_dummy ; 
 
                                                                  /*BUSINESS ANALYSIS REPORT*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 
-- Select the restaurant with highest numbers of orders
select count(order_items.order_id) as 'Highest No. of Orders',  restaurants.Restaurant_name, restaurant_email 
from 
restaurants inner join dish
on dish.restaurant_id = restaurants.restaurant_id 
inner join order_items 
on dish.dish_ID = order_items.dishid 
group by(restaurants.restaurant_id); 

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 -- Select the restaurant with highest revenue(in dollars)
 select sum(dish.dish_price * order_items.quantity ) as 'Reveneue' , restaurants.restaurant_name
 from 
 restaurants inner join dish
 on dish.restaurant_id  =  restaurants.restaurant_id
 left join order_items
 on dish.dish_ID = order_items.dishid
 group by(restaurants.restaurant_name);
 
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 -- Select the no. of delivery each driver has done, to maybe give warning to low perforer*/
 select count(orders.driver_ID) , drivers.fName , drivers.lName
 from orders right join drivers
 on orders.driver_ID = drivers.driver_ID
 group by (fName),
 (lName)
 order by(count(orders.driver_ID)) asc;
 
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- This it to basically Filter out Worst Rated Dishes so that restaurant might improve their taste
select ifnull(avg(dish_ratings), 0) as 'Ratings'  , dish_ID, dish_name, restaurant_name  -- non rated dishes are assigned 0 because it depicts customer dissatisfaction
from order_items 
left join dish
on order_items.dishID = dish.dish_ID
inner join restaurants
on dish.restaurant_id = restaurants.restaurant_id
group by(dish_ID) ,(dish_name) , (restaurant_name) 
order by(avg(dish_ratings)) asc limit 3 ; 

 /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- This is to figure out demographic area and the order count made from that region's user*/
select count(city) as 'No of orders' , city from 
users  inner join orders
on users.user_id = orders.user_id
group by (city);

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- This is to show lowest rated driver
 select driver_rating, fname, lname
 from drivers
 where exists ( select driver_id from orders where drivers.driver_id = orders.driver_id) /* this is to make sure it doesnt show the rating 0 of a driver who has not yet delivered any order*/
 order by(driver_rating) asc;
 










 
 
 
 
