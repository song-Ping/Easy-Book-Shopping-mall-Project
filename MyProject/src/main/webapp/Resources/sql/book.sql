CREATE TABLE book(
	p_id varchar(200) not null,
	p_category varchar(100),
	p_name varchar(200) not null,
	p_releaseDate varchar(50),
	p_author varchar(100) not null,
	p_publisher varchar(200) not null,
	p_description varchar(4000),
	p_unitPrice INTEGER,
	p_condition varchar(20),
	p_unitsInStock INTEGER,
	p_fileName varchar(100),
	PRIMARY KEY (p_id)
);


select * from book;

INSERT INTO book VALUES('B0001','인문', '오강남의 생각', '2022/06/24', '오강남','현암사', 
'『예수는 없다』로 근본주의가 지배하는 한국 기독교에 파문을 일으킨 우리 시대의 대표 비교종교학자 오강남. 그가 기독교와 종교, 사회, 삶에 대해 던지는 날카로운 통찰들!',16200,'New',100,'B0001.jpg')
	
drop table book;