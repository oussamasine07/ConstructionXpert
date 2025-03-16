create database constructionxpert;
user constructionxpert;

create table admins (
    id int auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null
);

create table projects (
    id int auto_increment primary key,
    admin_id int not null,
    name varchar(255) not null,
    description text,
    startDate date not null,
    endDate date not null,
    budget decimal(10, 2) not null,
    foreign key(admin_id) references admins(id) on delete cascade
);

create table tasks (
    id int auto_increment primary key,
    project_id int not null,
    name varchar(255) not null,
    description text,
    endDate date not null,
    endDate date not null,
    foreign key(project_id) references projects(id) on delete cascade
);

create table suppliers (
    id int auto_increment primary key,
    name varchar(255) not null,
    address varchar(255),
    phone varchar(255),
    email varchar(255)
);

create table resources (
    id int auto_increment primary key,
    supplier_id int not null,
    name varchar(255) not null,
    quantity int not null,
    unitPrice decimal(10, 2) not null,
    totalPrice decimal(10, 2) not null
);

create table consumed_resources (
    id int auto_increment primary key,
    task_id int not null,
    resource_id int not null,
    quantity int not null,
    unitPrice decimal(10, 2) not null,
    totalPrice decimal(10, 2) not null
);




















