INSERT INTO administration.user(
    user_key,
    username,
    name,
    email,
    phone,
    phone2,
    status,
    type,
    number_of_users,
    creation_date,
    parent_user_key
) values (
    nextval('user_key_seq'),
    'carlos.martins',
    'Carlos Martins',
    'cmartins.dev@gmail.com',
    '+55 19 98152-0912',
    '',
    'Active',
    'Owner',
    1,
    now(),
    null
);

INSERT INTO administration.user_details(
    user_details_key,
    address,
    city,
    state,
    country,
    timezone,
    document,
    social_media,
    user_key
) values (
    nextval('user_details_key_seq'),
    'Rua X, 123',
    'Campinas',
    'Sao Paulo',
    'Brasil',
    '',
    '',
    '',
    1
);

INSERT INTO administration.user(
    user_key,
    username,
    name,
    email,
    phone,
    phone2,
    status,
    type,
    number_of_users,
    creation_date,
    parent_user_key
) values (
    nextval('user_key_seq'),
    'francisco.bianchi',
    'Francisco Bianchi',
    'franciscotb@gmail.com',
    '+1 256 529-3935',
    '',
    'Active',
    'Owner',
    1,
    now(),
    null
);

INSERT INTO administration.user_details(
    user_details_key,
    address,
    city,
    state,
    country,
    timezone,
    document,
    social_media,
    user_key
) values (
    nextval('user_details_key_seq'),
    'Rua Y, 567',
    'Huntsville',
    'Alabama',
    'Estados Unidos da America',
    '',
    '',
    '',
    2
);

INSERT INTO administration.secret_manager(
    secret_manager_key,
    salt,
    passhash,
    active,
    expire_date,
    user_key
) values (
    nextval('secret_manager_key_seq'),
    'xxxx',
    'yyyy',
    true,
    now(),
    1
);

INSERT INTO administration.secret_manager(
    secret_manager_key,
    salt,
    passhash,
    active,
    expire_date,
    user_key
) values (
    nextval('secret_manager_key_seq'),
    'aaaa',
    'bbbb',
    true,
    now(),
    2
);

INSERT INTO administration.profile(
    profile_key,
    name,
    description,
    enable,
    price,
    user_key
) values (
    nextval('profile_key_seq'),
    'All Modules',
    'Provide access to all modules',
    true,
    500,
    1
);

INSERT INTO administration.page(
    page_key,
    name,
    menu_name,
    profile_key
) values (
    nextval('page_key_seq'),
    'Cliente',
    'Menu 1',
    1
);

INSERT INTO administration.page(
    page_key,
    name,
    menu_name,
    profile_key
) values (
    nextval('page_key_seq'),
    'Pedidos',
    'Menu 2',
    1
);

INSERT INTO administration.license(
    license_key,
    license_number,
    aquisition_date,
    expire_date,
    price,
    user_key,
    profile_key
) values (
    nextval('license_key_seq'),
    MD5(now() || ' BMS Sistemas'),
    now(),
    now() + INTERVAL '30 DAYS',
    500.00,
    1,
    1
);

INSERT INTO administration.license(
    license_key,
    license_number,
    aquisition_date,
    expire_date,
    price,
    user_key,
    profile_key
) values (
    nextval('license_key_seq'),
    MD5(now() || ' BMS Sistemas'),
    now(),
    now() + INTERVAL '30 DAYS',
    500.00,
    2,
    1
);
