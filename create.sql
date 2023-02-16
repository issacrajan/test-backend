create sequence revinfo_seq start with 1 increment by 50;

    create table app_policy_endpoint_mapping (
       id varchar(255) not null,
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
        created_ts timestamp(6) with time zone,
        updated_by varchar(255),
        updated_ts varchar(255),
        enabled varchar(255),
        role_desc varchar(255),
        role_name varchar(255),
        primary key (id)
    );

    create table app_role_policy (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6) with time zone,
        updated_by varchar(255),
        updated_ts varchar(255),
        role_id varchar(255),
        role_policy varchar(255),
        role_policy_state varchar(255),
        primary key (id)
    );

    create table app_user_role (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6) with time zone,
        updated_by varchar(255),
        updated_ts varchar(255),
        role_id varchar(255),
        user_id varchar(255),
        primary key (id)
    );

    create table company_job (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6) with time zone,
        updated_by varchar(255),
        updated_ts varchar(255),
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

    create table revinfo (
       rev integer not null,
        revtstmp bigint,
        primary key (rev)
    );

    create table user_info (
       id varchar(255) not null,
        created_by varchar(255),
        created_ts timestamp(6) with time zone,
        email varchar(255) not null,
        lastname varchar(255),
        location varchar(255),
        name varchar(255),
        password varchar(255) not null,
        updated_by varchar(255),
        updated_ts timestamp(6) with time zone,
        primary key (id)
    );

    alter table user_info 
       add constraint idx_user_info_email unique (email);

    alter table company_job_aud 
       add constraint FKr8x656xiswap6aqtc5n8q0cwk 
       foreign key (rev) 
       references revinfo;
