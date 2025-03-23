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

select
    count(*) as count_resources
from resources
where resources.admin_id = ?;

###################### Projects ######################
select * from projects
where admin_id = ?;

select * from projects
where id = ?;

select
    count(*) as count_projects
from projects
where projects.admin_id = ?;

###################### Tasks ######################
select * from tasks
where project_id = ?;

select
    count(*)
from projects
         inner join tasks
                    on tasks.project_id = projects.id
where projects.id = ?;

######################### Resources #########################
select * from resources
where id = ?;

######################### Consumed Resources #########################
select * from tasks
where id = ?;

select
    resources.id,
    resources.name,
    resources.quantity as resource_quantity,
    consumed_resources.quantity as consumed_quantity,
    consumed_resources.unitPrice,
    consumed_resources.totalPrice
from resources
inner join consumed_resources
on resources.id = consumed_resources.resource_id
inner join tasks
on tasks.id = consumed_resources.task_id
where consumed_resources.task_id = ?;

select
    sum(consumed_resources.totalPrice) as sum_resources
from projects
         inner join tasks
                    on tasks.project_id = projects.id
         inner join consumed_resources
                    on consumed_resources.task_id = tasks.id
where projects.admin_id = ?;




















