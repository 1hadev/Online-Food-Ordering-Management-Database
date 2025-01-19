use project_copy_dummy;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                /*PROCEDURE 1*/
/*When driver AND customer logical AND will set done = true we'll update the order 'done' to true*/
/*this is to say I delievered and I recieved the delivery*/ 

delimiter //
create procedure marker_order_done(
in order_ID int 
)
Begin
update orders
set done = true 
where orders.order_ID = order_ID ; 

END // 
Delimiter ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/ 
                                                      /*PROCEDURE 2*/
/*Lets user add some ratings for certain driver who delivered an order*/
delimiter //
create procedure rate_driver( 
in order_id int ,
in rating float(10) 
)
begin

if ((select done from orders where orders.order_id = order_ID) = true)
then  
update orders
set orders.driver_rating  = rating 
where orders.order_id = order_ID ;
call update_driver_rating( @order_id);
end if ;

end //
delimiter ; 

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                      /*PROCEDURE 3*/
/*Change driver's aggregate ratings*/ -- call update_driver_rating(); make this
delimiter //
CREATE PROCEDURE update_driver_rating(
in orderid int 
)
begin 
 declare new_rating float ;
 declare d_ID int; 
 
 select driver_ID into d_ID
 from orders
 where orders.order_ID = orderid ; 

select avg(driver_rating)  into new_rating
from orders 
where  orders.done is true 
group by (driver_id) having driver_id =d_ID ;

update drivers
set drivers.driver_rating = new_rating 
where drivers.Driver_ID = d_ID; 
end // 
delimiter ;

-- drop procedure update_driver_rating ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                                       /*PROCEDURE 4*/
/*for drivers*/
delimiter // 
CREATE PROCEDURE makeAvailable(
in driver_ID int 
)
begin 
update drivers
set idle = false 
where drivers.driver_ID = driver_ID ; 
END // 
Delimiter ;

delimiter // 
CREATE PROCEDURE makeIdle (
in driver_ID int
)
begin 
update drivers
set idle = true 
where drivers.driver_ID = driver_ID ; 
END // 
Delimiter ;


