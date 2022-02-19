select top 100 * from [gla].[dbo].[pp-complete1];
select top 100 * from [gla].[dbo].[certificates_combined2];

update [gla].[dbo].[pp-complete1] set address = lower(address);
update [gla].[dbo].[certificates_combined2] set ADDRESS = lower(ADDRESS);

-- merge and create new table:
select [ADDRESS],[address_pp],[POSTCODE],[LOCAL_AUTHORITY_LABEL],[LODGEMENT_DATE],[deed_date],[CURRENT_ENERGY_RATING],[TOTAL_FLOOR_AREA]
      ,[NUMBER_HABITABLE_ROOMS],[NUMBER_HEATED_ROOMS],[MULTI_GLAZE_PROPORTION],[WINDOWS_DESCRIPTION]
      ,[PROPERTY_TYPE],[BUILT_FORM],[FLOOR_HEIGHT],[CONSTRUCTION_AGE_BAND], [prop_type_pp], [new_build], [duration], [category], [price_paid]
into [gla].[dbo].[final_merge]
from [gla].[dbo].[certificates_combined2]
inner join [gla].[dbo].[pp-complete1]
on certificates_combined2.ADDRESS = [gla].[dbo].[pp-complete1].address_pp;

delete from [gla].[dbo].[final_merge]
where [deed_date] < [LODGEMENT_DATE];

select top 100 * from [gla].[dbo].[final_merge];
sp_help [gla].[dbo].[final_merge];