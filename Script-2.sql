1.1.1
����� ����� �� patient_id. ������� ��� ����������
select * from f_user fu 
where patient_id = 30000008371114

1.1.2
����� ����� �� ���, ������� ������ patient_id

select patient_id from f_user fu 
where oms_number = '6470960882052973'

1.2.1
����� ��� ������� � ������� ���������� "7.*", ������� ��� ����������

select * from f_device fd 
where app_version like '7.%'

1.2.2
����� ��� ������� � ���������� ����, ������� ������ �����

select device_guid from f_device fd 
where platform = 'APPLE'

1.2.3
������� ���������� �������� ��������� ������

select count(device_guid) from f_device fd 
where platform ='HUAWEI'

1.2.4
�������� ��������� ��� ����������� ������� �� �����. ������� ��� ����������

select * from f_device_settings fds
join f_device fd 
on fds.device_guid = fd.device_guid 
where fd.device_guid ='a604e820-31f0-436e-8b73-9688ffb75e6c'

1.2.5
�������� �������, � ������� ��������� �������� ����������� �� ������. ������� ��� ���������� �������

select * from f_device_settings fds 
join f_device fd 
on fds.device_guid = fd.device_guid 
where fds.appointment = false


1.3.1
����� ��� ������� �������� �� ��� ��������, ������ �������������� � ���������� �������

select fd.device_guid from f_device fd
join f_user_device fud 
on fd.device_guid = fud.device_guid 
join f_user fu 
on fud.user_id = fu.id 
where fu.oms_number='400000000180988' and fd.platform ='ANDROID' and fud.authentication =true 

1.4.1
����� ����������� ������������ � ������ �� ����� �� �������������� ������. 

select fnt from f_notification_task fnt 
join f_notification fn 
on fnt.notification_id = fn.id 
where fn.title ='������ �� ����� � �����' and fn.id ='13799956'


1.4.2
����� ��� ����������� ������������ � ����� pr� �� �������� ���� ���������� ����������� �� ����������

select fn from f_notification fn 
join f_notification_task fnt 
on fn.id = fnt.notification_id 
join d_notification_type dnt 
on fn.notification_type_id =dnt.id 
where dnt.title ='pr' and fnt.status = 'SEND' and fn.user_id ='216824'


1.4.3
������ ���� ������, �� �������� ����� �������� ������, ����������� ���������

select  fn.id as notificationId, fnt.send_date  as sendDate, fn.title , fn.description , fn.viewed as isViewed from f_user fu 
join f_user_device fud 
	on fu.id =fud.user_id 
join f_notification_task fnt 
	on fud.device_guid = fnt.device_guid 
join f_notification fn 
	on fnt.notification_id = fn.id 
where ((fud.user_id =(select fu.id from f_user fu where fu.patient_id='19278176') 
and fnt.device_guid = 'a8c773ee-33f4-484e-91db-a8a81241a99b') 
and (fnt.status='SEND' or fnt.status='DONT_SEND') 
and fnt.send_date > '2024-11-28 00:00:00.000')
and (fn.id=fnt.notification_id  and fn.user_id = fud.user_id  and fn.notification_type_id != '7')
order by fnt.send_date desc 




1.4.4
�������� �������������� �����������, ������� ������ ���� ������� ������� ������ �������� 

select fnt.notification_id  from f_notification_task fnt 
join f_notification fn 
	on fnt.notification_id = fn.id 
where fnt.send_date <'2024-11-28 00:00:00.000' 



�������� ��� �������� �� patient_id ����������� �� ������ � ���, ������� ������ ���� �������� ���������� ������ 

select fnt from f_notification_task fnt 
join f_notification fn 
	on fnt.notification_id =fn.id 
join d_notification_type dnt 
	on fn.notification_type_id = dnt.id 
where (fnt.status ='CREATE' or fnt.status ='CREATE_SILENT')
and fn.notification_type_id ='1'

