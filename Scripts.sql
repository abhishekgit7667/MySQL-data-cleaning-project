
select * from ecom_raw;

create table ecom_clean as select * from ecom_raw; 
# created new table ecom_clean for cleaning because raw data always untouched
set sql_safe_updates =0;
 # safe mode of beaacuse query can't run without where clause

update ecom_clean set customer_name =trim(customer_name),city = trim(city);
 # i cleaned unwanted spaces in text
select customer_name, city from ecom_clean;# show data

# standarized payment status (set Paid instead of (paid and completed))
update ecom_clean set payment_status = "Paid"
where lower(payment_status) In ("paid","completed");

select distinct payment_status from ecom_clean;# show only what i updated in payment section 

# remove rows where email is null ;
select email, email is null is_null, email='' as is_empty from ecom_clean;
delete from ecom_clean where email ='';
select email from ecom_clean;

# CLEAN AMOUNT COLUMN
UPDATE ecom_clean SET amount = REPLACE(amount,'rs','') where amount like '%rs%'  ;

#remove null & negative
delete from ecom_clean where amount is null or amount <=0 ;

#convert to decimal
select amount from ecom_clean;
alter table ecom_clean modify amount decimal(10,2);
select *from ecom_clean;

# remove duplicate 
delete t1 from ecom_clean t1 join ecom_clean t2 on t1.order_id>t2.order_id and t1.customer_name = t2.customer_name and t1.amount =t2.amount;

# fix date format
select distinct order_date from ecom_clean;
set sql_mode ='';# for remove strict mode 
update ecom_clean set order_date= trim(order_date);
alter table ecom_clean add order_date_new date;
update ecom_clean set order_date_new =
case 
when substring(order_date,3,1)='-'
and substring(order_date,6,1)='-'
then date(concat(substring(order_date,7,4),'-',
substring(order_date,4,2),'-',
substring(order_date,1,2),'-'))

else date (replace(order_date,'/','-'))
end;
select order_date,order_date_new from ecom_clean;
show warnings;
select * from ecom_clean;
select *from ecom_raw;











