create sequence REVINFO_SEQ start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        endpointData varchar(255),
        endpointMethod varchar(255),
        endpointUrl varchar(255),
        rolePolicy varchar(255),
        rolePolicyState varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        enabled varchar(255),
        roleDesc varchar(255),
        roleName varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        rolePolicy varchar(255),
        rolePolicyState varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        versionNum integer not null,
        email varchar(255) not null,
        firstName varchar(255),
        lastName varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        jobCompany varchar(255),
        jobLocation varchar(255),
        jobPosition varchar(255),
        jobPostedBy varchar(255),
        jobStatus varchar(255),
        jobType varchar(255),
        versionCol bigint not null,
        primary key (id)
    );

    create table company_job_AUD (
       id varchar(255) not null,
        REV integer not null,
        REVTYPE smallint,
        jobCompany varchar(255),
        jobLocation varchar(255),
        jobPosition varchar(255),
        jobPostedBy varchar(255),
        jobStatus varchar(255),
        jobType varchar(255),
        primary key (REV, id)
    );

    create table Dependent (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        versionNum integer not null,
        birthDate date,
        depFirstName varchar(255),
        depLastName varchar(255),
        dep_seq_num integer,
        relationToEmp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table Employee (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        versionNum integer not null,
        birthDate date,
        firstName varchar(255),
        gender varchar(255),
        lastName varchar(255),
        primary key (id)
    );

    create table EmployeeProduct (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        versionNum integer not null,
        effectiveDate date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table Facility (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        versionNum integer not null,
        effectiveFromDate date,
        facilityName varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table Physician (
       id varchar(255) not null,
        createdBy varchar(255),
        createdTs timestamp(6),
        updatedBy varchar(255),
        updatedTs timestamp(6),
        versionNum integer not null,
        firstName varchar(255),
        lastName varchar(255),
        primary key (id)
    );

    create table Product (
       productId varchar(255) not null,
        prodOrder integer not null,
        productName varchar(255),
        primary key (productId)
    );

    create table REVINFO (
       REV integer not null,
        REVTSTMP bigint,
        primary key (REV)
    );

    alter table app_user 
       add constraint idx_app_user_email unique (email);

    alter table app_role_policy 
       add constraint FKacor24g7q2q1hmsglk2ml0jgs 
       foreign key (app_roleid) 
       references app_role;

    alter table app_user 
       add constraint FKn1w45cvkd2bdpvu78k056mckg 
       foreign key (role_id) 
       references app_role;

    alter table company_job_AUD 
       add constraint FKb3g22x9ti2b83mh5269ihnh9p 
       foreign key (REV) 
       references REVINFO;

    alter table Dependent 
       add constraint FKc34tfsv6h7mdjnru608xb1dxc 
       foreign key (employee_id) 
       references Employee;

    alter table EmployeeProduct 
       add constraint FKfpwmi0kxopv07xrpmsuostgmb 
       foreign key (employee_id) 
       references Employee;

    alter table EmployeeProduct 
       add constraint FKs9u7whci3lut5cqrkok10jt8i 
       foreign key (product_id) 
       references Product;

    alter table facility_phy_affl 
       add constraint FKrn27x2cfh48adl07ybhn7gxlx 
       foreign key (physician_id) 
       references Physician;

    alter table facility_phy_affl 
       add constraint FKtiyxb2adx24wx9rum9t2rhw54 
       foreign key (facility_id) 
       references Facility;
