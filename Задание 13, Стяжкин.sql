1.1.1
все записи со статусом Ќ≈ cancelled

select * from f_hospitalizations_appointment 
where event_type != 'cancelled'

1.1.2
все записи с датой до 01-09-2024

select * from f_hospitalizations_appointment
where event_date < '2024-09-01'

1.1.3
все записи на процедуру(resource_procedure не null)

select * from f_hospitalizations_appointment 
where resource_procedure is not null 

1.2.1
получить только названи€ тогглов со значением state = true, отсортировать по алфавиту по возрастанию

select name from f_togglers ft 
where state = true 
order by "name" asc 

1.2.2
получить количество тогглов со значением state = false

select count(name) from f_togglers ft 
where state = false

1.2.3
обновить значение любого тоггла на противоположенное, затем обновить обратно

update f_togglers set state =false 
where "name" ='isLifeCEnabled';

update  f_togglers set state =true  
where "name" ='isLifeCEnabled'

1.3.1
только баннеры, у которых есть tite и content. вернуть код баннера, title и текст контента, отсортировать по id баннера

select fb.id, fb .title , fbc."text" 
from f_banners fb 
join f_banner_content fbc 
on fb.id =fbc.banner_id 
where fb.title is not null and fbc."text" is not null
order by fb.id 

