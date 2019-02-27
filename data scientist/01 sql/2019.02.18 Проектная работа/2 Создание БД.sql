drop table if exists CUSTOMER;
drop table if exists EMPLOYEE;
drop table if exists ITEM;
drop table if exists JOB;
drop table if exists PRICE;
drop table if exists PRODUCT;
drop table if exists SALARY_GRADE;
drop table if exists SALES_ORDER;


CREATE TABLE JOB(
JOB_ID BIGSERIAL NOT NULL, 
NAME VARCHAR(30) NULL, 
PRIMARY KEY (JOB_ID)
);

insert into job values(       667 ,'CLERK');
insert into job values(       668 ,'STAFF');
insert into job values(       669 ,'ANALYST');
insert into job values(       670 ,'SALESPERSON');
insert into job values(       671 ,'MANAGER');
insert into job values(       672 ,'PRESIDENT');


CREATE TABLE EMPLOYEE(
EMPLOYEE_ID BIGSERIAL NOT NULL, 
LAST_NAME VARCHAR(15) NULL, 
FIRST_NAME VARCHAR(15) NULL, 
MIDDLE_INITIAL VARCHAR(1) NULL, 
JOB_ID BIGSERIAL NOT NULL, 
MANAGER_ID BIGSERIAL NOT NULL, 
HIRE_DATE DATE NULL, 
SALARY MONEY NULL, 
COMMISSION MONEY NULL, 
PRIMARY KEY (EMPLOYEE_ID),  
FOREIGN KEY (JOB_ID) REFERENCES JOB(JOB_ID),  
FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

insert into employee values(7839,'KING',   'FRANCIS', 'A',672,7839,'17-NOV-1985',5000,NULL);
insert into employee values(7505,'DOYLE',  'JEAN',    'K',671,7839,'04-APR-1985',2850,NULL);
insert into employee values(7555,'PETERS', 'DANIEL',  'T',670,7505,'31-MAR-1985',1250,300 );
insert into employee values(7557,'SHAW',   'KAREN',   'P',670,7505,'02-APR-1985',1250,1200);
insert into employee values(7600,'PORTER', 'RAYMOND', 'Y',670,7505,'15-APR-1985',1250,900 );
insert into employee values(7820,'ROSS',   'PAUL',    'S',670,7505,'01-JUN-1985',1300,800 );
insert into employee values(7950,'JENSEN', 'ALICE',   'B',667,7505,'15-JAN-1987', 750,NULL);
insert into employee values(7506,'DENNIS', 'LYNN',    'S',671,7839,'15-MAY-1985',2750,NULL);
insert into employee values(7560,'DUNCAN', 'SARAH',   'S',670,7506,'31-MAY-1985',1250,NULL);
insert into employee values(7564,'LANGE',  'GREGORY', 'J',670,7506,'01-JUN-1985',1250,300 );
insert into employee values(7789,'WEST',   'LIVIA',   'N',670,7506,'04-APR-1985',1500,1000);
insert into employee values(7954,'MURRAY', 'JAMES',   'T',667,7506,'16-JAN-1987', 750,NULL);
insert into employee values(7507,'BAKER',  'LESLIE',  'D',671,7839,'10-JUN-1985',2200,NULL);
insert into employee values(7609,'LEWIS',  'RICHARD', 'M',668,7507,'16-APR-1985',1800,NULL);
insert into employee values(7676,'SOMMERS','DENISE',  'D',668,7507,'19-APR-1985',1850,NULL);
insert into employee values(7566,'JONES',  'TERRY',   'M',671,7839,'02-APR-1985',2975,NULL);
insert into employee values(7788,'SCOTT',  'DONALD',  'T',669,7566,'09-DEC-1986',3000,NULL);
insert into employee values(7876,'ADAMS',  'DIANE',   'G',667,7788,'12-JAN-1987',1100,NULL);
insert into employee values(7902,'FORD',   'JENNIFER','D',669,7566,'03-DEC-1985',3000,NULL);
insert into employee values(7369,'SMITH',  'JOHN',    'Q',667,7902,'17-DEC-1984', 800,NULL);
insert into employee values(7569,'ALBERTS','CHRIS',   'L',671,7839,'06-APR-1985',3000,NULL);
insert into employee values(7799,'FISHER', 'MATTHEW', 'G',669,7569,'12-DEC-1986',3000,NULL);
insert into employee values(7919,'DOUGLAS','MICHAEL', 'A',667,7799,'04-JAN-1987', 800,NULL);
insert into employee values(7916,'ROBERTS','GRACE',   'M',669,7569,'04-JAN-1987',2875,NULL);
insert into employee values(7698,'BLAKE',  'MARION',  'S',671,7839,'01-MAY-1985',2850,NULL);
insert into employee values(7499,'ALLEN',  'KEVIN',   'J',670,7698,'20-FEB-1985',1600,300 );
insert into employee values(7521,'WARD',   'CYNTHIA', 'D',670,7698,'22-FEB-1985',1250,500 );
insert into employee values(7654,'MARTIN', 'KENNETH', 'J',670,7698,'28-SEP-1985',1250,1400);
insert into employee values(7844,'TURNER', 'MARY',    'A',670,7698,'08-SEP-1985',1500,NULL);
insert into employee values(7900,'JAMES',  'FRED',    'S',667,7698,'03-DEC-1985', 950,NULL);
insert into employee values(7782,'CLARK',  'CAROL',   'F',671,7839,'09-JUN-1985',2450,NULL);
insert into employee values(7934,'MILLER', 'BARBARA', 'M',667,7782,'23-JAN-1986',1300,NULL);


CREATE TABLE CUSTOMER(
CUSTOMER_ID BIGSERIAL NOT NULL, 
NAME VARCHAR(20) NULL, 
ADDRESS VARCHAR(21) NULL, 
CITY VARCHAR(16) NULL, 
STATE VARCHAR(2) NULL, 
ZIP_CODE VARCHAR(9) NULL, 
AREA_CODE INTEGER NULL, 
PHONE_NUMBER INTEGER NULL, 
SALESPERSON_ID BIGSERIAL NOT NULL, 
CREDIT_LIMIT MONEY NULL, 
PRIMARY KEY (CUSTOMER_ID),  
FOREIGN KEY (SALESPERSON_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

insert into customer values(100,'JOCKSPORTS',          '345 VIEWRIDGE',       'BELMONT',        'CA','96711',415,5986609,7844,5000);
insert into customer values(101,'TKB SPORT SHOP',      '490 BOLI RD.',        'REDWOOD CITY',   'CA','94061',415,3681223,7521,10000);
insert into customer values(102,'VOLLYRITE',           '9722 HAMILTON',       'BURLINGAME',     'CA','95133',415,6443341,7654,7000);
insert into customer values(103,'JUST TENNIS',         'HILLVIEW MALL',       'BURLINGAME',     'CA','97544',415,6779312,7521,3000);
insert into customer values(104,'EVERY MOUNTAIN',      '574 SURRY RD.',       'CUPERTINO',      'CA','93301',408,9962323,7499,10000);
insert into customer values(105,'K + T SPORTS',        '3476 EL PASEO',       'SANTA CLARA',    'CA','91003',408,3769966,7844,5000);
insert into customer values(106,'SHAPE UP',            '908 SEQUOIA',         'PALO ALTO',      'CA','94301',415,3649777,7521,6000);
insert into customer values(107,'WOMENS SPORTS',       'VALCO VILLAGE',       'SUNNYVALE',      'CA','93301',408,9674398,7499,10000);
insert into customer values(108,'NORTH WOODS HEALTH',  '98 LONE PINE WAY',    'HIBBING',        'MN','55649',612,5669123,7844,8000);
insert into customer values(201,'STADIUM SPORTS',      '47 IRVING PL.',       'NEW YORK',       'NY','10003',212,5555335,7557,10000);
insert into customer values(202,'HOOPS',               '2345 ADAMS AVE.',     'LEICESTER',      'MA','01524',508,5557542,7820,5000);
insert into customer values(203,'REBOUND SPORTS',      '2 E. 14TH ST.',       'NEW YORK',       'NY','10009',212,5555989,7557,10000);
insert into customer values(204,'THE POWER FORWARD',   '1 KNOTS LANDING',     'DALLAS',         'TX','75248',214,5550505,7560,12000);
insert into customer values(205,'POINT GUARD',         '20 THURSTON ST.',     'YONKERS',        'NY','10956',914,5554766,7557,3000);
insert into customer values(206,'THE COLISEUM',        '5678 WILBUR PL.',     'SCARSDALE',      'NY','10583',914,5550217,7557,6000);
insert into customer values(207,'FAST BREAK',          '1000 HERBERT LN.',    'CONCORD',        'MA','01742',508,5551298,7820,7000);
insert into customer values(208,'AL AND BOB''S SPORTS','260 YORKTOWN CT.',    'AUSTIN',         'TX','78731',512,5557631,7560,4000);
insert into customer values(211,'AT BAT',              '234 BEACHEM ST.',     'BROOKLINE',      'MA','02146',617,5557385,7820,8000);
insert into customer values(212,'ALL SPORT',           '1000 38TH ST.',       'BROOKLYN',       'NY','11210',718,5551739,7600,6000);
insert into customer values(213,'GOOD SPORT',          '400 46TH ST.',        'SUNNYSIDE',      'NY','11104',718,5553771,7600,5000);
insert into customer values(214,'AL''S PRO SHOP',      '45 SPRUCE ST.',       'SPRING',         'TX','77388',713,5555172,7564,8000);
insert into customer values(215,'BOB''S FAMILY SPORTS','400 E. 23RD',         'HOUSTON',        'TX','77026',713,5558015,7654,8000);
insert into customer values(216,'THE ALL AMERICAN',    '547 PRENTICE RD.',    'CHELSEA',        'MA','02150',617,5553047,7820,5000);
insert into customer values(217,'HIT, THROW, AND RUN', '333 WOOD COURT',      'GRAPEVINE',      'TX','76051',817,5552352,7564,6000);
insert into customer values(218,'THE OUTFIELD',        '346 GARDEN BLVD.',    'FLUSHING',       'NY','11355',718,5552131,7820,4000);
insert into customer values(221,'WHEELS AND DEALS',    '2 MEMORIAL DRIVE',    'HOUSTON',        'TX','77007',713,5554139,7789,10000);
insert into customer values(222,'JUST BIKES',          '4000 PARKRIDGE BLVD.','DALLAS',         'TX','75205',214,5558735,7789,4000);
insert into customer values(223,'VELO SPORTS',         '23 WHITE ST.',        'MALDEN',         'MA','02148',617,5554983,7820,5000);
insert into customer values(224,'JOE''S BIKE SHOP',    '4500 FOX COURT',      'GRAND PRARIE',   'TX','75051',214,5559834,7789,6000);
insert into customer values(225,'BOB''S SWIM, AND RUN','300 HORSECREEK',      'IRVING',         'TX','75039',214,5558388,7789,7000);
insert into customer values(226,'CENTURY SHOP',        '8 DAGMAR DR.',        'HUNTINGTON',     'NY','11743',516,5553006,7555,4000);
insert into customer values(227,'THE TOUR',            '2500 GARDNER RD.',    'SOMERVILLE',     'MA','02144',617,5556673,7820,5000);
insert into customer values(228 ,'FITNESS FIRST',      '5000 85TH ST.',       'JACKSON HEIGHTS','NY','11372',718,5558710,7555,4000);


CREATE TABLE SALES_ORDER(
ORDER_ID BIGSERIAL NOT NULL, 
ORDER_DATE DATE NULL, 
CUSTOMER_ID BIGSERIAL NOT NULL, 
SHIP_DATE DATE NULL, 
PRIMARY KEY (ORDER_ID),  
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
);

insert into sales_order values(       610 , '07-JAN-1991' ,         101 , '08-JAN-1991' ); 
insert into sales_order values(       611 , '11-JAN-1991' ,         102 , '11-JAN-1991' ); 
insert into sales_order values(       612 , '15-JAN-1991' ,         104 , '20-JAN-1991' ); 
insert into sales_order values(       601 , '16-NOV-1990' ,         106 , '30-NOV-1990' ); 
insert into sales_order values(       602 , '05-JUN-1990' ,         102 , '20-JUN-1990' ); 
insert into sales_order values(       600 , '01-MAY-1990' ,         103 , '29-MAY-1990' ); 
insert into sales_order values(       604 , '15-JUN-1990' ,         106 , '30-JUN-1990' ); 
insert into sales_order values(       605 , '14-JUL-1990' ,         106 , '30-JUL-1990' ); 
insert into sales_order values(       606 , '14-JUL-1990' ,         100 , '30-JUL-1990' ); 
insert into sales_order values(       609 , '01-AUG-1990' ,         100 , '15-AUG-1990' ); 
insert into sales_order values(       607 , '18-JUL-1990' ,         104 , '18-JUL-1990' ); 
insert into sales_order values(       608 , '25-JUL-1990' ,         104 , '25-JUL-1990' ); 
insert into sales_order values(       603 , '05-JUN-1990' ,         102 , '05-JUN-1990' ); 
insert into sales_order values(       620 , '12-MAR-1991' ,         100 , '12-MAR-1991' ); 
insert into sales_order values(       613 , '01-FEB-1991' ,         108 , '01-FEB-1991' ); 
insert into sales_order values(       614 , '01-FEB-1991' ,         102 , '05-FEB-1991' ); 
insert into sales_order values(       616 , '03-FEB-1991' ,         103 , '10-FEB-1991' ); 
insert into sales_order values(       619 , '22-FEB-1991' ,         104 , '04-MAR-1991' ); 
insert into sales_order values(       617 , '05-FEB-1991' ,         105 , '03-MAR-1991' ); 
insert into sales_order values(       615 , '01-FEB-1991' ,         107 , '06-FEB-1991' ); 
insert into sales_order values(       618 , '15-FEB-1991' ,         102 , '06-MAR-1991' ); 
insert into sales_order values(       621 , '15-MAR-1991' ,         100 , '01-APR-1991' ); 
insert into sales_order values(       509 , '04-JUN-1989' ,         226 , '10-JUN-1989' ); 
insert into sales_order values(       523 , '13-FEB-1990' ,         226 , '13-FEB-1990' ); 
insert into sales_order values(       549 , '27-DEC-1990' ,         226 , '14-JAN-1991' ); 
insert into sales_order values(       507 , '26-MAY-1989' ,         228 , '27-MAY-1989' ); 
insert into sales_order values(       516 , '30-SEP-1989' ,         228 , '03-OCT-1989' ); 
insert into sales_order values(       553 , '02-FEB-1991' ,         228 , '13-FEB-1991' ); 
insert into sales_order values(       526 , '04-MAR-1990' ,         221 , '07-MAR-1990' ); 
insert into sales_order values(       543 , '04-SEP-1990' ,         221 , '07-SEP-1990' ); 
insert into sales_order values(       555 , '04-MAR-1991' ,         221 , '07-MAR-1991' ); 
insert into sales_order values(       559 , '16-NOV-1990' ,         222 , '23-APR-1991' ); 
insert into sales_order values(       528 , '24-MAR-1990' ,         224 , '24-MAR-1990' ); 
insert into sales_order values(       531 , '31-MAR-1990' ,         224 , '02-APR-1990' ); 
insert into sales_order values(       558 , '31-MAR-1991' ,         224 , '02-APR-1991' ); 
insert into sales_order values(       525 , '28-FEB-1990' ,         225 , '03-MAR-1990' ); 
insert into sales_order values(       552 , '02-FEB-1991' ,         223 , '07-FEB-1991' ); 
insert into sales_order values(       556 , '10-MAR-1991' ,         223 , '12-MAR-1991' ); 
insert into sales_order values(       560 , '25-APR-1991' ,         223 , '25-APR-1991' ); 
insert into sales_order values(       565 , '01-JUN-1991' ,         227 , '03-JUN-1991' ); 
insert into sales_order values(       574 , '10-OCT-1991' ,         201 , '12-OCT-1991' ); 
insert into sales_order values(       576 , '13-OCT-1991' ,         201 , '18-OCT-1991' ); 
insert into sales_order values(       503 , '25-MAR-1989' ,         201 , '06-APR-1989' ); 
insert into sales_order values(       518 , '20-OCT-1989' ,         201 , '05-NOV-1989' ); 
insert into sales_order values(       517 , '23-OCT-1989' ,         201 , '07-NOV-1989' ); 
insert into sales_order values(       544 , '11-SEP-1990' ,         202 , '15-SEP-1990' ); 
insert into sales_order values(       524 , '22-FEB-1990' ,         202 , '04-MAR-1990' ); 
insert into sales_order values(       502 , '10-FEB-1989' ,         202 , '23-FEB-1989' ); 
insert into sales_order values(       539 , '26-JUN-1990' ,         202 , '03-JUL-1990' ); 
insert into sales_order values(       511 , '17-AUG-1989' ,         202 , '21-AUG-1989' ); 
insert into sales_order values(       512 , '28-AUG-1989' ,         203 , '13-SEP-1989' ); 
insert into sales_order values(       562 , '04-MAY-1991' ,         203 , '19-MAY-1991' ); 
insert into sales_order values(       529 , '02-APR-1990' ,         203 , '05-APR-1990' ); 
insert into sales_order values(       563 , '25-MAY-1991' ,         204 , '26-MAY-1991' ); 
insert into sales_order values(       568 , '13-JUL-1991' ,         204 , '21-JUL-1991' ); 
insert into sales_order values(       504 , '11-APR-1989' ,         204 , '12-APR-1989' ); 
insert into sales_order values(       538 , '23-JUN-1990' ,         204 , '26-JUN-1990' ); 
insert into sales_order values(       535 , '28-MAY-1990' ,         204 , '09-JUN-1990' ); 
insert into sales_order values(       578 , '19-NOV-1991' ,         204 , '04-DEC-1991' ); 
insert into sales_order values(       534 , '11-MAY-1990' ,         206 , '15-MAY-1990' ); 
insert into sales_order values(       536 , '21-MAY-1990' ,         206 , '06-JUN-1990' ); 
insert into sales_order values(       572 , '19-AUG-1991' ,         206 , '24-AUG-1991' ); 
insert into sales_order values(       514 , '05-SEP-1989' ,         207 , '16-SEP-1989' ); 
insert into sales_order values(       521 , '20-NOV-1989' ,         207 , '23-NOV-1989' ); 
insert into sales_order values(       551 , '22-JAN-1991' ,         208 , '06-FEB-1991' ); 
insert into sales_order values(       513 , '06-SEP-1989' ,         208 , '14-SEP-1989' ); 
insert into sales_order values(       508 , '26-MAY-1989' ,         208 , '08-JUN-1989' ); 
insert into sales_order values(       515 , '19-SEP-1989' ,         208 , '26-SEP-1989' ); 
insert into sales_order values(       542 , '11-AUG-1990' ,         208 , '23-AUG-1990' ); 
insert into sales_order values(       573 , '10-OCT-1991' ,         201 , '12-OCT-1991' ); 
insert into sales_order values(       566 , '09-JUN-1991' ,         201 , '12-JUN-1991' ); 
insert into sales_order values(       520 , '16-NOV-1989' ,         201 , '19-NOV-1989' ); 
insert into sales_order values(       519 , '20-OCT-1989' ,         201 , '05-NOV-1989' ); 
insert into sales_order values(       575 , '04-OCT-1991' ,         201 , '17-OCT-1991' ); 
insert into sales_order values(       547 , '16-OCT-1990' ,         202 , '27-OCT-1990' ); 
insert into sales_order values(       540 , '15-JUL-1990' ,         202 , '17-JUL-1990' ); 
insert into sales_order values(       567 , '05-JUL-1991' ,         202 , '07-JUL-1991' ); 
insert into sales_order values(       570 , '17-JUL-1991' ,         202 , '24-JUL-1991' ); 
insert into sales_order values(       571 , '02-AUG-1991' ,         202 , '12-AUG-1991' ); 
insert into sales_order values(       541 , '08-AUG-1990' ,         203 , '18-AUG-1990' ); 
insert into sales_order values(       532 , '08-APR-1990' ,         203 , '21-APR-1990' ); 
insert into sales_order values(       527 , '27-FEB-1990' ,         204 , '14-MAR-1990' ); 
insert into sales_order values(       501 , '06-JAN-1989' ,         204 , '11-JAN-1989' ); 
insert into sales_order values(       564 , '25-MAY-1991' ,         204 , '26-MAY-1991' ); 
insert into sales_order values(       537 , '14-JUN-1990' ,         204 , '26-JUN-1990' ); 
insert into sales_order values(       522 , '07-JAN-1990' ,         204 , '10-JAN-1990' ); 
insert into sales_order values(       554 , '18-FEB-1991' ,         204 , '22-FEB-1991' ); 
insert into sales_order values(       569 , '16-JUL-1991' ,         205 , '23-JUL-1991' ); 
insert into sales_order values(       550 , '27-JAN-1991' ,         205 , '07-FEB-1991' ); 
insert into sales_order values(       548 , '26-NOV-1990' ,         205 , '12-DEC-1990' ); 
insert into sales_order values(       505 , '07-APR-1989' ,         206 , '22-APR-1989' ); 
insert into sales_order values(       577 , '06-OCT-1991' ,         206 , '20-OCT-1991' ); 
insert into sales_order values(       533 , '28-APR-1990' ,         206 , '02-MAY-1990' ); 
insert into sales_order values(       561 , '20-APR-1991' ,         207 , '07-MAY-1991' ); 
insert into sales_order values(       506 , '27-APR-1989' ,         208 , '10-MAY-1989' ); 
insert into sales_order values(       530 , '03-APR-1990' ,         208 , '07-APR-1990' ); 
insert into sales_order values(       545 , '06-OCT-1990' ,         208 , '13-OCT-1990' ); 
insert into sales_order values(       557 , '08-MAR-1991' ,         208 , '12-MAR-1991' ); 
insert into sales_order values(       546 , '17-OCT-1990' ,         208 , '23-OCT-1990' ); 
insert into sales_order values(       510 , '18-JUL-1989' ,         208 , '21-JUL-1989' ); 


CREATE TABLE PRODUCT(
PRODUCT_ID BIGSERIAL NOT NULL, 
DESCRIPTION VARCHAR(30) NULL,  
PRIMARY KEY (PRODUCT_ID)
);

insert into PRODUCT values(     100860 , 'ACE TENNIS RACKET I'            );
insert into PRODUCT values(     100861 , 'ACE TENNIS RACKET II'           );
insert into PRODUCT values(     100870 , 'ACE TENNIS BALLS-3 PACK'        );
insert into PRODUCT values(     100871 , 'ACE TENNIS BALLS-6 PACK'        );
insert into PRODUCT values(     100890 , 'ACE TENNIS NET'                 );
insert into PRODUCT values(     101860 , 'SP TENNIS RACKET'               );
insert into PRODUCT values(     101863 , 'SP JUNIOR RACKET'               );
insert into PRODUCT values(     102130 , 'RH: GUIDE TO TENNIS'          );
insert into PRODUCT values(     200376 , 'SB ENERGY BAR-6 PACK'           );
insert into PRODUCT values(     200380 , 'SB VITA SNACK-6 PACK'           );
insert into PRODUCT values(     103120 , 'WIFF SOFTBALL BAT I'            );
insert into PRODUCT values(     103121 , 'WIFF SOFTBALL BAT II'           );
insert into PRODUCT values(     103130 , 'WIFF SOFTBALL, SMALL'           );
insert into PRODUCT values(     103131 , 'WIFF SOFTBALL, LARGE'           );
insert into PRODUCT values(     103140 , 'WIFF SOFTBALL MITT (LH)'        );
insert into PRODUCT values(     103141 , 'WIFF SOFTBALL MITT (RH)'        );
insert into PRODUCT values(     102132 , 'RH: GUIDE TO SOFTBALL'        );
insert into PRODUCT values(     104350 , 'DUNK BASKETBALL INDOOR'         );
insert into PRODUCT values(     104351 , 'DUNK BASKETBALL OUTDOOR'        );
insert into PRODUCT values(     104352 , 'DUNK BASKETBALL PROFESSIONAL'   );
insert into PRODUCT values(     104360 , 'DUNK HOOP'                      );
insert into PRODUCT values(     104361 , 'DUNK HOOP W/FIBERGLASS BOARD'   );
insert into PRODUCT values(     104362 , 'DUNK NETS - RAINBOW'            );
insert into PRODUCT values(     102134 , 'RH: GUIDE TO BASKETBALL'      );
insert into PRODUCT values(     105123 , 'YELLOW JERSEY BICYCLE HELMET'   );
insert into PRODUCT values(     105124 , 'YELLOW JERSEY BICYCLE GLOVES'   );
insert into PRODUCT values(     105125 , 'YELLOW JERSEY WATER BOTTLE'     );
insert into PRODUCT values(     105126 , 'YELLOW JERSEY BOTTLE CAGE'      );
insert into PRODUCT values(     105127 , 'YELLOW JERSEY FRAME PUMP'       );
insert into PRODUCT values(     105128 , 'YELLOW JERSEY SADDLE PACK'      );
insert into PRODUCT values(     102136 , 'RH: GUIDE TO CYCLING'         );


CREATE TABLE ITEM(
ORDER_ID BIGSERIAL NOT NULL, 
ITEM_ID BIGSERIAL NOT NULL, 
PRODUCT_ID BIGSERIAL NOT NULL, 
ACTUAL_PRICE MONEY NULL, 
QUANTITY INTEGER NULL, 
PRIMARY KEY (ORDER_ID, ITEM_ID),  
FOREIGN KEY (ORDER_ID) REFERENCES SALES_ORDER(ORDER_ID),  
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
);


insert into item values(       600 ,         1 ,     100861 ,           42 ,         1 );                                                                                                  
insert into item values(       610 ,         3 ,     100890 ,           58 ,         1 );                                                                                                  
insert into item values(       611 ,         1 ,     100861 ,           45 ,         1 );                                                                                                  
insert into item values(       612 ,         1 ,     100860 ,           30 ,       100 );                                                                                                  
insert into item values(       601 ,         1 ,     200376 ,          2.4 ,        12 );                                                                                                  
insert into item values(       601 ,         2 ,     100860 ,           32 ,         1 );                                                                                                  
insert into item values(       602 ,         1 ,     100870 ,          2.8 ,        20 );                                                                                                  
insert into item values(       604 ,         1 ,     100890 ,           58 ,         3 );                                                                                                  
insert into item values(       604 ,         2 ,     100861 ,           42 ,         2 );                                                                                                  
insert into item values(       604 ,         3 ,     100860 ,           32 ,        12 );                                                                                                  
insert into item values(       603 ,         1 ,     100860 ,           32 ,         7 );                                                                                                  
insert into item values(       610 ,         1 ,     100860 ,           35 ,         1 );                                                                                                  
insert into item values(       610 ,         2 ,     100870 ,          2.8 ,         3 );                                                                                                  
insert into item values(       613 ,         4 ,     200376 ,          2.2 ,       200 );                                                                                                  
insert into item values(       614 ,         1 ,     100860 ,           35 ,       444 );                                                                                                  
insert into item values(       614 ,         2 ,     100870 ,          2.8 ,      1000 );                                                                                                  
insert into item values(       612 ,         2 ,     100861 ,         40.5 ,        20 );                                                                                                  
insert into item values(       612 ,         3 ,     101863 ,           10 ,       150 );                                                                                                  
insert into item values(       620 ,         1 ,     100860 ,           35 ,        10 );                                                                                                  
insert into item values(       620 ,         2 ,     200376 ,          2.4 ,      1000 );                                                                                                  
insert into item values(       620 ,         3 ,     102130 ,          3.4 ,       500 );                                                                                                      
insert into item values(       613 ,         1 ,     100871 ,          5.6 ,       100 );                                                                                                  
insert into item values(       613 ,         2 ,     101860 ,           24 ,       200 );                                                                                                  
insert into item values(       613 ,         3 ,     200380 ,            4 ,       150 );                                                                                                  
insert into item values(       619 ,         3 ,     102130 ,          3.4 ,       100 );                                                                                                  
insert into item values(       617 ,         1 ,     100860 ,           35 ,        50 );                                                                                                  
insert into item values(       617 ,         2 ,     100861 ,           45 ,       100 );                                                                                                  
insert into item values(       614 ,         3 ,     100871 ,          5.6 ,      1000 );                                                                                                  
insert into item values(       616 ,         1 ,     100861 ,           45 ,        10 );                                                                                                  
insert into item values(       616 ,         2 ,     100870 ,          2.8 ,        50 );                                                                                                  
insert into item values(       616 ,         3 ,     100890 ,           58 ,         2 );                                                                                                  
insert into item values(       616 ,         4 ,     102130 ,          3.4 ,        10 );                                                                                                  
insert into item values(       616 ,         5 ,     200376 ,          2.4 ,        10 );                                                                                                  
insert into item values(       619 ,         1 ,     200380 ,            4 ,       100 );                                                                                                  
insert into item values(       619 ,         2 ,     200376 ,          2.4 ,       100 );                                                                                                  
insert into item values(       615 ,         1 ,     100861 ,           45 ,         4 );                                                                                                  
insert into item values(       607 ,         1 ,     100871 ,          5.6 ,         1 );                                                                                                  
insert into item values(       615 ,         2 ,     100870 ,          2.8 ,       100 );                                                                                                  
insert into item values(       617 ,         3 ,     100870 ,          2.8 ,       500 );                                                                                                  
insert into item values(       617 ,         4 ,     100871 ,          5.6 ,       500 );                                                                                                  
insert into item values(       617 ,         5 ,     100890 ,           58 ,       500 );                                                                                                  
insert into item values(       617 ,         6 ,     101860 ,           24 ,       100 );                                                                                                    
insert into item values(       617 ,         7 ,     101863 ,         12.5 ,       200 );                                                                                                  
insert into item values(       617 ,         8 ,     102130 ,          3.4 ,       100 );                                                                                                  
insert into item values(       617 ,         9 ,     200376 ,          2.4 ,       200 );                                                                                                  
insert into item values(       617 ,        10 ,     200380 ,            4 ,       300 );                                                                                                  
insert into item values(       609 ,         2 ,     100870 ,          2.5 ,         5 );                                                                                                  
insert into item values(       609 ,         3 ,     100890 ,           50 ,         1 );                                                                                                  
insert into item values(       618 ,         1 ,     100860 ,           35 ,        23 );                                                                                                  
insert into item values(       618 ,         2 ,     100861 ,           45 ,        50 );                                                                                                  
insert into item values(       618 ,         3 ,     100870 ,          2.8 ,        10 );                                                                                                  
insert into item values(       621 ,         1 ,     100861 ,           45 ,        10 );                                                                                                  
insert into item values(       621 ,         2 ,     100870 ,          2.8 ,       100 );                                                                                                  
insert into item values(       615 ,         3 ,     100871 ,            5 ,        50 );                                                                                                  
insert into item values(       608 ,         1 ,     101860 ,           24 ,         1 );                                                                                                  
insert into item values(       608 ,         2 ,     100871 ,          5.6 ,         2 );                                                                                                  
insert into item values(       609 ,         1 ,     100861 ,           40 ,         1 );                                                                                                  
insert into item values(       606 ,         1 ,     102130 ,          3.4 ,         1 );                                                                                                  
insert into item values(       605 ,         1 ,     100861 ,           45 ,       100 );                                                                                                  
insert into item values(       605 ,         2 ,     100870 ,          2.8 ,       500 );                                                                                                  
insert into item values(       605 ,         3 ,     100890 ,           58 ,         5 );                                                                                                  
insert into item values(       605 ,         4 ,     101860 ,           24 ,        50 );                                                                                                  
insert into item values(       605 ,         5 ,     101863 ,          9.5 ,       100 );                                                                                                   
insert into item values(       605 ,         6 ,     102130 ,          3.4 ,        10 );                                                                                                  
insert into item values(       612 ,         4 ,     100871 ,          5.5 ,       100 );                                                                                                  
insert into item values(       619 ,         4 ,     100871 ,          5.6 ,        50 );                                                                                                  
insert into item values(       509 ,         1 ,     105123 ,           35 ,        30 );                                                                                                  
insert into item values(       509 ,         2 ,     105124 ,            9 ,        10 );                                                                                                  
insert into item values(       509 ,         3 ,     102136 ,          3.4 ,        10 );                                                                                                  
insert into item values(       523 ,         1 ,     102136 ,          3.4 ,        10 );                                                                                                  
insert into item values(       523 ,         2 ,     105123 ,         37.7 ,        30 );                                                                                                  
insert into item values(       549 ,         1 ,     105123 ,           38 ,         5 );                                                                                                  
insert into item values(       549 ,         2 ,     105127 ,            6 ,        30 );                                                                                                  
insert into item values(       549 ,         3 ,     105125 ,            3 ,       200 );                                                                                                  
insert into item values(       549 ,         4 ,     105124 ,           13 ,        50 );                                                                                                  
insert into item values(       507 ,         1 ,     105123 ,         35.3 ,        20 );                                                                                                  
insert into item values(       507 ,         2 ,     105124 ,            9 ,        20 );                                                                                                  
insert into item values(       516 ,         1 ,     105124 ,            9 ,        60 );                                                                                                  
insert into item values(       516 ,         2 ,     102136 ,          3.2 ,       250 );                                                                                                  
insert into item values(       516 ,         3 ,     105125 ,          1.9 ,       250 );                                                                                                  
insert into item values(       553 ,         1 ,     105127 ,            6 ,       500 );                                                                                                  
insert into item values(       553 ,         2 ,     200376 ,         1.75 ,       800 );                                                                                                  
insert into item values(       526 ,         1 ,     105123 ,           32 ,       100 );                                                                                                  
insert into item values(       526 ,         2 ,     105124 ,            9 ,       500 );                                                                                                       
insert into item values(       543 ,         1 ,     105123 ,           34 ,       100 );                                                                                                  
insert into item values(       543 ,         2 ,     105124 ,           10 ,       500 );                                                                                                  
insert into item values(       555 ,         1 ,     105123 ,           34 ,       100 );                                                                                                  
insert into item values(       555 ,         2 ,     105124 ,           10 ,       500 );                                                                                                  
insert into item values(       555 ,         3 ,     102136 ,          2.8 ,        50 );                                                                                                  
insert into item values(       559 ,         1 ,     105123 ,           40 ,         5 );                                                                                                  
insert into item values(       559 ,         2 ,     105124 ,           15 ,         5 );                                                                                                  
insert into item values(       559 ,         3 ,     105127 ,            6 ,         5 );                                                                                                  
insert into item values(       559 ,         4 ,     102136 ,          3.4 ,         3 );                                                                                                  
insert into item values(       559 ,         5 ,     200376 ,          2.4 ,        30 );                                                                                                  
insert into item values(       528 ,         1 ,     105123 ,         37.7 ,       100 );                                                                                                  
insert into item values(       531 ,         1 ,     105124 ,           11 ,       100 );                                                                                                  
insert into item values(       531 ,         2 ,     102136 ,            3 ,       100 );                                                                                                  
insert into item values(       558 ,         1 ,     105124 ,           14 ,       100 );                                                                                                  
insert into item values(       558 ,         2 ,     102136 ,            3 ,       100 );                                                                                                  
insert into item values(       525 ,         1 ,     105123 ,         37.7 ,        10 );                                                                                                  
insert into item values(       552 ,         1 ,     105123 ,           40 ,        10 );                                                                                                  
insert into item values(       552 ,         2 ,     105124 ,           15 ,        10 );                                                                                                  
insert into item values(       552 ,         3 ,     102136 ,          3.4 ,         1 );                                                                                                  
insert into item values(       552 ,         4 ,     200376 ,          2.4 ,         1 );                                                                                                  
insert into item values(       556 ,         1 ,     102136 ,          3.4 ,        25 );                                                                                                                  
insert into item values(       560 ,         1 ,     200376 ,          2.4 ,        30 );                                                                                                  
insert into item values(       565 ,         1 ,     105123 ,           37 ,       100 );                                                                                                  
insert into item values(       565 ,         2 ,     105124 ,           12 ,       100 );                                                                                                  
insert into item values(       574 ,         1 ,     104350 ,         41.8 ,        25 );                                                                                                  
insert into item values(       574 ,         2 ,     200380 ,          3.2 ,       200 );                                                                                                  
insert into item values(       576 ,         1 ,     104350 ,           44 ,        10 );                                                                                                  
insert into item values(       576 ,         2 ,     104351 ,           26 ,        10 );                                                                                                  
insert into item values(       576 ,         3 ,     104362 ,         4.25 ,       170 );                                                                                                  
insert into item values(       576 ,         4 ,     200376 ,         2.16 ,        90 );                                                                                                  
insert into item values(       576 ,         5 ,     200380 ,          3.4 ,       130 );                                                                                                  
insert into item values(       503 ,         1 ,     104350 ,           38 ,        30 );                                                                                                  
insert into item values(       503 ,         2 ,     104351 ,         23.6 ,        10 );                                                                                                  
insert into item values(       503 ,         3 ,     104352 ,           50 ,        10 );                                                                                                  
insert into item values(       518 ,         1 ,     104350 ,           38 ,        25 );                                                                                                  
insert into item values(       518 ,         2 ,     104351 ,         23.6 ,        20 );                                                                                                  
insert into item values(       518 ,         3 ,     104360 ,           36 ,        20 );                                                                                                  
insert into item values(       518 ,         4 ,     104362 ,         4.25 ,       170 );                                                                                                  
insert into item values(       518 ,         5 ,     102134 ,          3.4 ,        20 );                                                                                                  
insert into item values(       517 ,         1 ,     104352 ,           50 ,        15 );                                                                                                  
insert into item values(       517 ,         2 ,     102134 ,          3.4 ,        10 );                                                                                                  
insert into item values(       544 ,         1 ,     104350 ,           44 ,        15 );                                                                                                            
insert into item values(       544 ,         2 ,     104351 ,           26 ,        15 );                                                                                                  
insert into item values(       544 ,         3 ,     104352 ,         58.3 ,        10 );                                                                                                  
insert into item values(       544 ,         4 ,     104361 ,           50 ,        10 );                                                                                                  
insert into item values(       544 ,         5 ,     104362 ,          4.5 ,        50 );                                                                                                  
insert into item values(       524 ,         1 ,     104350 ,           42 ,        10 );                                                                                                  
insert into item values(       524 ,         2 ,     104351 ,        23.56 ,        35 );                                                                                                  
insert into item values(       524 ,         3 ,     104362 ,         4.25 ,       150 );                                                                                                  
insert into item values(       524 ,         4 ,     102134 ,         3.23 ,        30 );                                                                                                  
insert into item values(       502 ,         1 ,     104352 ,           50 ,        10 );                                                                                                  
insert into item values(       539 ,         1 ,     104351 ,           26 ,        20 );                                                                                                  
insert into item values(       539 ,         2 ,     104360 ,           39 ,        20 );                                                                                                  
insert into item values(       511 ,         1 ,     104351 ,         23.6 ,        15 );                                                                                                  
insert into item values(       511 ,         2 ,     104362 ,          4.5 ,        50 );                                                                                                  
insert into item values(       511 ,         3 ,     102134 ,          3.4 ,        20 );                                                                                                  
insert into item values(       512 ,         1 ,     104360 ,           36 ,        10 );                                                                                                  
insert into item values(       512 ,         2 ,     102134 ,          3.4 ,        20 );                                                                                                  
insert into item values(       562 ,         1 ,     104351 ,         24.7 ,        25 );                                                                                                  
insert into item values(       562 ,         2 ,     104352 ,         58.3 ,        15 );                                                                                                  
insert into item values(       562 ,         3 ,     104362 ,         4.25 ,       130 );                                                                                                  
insert into item values(       529 ,         1 ,     104350 ,        39.89 ,        30 );                                                                                                  
insert into item values(       529 ,         2 ,     102134 ,          3.4 ,        20 );                                                                                                                   
insert into item values(       563 ,         1 ,     104352 ,         58.3 ,        10 );                                                                                                  
insert into item values(       563 ,         2 ,     200376 ,         2.04 ,       150 );                                                                                                  
insert into item values(       568 ,         1 ,     104351 ,         24.7 ,        30 );                                                                                                  
insert into item values(       568 ,         2 ,     200376 ,         2.04 ,       110 );                                                                                                  
insert into item values(       568 ,         3 ,     200380 ,          3.6 ,        70 );                                                                                                  
insert into item values(       504 ,         1 ,     104350 ,           40 ,        10 );                                                                                                  
insert into item values(       504 ,         2 ,     104351 ,        22.42 ,        35 );                                                                                                  
insert into item values(       504 ,         3 ,     104352 ,           50 ,         5 );                                                                                                  
insert into item values(       538 ,         1 ,     104351 ,         24.7 ,        30 );                                                                                                  
insert into item values(       535 ,         1 ,     104352 ,           54 ,        15 );                                                                                                  
insert into item values(       578 ,         1 ,     104350 ,         41.8 ,        40 );                                                                                                  
insert into item values(       578 ,         2 ,     200376 ,         2.04 ,       190 );                                                                                                  
insert into item values(       578 ,         3 ,     200380 ,          3.6 ,        60 );                                                                                                  
insert into item values(       534 ,         1 ,     104350 ,           42 ,        10 );                                                                                                  
insert into item values(       536 ,         1 ,     104350 ,        39.89 ,        40 );                                                                                                  
insert into item values(       536 ,         2 ,     104352 ,           54 ,        10 );                                                                                                  
insert into item values(       572 ,         1 ,     104351 ,         24.7 ,        25 );                                                                                                  
insert into item values(       572 ,         2 ,     104352 ,         58.3 ,        10 );                                                                                                  
insert into item values(       514 ,         1 ,     104350 ,           38 ,        30 );                                                                                                  
insert into item values(       521 ,         1 ,     104350 ,           40 ,        20 );                                                                                                  
insert into item values(       521 ,         2 ,     102134 ,         3.23 ,        30 );                                                                                                           
insert into item values(       551 ,         1 ,     104350 ,           44 ,        10 );                                                                                                  
insert into item values(       551 ,         2 ,     104361 ,           50 ,         5 );                                                                                                  
insert into item values(       551 ,         3 ,     102134 ,          3.4 ,        20 );                                                                                                  
insert into item values(       551 ,         4 ,     200376 ,         1.92 ,       200 );                                                                                                  
insert into item values(       513 ,         1 ,     104350 ,           40 ,        15 );                                                                                                  
insert into item values(       513 ,         2 ,     104351 ,         23.6 ,        20 );                                                                                                  
insert into item values(       513 ,         3 ,     104362 ,         4.25 ,       100 );                                                                                                  
insert into item values(       508 ,         1 ,     104360 ,           36 ,        20 );                                                                                                  
insert into item values(       508 ,         2 ,     104362 ,          4.5 ,        80 );                                                                                                  
insert into item values(       515 ,         1 ,     104350 ,           40 ,        20 );                                                                                                  
insert into item values(       515 ,         2 ,     104351 ,        22.42 ,        25 );                                                                                                  
insert into item values(       515 ,         3 ,     102134 ,          3.4 ,        20 );                                                                                                  
insert into item values(       542 ,         1 ,     104350 ,         41.8 ,        25 );                                                                                                  
insert into item values(       542 ,         2 ,     104360 ,           39 ,        20 );                                                                                                  
insert into item values(       542 ,         3 ,     104361 ,           50 ,        11 );                                                                                                  
insert into item values(       542 ,         4 ,     102134 ,          3.4 ,        10 );                                                                                                  
insert into item values(       573 ,         1 ,     103120 ,         22.5 ,        50 );                                                                                                  
insert into item values(       573 ,         2 ,     103131 ,         4.04 ,        50 );                                                                                                  
insert into item values(       573 ,         3 ,     103141 ,           20 ,        15 );                                                                                                  
insert into item values(       566 ,         1 ,     103120 ,        23.75 ,        40 );                                                                                                  
insert into item values(       566 ,         2 ,     103121 ,           27 ,        50 );                                                                                                          
insert into item values(       566 ,         3 ,     103130 ,         3.77 ,        60 );                                                                                                  
insert into item values(       566 ,         4 ,     103131 ,          3.9 ,       170 );                                                                                                  
insert into item values(       566 ,         5 ,     103141 ,           20 ,        10 );                                                                                                  
insert into item values(       520 ,         1 ,     103130 ,            4 ,        10 );                                                                                                  
insert into item values(       520 ,         2 ,     103131 ,         3.77 ,        80 );                                                                                                  
insert into item values(       519 ,         1 ,     103130 ,          3.5 ,       110 );                                                                                                  
insert into item values(       519 ,         2 ,     103140 ,           19 ,        30 );                                                                                                  
insert into item values(       575 ,         1 ,     103140 ,           19 ,        30 );                                                                                                  
insert into item values(       575 ,         2 ,     200380 ,          3.8 ,        30 );                                                                                                  
insert into item values(       547 ,         1 ,     103130 ,         3.77 ,        80 );                                                                                                  
insert into item values(       547 ,         2 ,     103131 ,         4.04 ,        70 );                                                                                                  
insert into item values(       547 ,         3 ,     103140 ,           20 ,        15 );                                                                                                  
insert into item values(       547 ,         4 ,     103141 ,           20 ,         5 );                                                                                                  
insert into item values(       540 ,         1 ,     103130 ,         3.98 ,        40 );                                                                                                  
insert into item values(       540 ,         2 ,     103131 ,          3.9 ,       180 );                                                                                                  
insert into item values(       567 ,         1 ,     103140 ,           20 ,        10 );                                                                                                  
insert into item values(       570 ,         1 ,     103131 ,         4.04 ,        90 );                                                                                                  
insert into item values(       570 ,         2 ,     103140 ,           20 ,        15 );                                                                                                  
insert into item values(       571 ,         1 ,     103131 ,         4.04 ,        70 );                                                                                                  
insert into item values(       571 ,         2 ,     103140 ,           19 ,        25 );                                                                                                  
insert into item values(       571 ,         3 ,     102132 ,          3.4 ,        15 );                                                                                                                            
insert into item values(       571 ,         4 ,     200376 ,         2.16 ,        80 );                                                                                                  
insert into item values(       571 ,         5 ,     200380 ,          3.8 ,        30 );                                                                                                  
insert into item values(       541 ,         1 ,     103140 ,           20 ,        10 );                                                                                                  
insert into item values(       541 ,         2 ,     103141 ,           20 ,        10 );                                                                                                  
insert into item values(       532 ,         1 ,     103120 ,        21.59 ,        60 );                                                                                                  
insert into item values(       527 ,         1 ,     103120 ,        21.59 ,        60 );                                                                                                  
insert into item values(       527 ,         2 ,     103121 ,        27.35 ,        40 );                                                                                                  
insert into item values(       527 ,         3 ,     103140 ,           19 ,        35 );                                                                                                  
insert into item values(       501 ,         1 ,     103130 ,          3.6 ,        60 );                                                                                                  
insert into item values(       564 ,         1 ,     103130 ,         3.77 ,        80 );                                                                                                  
insert into item values(       564 ,         2 ,     103131 ,          3.9 ,       120 );                                                                                                  
insert into item values(       564 ,         3 ,     102132 ,         3.23 ,        40 );                                                                                                  
insert into item values(       537 ,         1 ,     103130 ,          3.6 ,       160 );                                                                                                  
insert into item values(       537 ,         2 ,     102132 ,         3.23 ,        30 );                                                                                                  
insert into item values(       522 ,         1 ,     103120 ,        21.59 ,        80 );                                                                                                  
insert into item values(       522 ,         2 ,     103121 ,         28.8 ,        10 );                                                                                                  
insert into item values(       522 ,         3 ,     103131 ,         4.04 ,        90 );                                                                                                  
insert into item values(       522 ,         4 ,     103141 ,           20 ,        10 );                                                                                                  
insert into item values(       554 ,         1 ,     103131 ,         4.04 ,        70 );                                                                                                  
insert into item values(       569 ,         1 ,     103120 ,         22.5 ,        50 );                                                                                                  
insert into item values(       569 ,         2 ,     103130 ,          3.6 ,       180 );                                                                                                             
insert into item values(       569 ,         3 ,     103141 ,           20 ,        15 );                                                                                                  
insert into item values(       550 ,         1 ,     103120 ,         22.5 ,        60 );                                                                                                  
insert into item values(       550 ,         2 ,     103140 ,           19 ,        45 );                                                                                                  
insert into item values(       550 ,         3 ,     103141 ,           20 ,         5 );                                                                                                  
insert into item values(       550 ,         4 ,     102132 ,          3.4 ,        15 );                                                                                                  
insert into item values(       548 ,         1 ,     103140 ,           19 ,        30 );                                                                                                  
insert into item values(       548 ,         2 ,     102132 ,         3.23 ,        30 );                                                                                                  
insert into item values(       505 ,         1 ,     103130 ,          3.5 ,       100 );                                                                                                  
insert into item values(       505 ,         2 ,     103140 ,           20 ,        15 );                                                                                                  
insert into item values(       577 ,         1 ,     103121 ,           30 ,        20 );                                                                                                  
insert into item values(       577 ,         2 ,     103131 ,          3.9 ,       150 );                                                                                                  
insert into item values(       577 ,         3 ,     102132 ,         3.23 ,        25 );                                                                                                  
insert into item values(       533 ,         1 ,     103121 ,        27.35 ,        30 );                                                                                                  
insert into item values(       533 ,         2 ,     103130 ,         3.77 ,        80 );                                                                                                  
insert into item values(       561 ,         1 ,     103120 ,         22.5 ,        80 );                                                                                                  
insert into item values(       561 ,         2 ,     103130 ,         3.77 ,        70 );                                                                                                  
insert into item values(       561 ,         3 ,     103141 ,           20 ,        15 );                                                                                                  
insert into item values(       561 ,         4 ,     200376 ,         2.16 ,        90 );                                                                                                  
insert into item values(       506 ,         1 ,     103120 ,        20.88 ,        80 );                                                                                                  
insert into item values(       506 ,         2 ,     103130 ,          3.5 ,       180 );                                                                                                  
insert into item values(       506 ,         3 ,     103141 ,           20 ,        15 );                                                                                                                                      
insert into item values(       530 ,         1 ,     103121 ,        25.91 ,        50 );                                                                                                  
insert into item values(       530 ,         2 ,     103130 ,          3.6 ,       200 );                                                                                                  
insert into item values(       530 ,         3 ,     103140 ,           19 ,        40 );                                                                                                  
insert into item values(       530 ,         4 ,     103141 ,           20 ,        10 );                                                                                                  
insert into item values(       530 ,         5 ,     102132 ,          3.4 ,        15 );                                                                                                  
insert into item values(       545 ,         1 ,     103140 ,           19 ,        25 );                                                                                                  
insert into item values(       557 ,         1 ,     103120 ,        23.75 ,        40 );                                                                                                  
insert into item values(       557 ,         2 ,     103121 ,           30 ,        10 );                                                                                                  
insert into item values(       557 ,         3 ,     103140 ,           19 ,        35 );                                                                                                  
insert into item values(       557 ,         4 ,     200376 ,         2.16 ,        80 );                                                                                                  
insert into item values(       557 ,         5 ,     200380 ,          3.4 ,       110 );                                                                                                  
insert into item values(       546 ,         1 ,     103120 ,         22.5 ,        50 );                                                                                                  
insert into item values(       546 ,         2 ,     103121 ,           30 ,        20 );                                                                                                  
insert into item values(       546 ,         3 ,     103130 ,          3.6 ,       120 );                                                                                                  
insert into item values(       546 ,         4 ,     103131 ,          3.9 ,       140 );                                                                                                  
insert into item values(       546 ,         5 ,     103140 ,           19 ,        40 );                                                                                                  
insert into item values(       546 ,         6 ,     103141 ,           20 ,        10 );                                                                                                  
insert into item values(       510 ,         1 ,     103120 ,        20.88 ,        60 );                                                                                                  
insert into item values(       510 ,         2 ,     103131 ,         4.19 ,        20 );                                  


CREATE TABLE PRICE(
PRODUCT_ID BIGSERIAL NOT NULL, 
LIST_PRICE INTEGER NULL, 
MIN_PRICE MONEY NULL, 
START_DATE DATE NOT NULL, 
END_DATE DATE NULL,  
PRIMARY KEY (PRODUCT_ID, START_DATE),  
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
);

insert into price values(     100871 ,          5 ,       3.20 , '01-JAN-1989' , '01-DEC-1989' );      
insert into price values(     100890 ,         58 ,      46.40 , '01-JAN-1989' , NULL          );      
insert into price values(     100890 ,         54 ,      40.50 , '01-JUN-1988' , '31-DEC-1988' );      
insert into price values(     100860 ,         35 ,      28.00 , '01-JUN-1990' , NULL          );      
insert into price values(     100860 ,         32 ,      25.60 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     100860 ,         30 ,      24.00 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     100861 ,         45 ,      36.00 , '01-JUN-1990' , NULL          );      
insert into price values(     100861 ,         42 ,      33.60 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     100861 ,         39 ,      31.20 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     100870 ,          3 ,       2.40 , '01-JAN-1990' , NULL          );      
insert into price values(     100870 ,          2 ,       1.90 , '01-JAN-1989' , '01-DEC-1989' );      
insert into price values(     100871 ,          6 ,       4.80 , '01-JAN-1990' , NULL          );      
insert into price values(     101860 ,         24 ,      18.00 , '15-FEB-1989' , NULL          );      
insert into price values(     101863 ,         13 ,       9.40 , '15-FEB-1989' , NULL          );      
insert into price values(     102130 ,          3 ,       2.80 , '18-AUG-1989' , NULL          );      
insert into price values(     200376 ,          2 ,       1.75 , '15-NOV-1990' , NULL          );      
insert into price values(     200380 ,          4 ,       3.20 , '15-NOV-1990' , NULL          );      
insert into price values(     103120 ,         23 ,      18.60 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     103120 ,         24 ,      19.20 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     103120 ,         25 ,      20.00 , '01-JUN-1990' , NULL          );      
insert into price values(     103121 ,         28 ,      22.30 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     103121 ,         29 ,      23.00 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     103121 ,         30 ,      24.00 , '01-JUN-1990' , NULL          );      
insert into price values(     103130 ,          4 ,       3.50 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     103130 ,          4 ,       3.60 , '01-JAN-1990' , NULL          );      
insert into price values(     103131 ,          4 ,       3.60 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     103131 ,          5 ,       3.90 , '01-JAN-1990' , NULL          );      
insert into price values(     103140 ,         20 ,      15.00 , '15-FEB-1989' , NULL          );      
insert into price values(     103141 ,         20 ,      15.00 , '15-FEB-1989' , NULL          );      
insert into price values(     102132 ,          3 ,       2.80 , '18-AUG-1989' , NULL          );      
insert into price values(     104350 ,         40 ,      32.00 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     104350 ,         42 ,      33.60 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     104350 ,         44 ,      35.30 , '01-JUN-1990' , NULL          );      
insert into price values(     104351 ,         24 ,      18.90 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     104351 ,         25 ,      19.80 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     104351 ,         26 ,      20.80 , '01-JUN-1990' , NULL          );      
insert into price values(     104352 ,         50 ,      35.00 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     104352 ,         54 ,      37.80 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     104352 ,         58 ,      40.80 , '01-JUN-1990' , NULL          );      
insert into price values(     104360 ,         36 ,      29.50 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     104360 ,         39 ,      32.00 , '01-JAN-1990' , NULL          );      
insert into price values(     104361 ,         47 ,      33.00 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     104361 ,         50 ,      35.00 , '01-JAN-1990' , NULL          );      
insert into price values(     104362 ,          5 ,       4.00 , '15-FEB-1989' , NULL          );      
insert into price values(     102134 ,          3 ,       2.80 , '18-AUG-1989' , NULL          );      
insert into price values(     105123 ,         36 ,      29.00 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     105123 ,         38 ,      32.00 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     105123 ,         40 ,      34.00 , '01-JUN-1990' , NULL          );      
insert into price values(     105124 ,         10 ,       7.60 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     105124 ,         12 ,       9.00 , '01-JAN-1990' , '31-MAY-1990' );      
insert into price values(     105124 ,         15 ,      10.00 , '01-JUN-1990' , NULL          );      
insert into price values(     105125 ,          2 ,       1.70 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     105125 ,          3 ,       2.60 , '01-JAN-1990' , NULL          );      
insert into price values(     105126 ,          5 ,       4.30 , '01-JAN-1989' , '31-DEC-1989' );      
insert into price values(     105126 ,          6 ,       5.00 , '01-JAN-1990' , NULL          );      
insert into price values(     105127 ,          6 ,       5.00 , '15-NOV-1990' , NULL          );      
insert into price values(     105128 ,         10 ,       8.00 , '15-NOV-1990' , NULL          );      
insert into price values(     102136 ,          3 ,       2.80 , '18-AUG-1989' , NULL          );      


CREATE TABLE SALARY_GRADE(
GRADE_ID BIGSERIAL NOT NULL, 
LOWER_BOUND MONEY NULL, 
UPPER_BOUND MONEY NULL,  
PRIMARY KEY (GRADE_ID)
);

insert into salary_grade values(         1 ,         700 ,        1200 );
insert into salary_grade values(         2 ,        1201 ,        1400 );
insert into salary_grade values(         3 ,        1401 ,        2000 );
insert into salary_grade values(         4 ,        2001 ,        3000 );
insert into salary_grade values(         5 ,        3001 ,        9999 );
