delete from resources
where id = ?;

delete from projects
where id = ?;

delete from consumed_resources
where task_id = ?;