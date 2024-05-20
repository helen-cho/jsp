create table goods(
	gid char(11) not null primary key,
    title varchar(500) not null,
    price int default 0,
    brand varchar(500),
    image varchar(500),
    regDate datetime default now()
);

desc goods;

select * from goods order by regDate desc;
select count(*) from goods;

create table users(
	uid varchar(20) not null primary key,
    upass varchar(200) not null,
    uname varchar(20) not null
);

insert into users(uid, upass, uname)
values('red', 'pass', '김레드');
insert into users(uid, upass, uname)
values('blue', 'pass', '이블루');
insert into users(uid, upass, uname)
values('sky', 'pass', '스카이');
insert into users(uid, upass, uname)
values('black', 'pass', '박블랙');
insert into users(uid, upass, uname)
values('green', 'pass', '최그린');

select * from users;

create table cart(
	uid varchar(20) not null,
    gid char(11) not null,
    qnt int default 0,
    primary key(uid, gid),
    foreign key(uid) references users(uid),
    foreign key(gid) references goods(gid)
);

create view view_cart as
select c.*, g.title, g.price, g.image 
from cart c, goods g
where c.gid=g.gid;

select * from  view_cart;


insert into users(uid, upass, uname)
values('admin', 'pass', '관리자');

create table favorite(
	uid varchar(20) not null,
    gid char(11) not null,
    regDate datetime default now(),
    primary key(uid, gid),
	foreign key(uid) references users(uid),
    foreign key(gid) references goods(gid)
);

desc goods;

insert into favorite(uid, gid)
values('red','19108316833');
insert into favorite(uid, gid)
values('blue','19108316833');
insert into favorite(uid, gid)
values('sky','19108316833');
insert into favorite(uid, gid)
values('red','28652129554');

select * from favorite;

select * from favorite
where uid='red';

select *, 
(select count(*) from favorite f where uid='red' and f.gid=g.gid) ucnt,
(select count(*) from favorite f where f.gid=g.gid) fcnt
from goods g
order by regDate desc;



select * from favorite;


create table review(
	rid int auto_increment primary key,
    gid char(11) not null,
    uid varchar(20) not null,
    content text not null,
    revDate datetime default now(),
    foreign key(gid) references goods(gid),
    foreign key(uid) references users(uid)
);

insert into review(gid, uid, content)
select gid,uid,content from review;


select * from review;

/*주문자 정보*/
create table purchase( 
	pid char(13) not null primary key,
    uid varchar(20) not null,
    rname varchar(20) not null,
    rphone varchar(20) not null,
    raddress1 varchar(500) not null,
    raddress2 varchar(500) not null,
    pdate datetime default now(),
    sum int default 0,
    status int default 0, /*0:결제대기,1:결제확인,2:배송준비,3:배송완료, 4.주문완료*/
    foreign key(uid) references users(uid)
);

/*주문상품 정보*/
create table orders(
	pid char(13) not null,
    gid char(11) not null,
    price int default 0,
    qnt int default 0,
    primary key(pid, gid),
    foreign key(pid) references purchase(pid),
    foreign key(gid) references goods(gid)
);



desc users;
alter table users add column phone varchar(20);
alter table users add column address1 varchar(500);
alter table users add column address2 varchar(500);

update users 
set phone='010-1010-2020',
address1='인천 서구 서곶로120 루원시티포레나',
address2='213동 1104호'
where uid='red';

select * from users;

select * from purchase;
select * from orders;













