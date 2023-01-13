begin;

insert into event(payload,created) values ('{}', now());
insert into event_last_applied(id, event_id)
select 1, max(id) from event
 on conflict (id) do
 update set event_id=(select max(id) from event);
;

commit;
