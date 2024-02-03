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
    'Global Acess'
);

