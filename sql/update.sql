##################### resources ##################
update resources
    set
        admin_id = ?,
        supplier_id = ?,
        name = ?,
        quantity = ?,
        unitPrice = ?
where id = ?;

##################### projects ##################
update projects
    set
        name = ?,
        description = ?,
        startDate = ?,
        endDate = ?,
        budget  = ?
where id = ?;

##################### tasks ##################
update tasks
    set
        name = ?,
        description = ?,
        startDate = ?,
        endDate = ?
where id = ?;













