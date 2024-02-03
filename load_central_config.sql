INSERT INTO administration.profile(
    profile_key,
    name,
    price,
    number_users,
    profile_details
) values (
    nextval('profile_key_seq'),
    'main',
    '500',
    '9999999',
    'Global Access'
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

INSERT INTO administration.site(
    site_key,
    name,
    address,
    city,
    state,
    country,
    document,
    phone,
    social_media,
    license_alert,
    creation_date,
    discount,
    profile_key
) values (
    nextval('site_key_seq'),
    'BMS System',
    'Rua X, 123',
    'Campinas',
    'Sao Paulo',
    'Brasil',
    '',
    '',
    '',
    10,
    now(),
    0,
    1
);

INSERT INTO administration.license(
    license_key,
    license_number,
    creation_date,
    expire_date,
    cost,
    site_key,
    profile_key
) values (
    nextval('license_key_seq'),
    MD5('BMS Sistemas'),
    now(),
    now() + INTERVAL '30 DAYS',
    100.00,
    1,
    1
);

INSERT INTO administration.user(
    user_key,
    login,
    name,
    email,
    phone,
    phone2,
    status,
    active_date,
    site_key
) values (
    nextval('user_key_seq'),
    'carlos.martins',
    'Carlos Martins',
    'cmartins.dev@gmail.com',
    '+55 19 98152-0912',
    '',
    'Active',
    now(),
    1
);

INSERT INTO administration.user(
    user_key,
    login,
    name,
    email,
    phone,
    phone2,
    status,
    active_date,
    site_key
) values (
    nextval('user_key_seq'),
    'francisco.bianchi',
    'Francisco Bianchi',
    'franciscotb@gmail.com',
    '+1 256 529-3935',
    '',
    'Active',
    now(),
    1
);