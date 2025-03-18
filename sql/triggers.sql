
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