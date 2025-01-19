use project_copy_dummy;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                      /*PROCEDURE 1*/
delimiter //
CREATE PROCEDURE `delOrder`(
	in del_order_id int
)
BEGIN
    delete from orders
    where order_ID=del_order_id;
END //
delimiter ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                             
                                                         /*PROCEDURE 2*/
delimiter //
CREATE PROCEDURE get_sorted_payment_order(
	in payment ENUM ('MASTERCARD' , 'OCTOPUS' , 'ALIPAY')
)
BEGIN
	select * from orders where payment_method=payment;
END // 
delimiter ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                      /*PROCEDURE 3*/
delimiter //
CREATE PROCEDURE get_unfinish_order()
BEGIN
	select * from orders where done=false;
END //
delimiter ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
delimiter //
CREATE  PROCEDURE getOrderHistory()
BEGIN
	select * from orders where done=true;
END //
delimiter ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                      /*PROCEDURE 4*/
/*Set_Order*/
/*WHEN USER STARTS ORDERING*/
Delimiter // 
create procedure set_order(
in user_id int ,
in account_number char(22),
in payment_method ENUM ('MASTERCARD' , 'OCTOPUS' , 'ALIPAY')
)

Begin
 Declare order_amount int ; 
 Declare order_ID int ; 
 declare driver_ID int; 
 
 Select( ifnull(max(order_ID), 0) +1) into @order_ID 
 from orders;

 select d.driver_id into driver_ID
 from drivers d
 where d.idle = true
 ORDER BY rand()
 Limit 1;
 
 insert into orders(order_ID , user_id , account_number , driver_id , payment_method) 
 values
 (order_ID , user_id , account_number, driver_ID , payment_method) ;
 
END //
Delimiter ;
-- drop procedure set_order;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
								               	/*--WHEN USER STARTS ADDING DISHES ONE BY ONE*/
                                                    /*PROCEDURE 5*/
Delimiter // 
create procedure add_dishesToOrders( in order_ID int , in dish_ID int , 
in menu_ID int , in quantity int , in ratings int , in done boolean) 
Begin 
declare dish_price float;  declare curr_amt float; declare discount float ;

if(done = false) -- only do if order is not done yet, or until the user hit done button in  UI
then
insert into order_items(order_ID, quantity, menu_ID, dishID, dish_ratings) values
(order_ID , quantity, menu_ID , dish_ID , ratings) ;

select d.Dish_Price into dish_price from  dish d where d.dish_ID = dish_ID limit 1 ;

Select order_amount INTO curr_amt
FROM orders
WHERE orders.order_ID = order_ID
limit 1;
    
IF curr_amt IS NULL THEN
SET curr_amt = 0;
END IF;
set curr_amt =  curr_amt + (dish_price * quantity) ; /*Discounting acc to the user_Class*/

select discount_rate into discount
from user_class inner join users
on users.class = user_class.class 
where users.user_id = (select user_id from orders where orders.order_ID = order_id ) ;

update orders
set order_amount =  curr_amt - discount/100 * curr_amt  -- /*alternative: COALESCE(order_amount, 0)*/
where orders.order_ID = order_ID ;
END IF ;
END // 
Delimiter ;
 -- drop procedure add_dishesToOrders;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/





