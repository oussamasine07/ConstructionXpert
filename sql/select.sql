###################### Reources ######################
select * from suppliers
where admin_id = ?;

select * from resources
where admin_id = ?;

select
    resources.id as resource_id,
    resources.name as resource_name,
    resources.quantity,
    resources.unitPrice,
    resources.totalPrice,
    suppliers.id as supplier_id,
    suppliers.name as supplier_name
from resources
inner join suppliers
on suppliers.id = resources.supplier_id
where resources.id = ?;

###################### Projects ######################
select * from projects
where admin_id = ?;

select * from projects
where id = ?;

###################### Tasks ######################
select * from tasks
where project_id = ?;

######################### Resources #########################
select * from resources
where id = ?;

######################### Consumed Resources #########################
select * from tasks
where id = ?;

select
    resources.name,
    consumed_resources.quantity,
    consumed_resources.unitPrice,
    consumed_resources.totalPrice
from resources
inner join consumed_resources
on resources.id = consumed_resources.resource_id
inner join tasks
on tasks.id = consumed_resources.task_id
where consumed_resources.task_id = ?;




















