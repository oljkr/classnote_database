select * from album;

SELECT *
FROM ( SELECT *, @ROWNUM :=@ROWNUM+1 AS ROWNUM
          FROM ( SELECT album_no, album_name, artist_group_no, artist_solo_no, artist_name, album_image_name
                     FROM ( SELECT AA.album_no, AA.album_name, AA.artist_name, AA.album_image_name
                                FROM album AA ) BB, (SELECT @ROWNUM := 0) TMP 
         ORDER BY album_no DESC ) CC ) DD
WHERE 3<=ROWNUM AND ROWNUM<=5;

select * from song;

SELECT artist_group_no  FROM artist_group  WHERE artist_group_name =  "NewJeans";

select * from artist_group;
select * from artist_solo;
select * from artist_group_solo;

select *
from artist_group_solo join artist_group
on artist_group_no=1;

-- 그룹일 경우 - 그룹 자체 조회

select artist_group_no, artist_group_name, debut_date, artist_period, artist_genre, company_belongs, artist_image_name, artist_image_size, artist_view
from artist_group
where artist_group_no=2;

-- 그룹일 경우 - 멤버 개인
select G.artist_group_no, G.artist_group_name, GS.artist_solo_no, S.artist_solo_name, G.debut_date, G.artist_period, G.artist_genre, G.company_belongs, G.artist_view
from artist_group G inner join artist_group_solo GS
  on G.artist_group_no = GS.artist_group_no 
                  inner join artist_solo S
  on GS.artist_solo_no = S.artist_solo_no
where G.artist_group_no=3;

-- 솔로일 경우
SELECT G.artist_group_no, G.artist_group_name, GS.artist_solo_no, S.artist_solo_name, S.debut_date, S.artist_period, S.artist_genre, S.company_belongs, S.artist_image_name, S.artist_image_size, S.artist_view
FROM artist_group G INNER JOIN artist_group_solo GS
ON G.artist_group_no = GS.artist_group_no
INNER JOIN artist_solo S
ON GS.artist_solo_no = S.artist_solo_no
WHERE S.artist_solo_no=6;
  
delete from artist_solo where artist_solo_no=4;

-- 그룹 개인 모두 조인해서 전체에서 조회
select G.artist_group_no, G.artist_group_name, GS.artist_solo_no, S.artist_solo_name, G.debut_date, G.artist_period, G.artist_genre, G.company_belongs, G.artist_view
from artist_group G inner join artist_group_solo GS
  on G.artist_group_no = GS.artist_group_no 
                  inner join artist_solo S
  on GS.artist_solo_no = S.artist_solo_no;

SELECT * FROM artist_group
UNION ALL
SELECT *
FROM artist_solo;

select GS.artist_group_no, GS.artist_solo_no, S.artist_solo_name, S.debut_date, S.artist_period, S.artist_genre, S.company_belongs
from artist_group_solo GS inner join artist_solo S
on GS.artist_solo_no = S.artist_solo_no
where GS.artist_solo_no !=1;

select G.artist_group_no, GS.artist_solo_no, G.artist_group_name, G.debut_date, G.artist_period, G.artist_genre, G.company_belongs
from artist_group_solo GS inner join artist_group G
on GS.artist_group_no = G.artist_group_no
where GS.artist_solo_no =1;

select GS.artist_group_no, GS.artist_solo_no, S.artist_solo_name, S.debut_date, S.artist_period, S.artist_genre, S.company_belongs
from artist_group_solo GS inner join artist_solo S
on GS.artist_solo_no = S.artist_solo_no
where GS.artist_solo_no !=1 
UNION
select G.artist_group_no, GS.artist_solo_no, G.artist_group_name, G.debut_date, G.artist_period, G.artist_genre, G.company_belongs
from artist_group_solo GS inner join artist_group G
on GS.artist_group_no = G.artist_group_no
where GS.artist_solo_no =1;

-- 개인만 & 그룹만을 UNION --키워드 추가
SELECT *
FROM (
		select GS.artist_group_no, GS.artist_solo_no
			  , S.artist_solo_name AS artist_name
			  , S.debut_date, S.artist_period, S.artist_genre, S.company_belongs
		from artist_group_solo GS inner join artist_solo S
		on GS.artist_solo_no = S.artist_solo_no
		where GS.artist_group_no =1
		UNION
		select G.artist_group_no, GS.artist_solo_no, G.artist_group_name, G.debut_date, G.artist_period, G.artist_genre, G.company_belongs
		from artist_group_solo GS inner join artist_group G
		on GS.artist_group_no = G.artist_group_no
		where GS.artist_solo_no =1 ) AA
WHERE AA.artist_name LIKE '%%';