
CREATE TRIGGER `calc_totalPrice_on_resource_insert`
BEFORE INSERT
ON `resources`
FOR EACH ROW
SET NEW.totalPrice = NEW.quantity * NEW.unitPrice;

CREATE TRIGGER `calc_totalPrice_on_resource_update`
BEFORE UPDATE
ON `resources`
FOR EACH ROW
SET NEW.totalPrice = NEW.quantity * NEW.unitPrice;

CREATE TRIGGER `update_resource_quantity_on_insert_consumed_resource`
AFTER INSERT
ON `consumed_resources`
FOR EACH ROW
UPDATE resources
    set quantity = quantity - NEW.quantity
    where id = NEW.resource_id;

CREATE TRIGGER `update_resource_quantity_on_delete_consumed_resource`
AFTER DELETE
ON `consumed_resources`
FOR EACH ROW
UPDATE resources
    set quantity = quantity + OLD.quantity
    where id = OLD.resource_id;








