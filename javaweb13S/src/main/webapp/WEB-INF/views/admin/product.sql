create table topCategory (
	idx int not null auto_increment primary key,
	categoryCode char(4) not null unique key,
	categoryName varchar(20) not null
);

create table product (
	idx int not null auto_increment primary key,
	categoryCode char(4) not null,
	productCode int not null,
	productName varchar(100) not null,
	price int not null,
	discountRate int default 0,
	age char(5) not null,
	partsNumber int default 0,
	point int not null,
	stock int not null,
	regDate datetime default now(),
	switchItem int not null,
	fName varchar(200) not null,
	content text not null,
	unique key(productCode),
	foreign key(categoryCode) references topCategory(categoryCode)
);

create table watchList (
	uid varchar(20) not null,
	productIdx int not null,
	productName varchar(100) not null,
	price int not null,
	discountRate int default 0,
	fName varchar(200) not null,
	foreign key(productIdx) references product(idx)
);

create table cart (
	idx int not null auto_increment primary key,
	uid varchar(20) not null,
	productIdx int not null,
	productName varchar(100) not null,
	price int not null,
	point int not null,
	quantity int not null,
	fName varchar(200) not null,
	foreign key(productIdx) references product(idx)
);

create table productImg (
	productCode int not null,
	fName varchar(200) not null,
	foreign key(productCode) references product(productCode)
);

create table productVideo (
	productCode int not null,
	fName varchar(200) not null,
	foreign key(productCode) references product(productCode)
);


create table QnA (
	idx int not null auto_increment,
	uid varchar(20) not null,
	productIdx int not null,
	productName varchar(100) not null,
	content text not null,
	regDate datetime default now(),
	answerSW int default 0,
	lockSW int not null,
	hostIP varchar(50) not null,
	fName varchar(200) not null,
	primary key(idx),
	foreign key(productIdx) references product(idx)
);

create table QnAReply (
	idx int not null auto_increment,
	productIdx int not null,
	QnAIdx int not null,
	uid varchar(20) not null,
	regDate datetime default now(),
	content text not null,
	primary key(idx),
	foreign key(QnAIdx) references QnA(idx)
	on update cascade
);

create table storeMap (
	idx int not null auto_increment primary key,
	storeName varchar(10) not null,
	storeLocation varchar(50) not null,
	storeCoords varchar(100) not null,
	storeTel varchar(15) not null,
	content text not null
);

create table review (
	idx int not null auto_increment,
	uid varchar(20) not null,
	productIdx int not null,
	productName varchar(100) not null,
	content text not null,
	evaluateMain int not null,
	evaluateSub1 int not null,
	evaluateSub2 int not null,
	evaluateSub3 int not null,
	regDate datetime default now(),
	fName varchar(200) default '0',
	hostIP varchar(50) not null,
	randomNum int not null,
	primary key(idx),
	foreign key(productIdx) references product(idx)
);

create table productOrder (
	idx int not null auto_increment primary key,
	merchant_uid varchar(50) not null,
	uid varchar(20) not null,
	productIdx int not null,
	productName varchar(100) not null,
	price int not null,
	point int not null,
	quantity int not null,
	fName varchar(200) not null,
	buyer_name varchar(20) not null,
	buyer_email varchar(40) not null,
	buyer_tel varchar(20) not null,
	buyer_addr varchar(100) not null,
	buyer_postcode varchar(10) not null,
	amount int not null,
	pointUsage int not null,
	memo text not null,
	orderSW int default 0,
	payment_date datetime default now()
);


drop table product;
drop table topCategory;
drop table watchList;
drop table cart;

drop table QnA;
drop table QnAReply;
drop table review;
drop table productOrder;

select *,price*(1-discountRate/100) as productDiscountPrice from product where idx = '1'; 
select * from cart where productidx = '125' and uid = 'admin';
select * from cart where uid = 'admin';
select * from product <if test='searchItem != ""'>
        where ${searchSw} like CONCAT('%',#{searchItem},'%')</if> order by <if test=''>idx desc
update cart set quantity = quantity + 1 where productidx = '125' and uid = 'admin';
update cart set quantity = quantity + 1, price = price + (1*3000) where productidx = '125' and uid = 'admin';

select count(*) as cntReview, round(avg(evaluateMain),1) as avgMain, round(avg(evaluateSub1),1) as avgSub1, round(avg(evaluateSub2),1) as avgSub2, round(avg(evaluateSub3),1) as avgSub3 from review where productIdx = 125;

select merchant_uid, count(merchant_uid) as merchant_uidCnt from productOrder where uid = 'admin' group by merchant_uid;

select * from productorder where uid = 'admin' order by idx desc;

SELECT *, ROW_NUMBER() OVER(PARTITION BY merchant_uid ORDER BY price) AS rank from productorder
--  FROM productOrder WHERE job IN ('MANAGER', 'SALESMAN')
-- ORDER BY job

SELECT *, (SELECT COUNT(*) FROM productorder AS po WHERE po.merchant_uid = p.merchant_uid AND po.price <= p.price) AS rank FROM productorder as p where uid = 'admin' order by idx desc;
select merchant_uid, count(merchant_uid) as merchant_uidCnt ,(select sum(price) from productorder as po where po.merchant_uid = p.merchant_uid) as totalPrice from productorder as p where uid = 'admin' group by merchant_uid order by idx desc;
SELECT *, (SELECT COUNT(*) FROM productorder AS po WHERE po.merchant_uid = p.merchant_uid AND po.price <= p.price) AS rank FROM productorder AS p;
select merchant_uid, count(merchant_uid) as merchant_uidCnt from productOrder where uid = 'admin' group by merchant_uid;
SELECT *, (SELECT COUNT(*) FROM productorder AS po WHERE po.merchant_uid = p.merchant_uid AND po.price <= p.price) AS rank FROM productorder AS p where uid = 'admin' order by idx desc;
