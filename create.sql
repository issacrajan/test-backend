
    create table company_job (
       id varchar(255) not null,
        job_cmpany_name varchar(255),
        job_location varchar(255),
        job_position varchar(255),
        job_status varchar(255),
        job_type varchar(255),
        job_posted_by varchar(255),
        primary key (id)
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

    alter table company_job 
       add constraint FKo0jaed74dr9wtymkxov18hxf8 
       foreign key (job_posted_by) 
       references user_info;
