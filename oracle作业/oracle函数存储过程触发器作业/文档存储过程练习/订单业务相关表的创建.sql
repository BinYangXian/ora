create table T_Order(
       Order_ID number(8) primary key,
       Order_No varchar2(10)unique,
       Customer varchar2(10),
       Sales_ID number(8),
       Approval_status varchar2(5)check(Approval_status = '通过'or Approval_status = '驳回')
);

create table T_OrderDetail (
       OrderDetail_ID number(8)primary key,
       Order_ID number(8),
       Product varchar2(20),
       Price number(8,2),
       Quantity number(8),
       constraint TOD_TO_FK foreign key(Order_ID) references T_Order(Order_ID)
);

create table T_Sales (
       Sales_ID number(8) primary key,
       Team varchar2(20),
       SName varchar2(20),
       Sex varchar2(2),
       Birthday date,
       StartDate date,
       Sale_Under_Limit number(8)
);

insert into T_Sales values(10,'salesTeam','S1','男',to_date('1988-10-12','yyyy-mm-dd'),to_date('2010-10-01','yyyy-mm-dd'),30000);
insert into T_Sales values(20,'salesTeam','S2','男',to_date('1987-11-22','yyyy-mm-dd'),to_date('2011-06-21','yyyy-mm-dd'),35000);
insert into T_Order values(1,'ORD_01','C1',10,'驳回');
insert into T_Order values(2,'ORD_02','C1',10,'通过');
insert into T_Order values(3,'ORD_03','C2',20,'通过');

insert into T_OrderDetail values(1,1,'A',10,1000);
insert into T_OrderDetail values(2,1,'B',5,1500);
insert into T_OrderDetail values(3,2,'A',10,2000);
insert into T_OrderDetail values(4,2,'C',15,1500);
insert into T_OrderDetail values(5,3,'B',5,1500);
insert into T_OrderDetail values(6,3,'C',15,3000);
