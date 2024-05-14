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







