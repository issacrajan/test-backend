create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        endpoint_data varchar(255),
        endpoint_method varchar(255),
        endpoint_url varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        role_policy varchar(255),
        role_policy_state varchar(255),
        app_roleid varchar(255),
        primary key (id)
    );

    create table app_user (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        location varchar(255),
        password varchar(255) not null,
        role_id varchar(255) not null,
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        version_col bigint not null,
        primary key (id)
    );

    create table company_job_aud (
       id varchar(255) not null,
        rev integer not null,
        revtype smallint,
        job_company varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_posted_by varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        primary key (rev, id)
    );

    create table dependent (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        dep_first_name varchar(255),
        dep_last_name varchar(255),
        dep_seq_num integer,
        relation_to_emp varchar(255),
        employee_id varchar(255),
        primary key (id)
    );

    create table employee (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        birth_date date,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table employee_product (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_date date,
        employee_id varchar(255),
        product_id varchar(255),
        primary key (id)
    );

    create table facility (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        effective_from_date date,
        facility_name varchar(255),
        primary key (id)
    );

    create table facility_phy_affl (
       facility_id varchar(255) not null,
        physician_id varchar(255) not null
    );

    create table physician (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6),
        updated_by varchar(255),
        updated_ts timestamp(6),
        version_num integer not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table product (
       product_id varchar(255) not null,
        prod_order integer not null,
        product_name varchar(255),
        primary key (product_id)
    );

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
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

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;

    alter table dependent 
       add constraint FKfoj6n1anlb465p1a4kra9tj0n 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FKrtamdxn3usij58rttef7bvkiy 
       foreign key (employee_id) 
       references employee;

    alter table employee_product 
       add constraint FK8odd9pb023515d3jtpcrsmwkr 
       foreign key (product_id) 
       references product;

    alter table facility_phy_affl 
       add constraint FKm5sjh3h7kjr22xbd0ib9desoc 
       foreign key (physician_id) 
       references physician;

    alter table facility_phy_affl 
       add constraint FK9t94j9ri9ol6804k6a3pvwln0 
       foreign key (facility_id) 
       references facility;
