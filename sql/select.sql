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
























