--PostgreSQL 9.6
--'\\' is a delimiter
​
create table recipes (
      page_no integer not null,
      title varchar(30) not null,
      unique(page_no)
);
​
insert into recipes values (1, 'Scrambled eggs');
insert into recipes values (2, 'Fondue');
insert into recipes values (3, 'Sandwich');
insert into recipes values (4, 'Tomato soup');
insert into recipes values (6, 'Liver');
​
CREATE TEMP TABLE rleft 
( 
    left_title varchar(30)
);
​
CREATE TEMP TABLE rright 
( 
    right_title varchar(30)
);
​
-- begin loop for creating left and right pages
​
do $$
​
declare
    counter integer := 0;
    book_size integer := (select ceil(count(*)) + 1 from recipes) * 2;
begin
LOOP 
      EXIT WHEN counter = book_size; 
      
      if (counter % 2) <> 0 then
          insert into rleft(left_title)
          select COALESCE(title) from recipes where page_no = counter;
      else
          insert into rright(right_title)
          select COALESCE(title) from recipes where page_no = counter;
      end if;
​
      counter := counter + 1; 
END LOOP ; 
​
end $$;
​
-- join together for result
​
select * from rleft;
select * from rright;
