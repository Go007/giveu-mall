
-- 迁移表名CUS_CONTACT_ADDRESS, FK_CUS_BASE_INFO_CS_PERSON 到商城数据库GiveU_Store
-- 迁移筛选条件
SELECT * FROM CUS_CONTACT_ADDRESS WHERE ADDRESS_TYPE = 'CA05' AND STATE = true;
SELECT * FROM FK_CUS_BASE_INFO_CS_PERSON WHERE id_customer in (SELECT id_customer FROM CUS_CONTACT_ADDRESS WHERE ADDRESS_TYPE = 'CA05' AND STATE = true);

-- 迁移后在商城数据库GiveU_Store执行
INSERT INTO t_user_address(id_person, user_name, phone, province, city, region, street, address, address_type, is_default, state, gmt_create, gmt_modified)
SELECT * FROM
(
SELECT base.ID_PERSON as id_person, addr.CUSNAME as user_name, addr.PHONE as phone, addr.PROVINCE as province, addr.CITY as city, addr.REGION as region, addr.STREET as street, addr.ADDRESS as address, 5 as address_type,
(case addr.IS_DEFAULT when b'1' then 1 else 0 end)as is_default,
1 as state, now(3) as gmt_create, now(3) as gmt_modified
FROM CUS_CONTACT_ADDRESS addr LEFT JOIN FK_CUS_BASE_INFO_CS_PERSON base ON addr.ID_CUSTOMER = base.ID_CUSTOMER
WHERE addr.ADDRESS_TYPE = 'CA05' AND addr.STATE = true AND addr.CREATE_TIME <= '2017-10-30 18:00:00' AND addr.UPDATE_TIME <= '2017-10-30 18:00:00'
)
AS fn_address;

