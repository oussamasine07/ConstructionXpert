######################### admins #########################
insert into admins
    (name, email, password)
values
    ("sine oussama", "sine@gmail.com", "123456");

######################### Suppliers #########################
INSERT INTO suppliers
    (admin_id, name, address, phone, email)
VALUES
    (1, 'BuildMaster Supplies', '123 Concrete St, New York, NY', '+1 212-555-7890', 'info@buildmaster.com'),
    (1, 'SteelWorks Ltd.', '456 Industrial Ave, Chicago, IL', '+1 312-555-4321', 'sales@steelworks.com'),
    (1, 'ProCement Co.', '789 Masonry Rd, Dallas, TX', '+1 972-555-8765', 'contact@procement.com'),
    (1, 'TimberPro Inc.', '321 Lumber Ln, Seattle, WA', '+1 206-555-3456', 'support@timberpro.com'),
    (1, 'MegaTools Hardware', '654 Tools Blvd, Miami, FL', '+1 305-555-9876', 'info@megatools.com'),
    (1, 'Concrete Plus', '987 Foundation Dr, Los Angeles, CA', '+1 213-555-6543', 'orders@concreteplus.com'),
    (1, 'RapidMix Cement', '741 QuickMix Ave, Houston, TX', '+1 713-555-1111', 'sales@rapidmix.com'),
    (1, 'HeavyDuty Steel', '852 Reinforce Rd, Denver, CO', '+1 720-555-2222', 'contact@heavydutysteel.com'),
    (1, 'BrickMasters', '963 Brick Lane, Atlanta, GA', '+1 404-555-3333', 'info@brickmasters.com'),
    (1, 'BuildRight Materials', '159 Construction St, Phoenix, AZ', '+1 602-555-4444', 'sales@buildright.com');


INSERT INTO resources
    (admin_id, supplier_id, name, quantity, unitPrice)
VALUES
    (?, ?, ?, ?, ?);

######################### Projects #########################

insert into projects
    (admin_id, name, description, startDate, endDate, budget)
values
    (?, ?, ?, ?, ?, ?);

######################### Tasks #########################
insert into tasks
    (project_id, name, description, startDate, endDate)
values
    (1, "task one", "thisnfn qlkh fkajf afkjhaf iuefuh iufh a kj", "2025-01-04", "2025-10-10"),
    (1, "task two", "thisnfnlkfna foaf aohf aoeiefhzoiehf ufh a kj", "2025-01-05", "2027-09-10");






