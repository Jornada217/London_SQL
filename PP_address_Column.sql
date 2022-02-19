
-- Concatenate columns 'saon', 'paon', 'street' into 'address'

-- Add the address column
alter table [gla].[dbo].[pp-complete1]
	add address as CONCAT (saon, ', ', paon, ', ', street);

select top 100 * from [gla].[dbo].[pp-complete1];

alter table [gla].[dbo].[pp-complete1] 
add address1 varchar(150);

update [gla].[dbo].[pp-complete1] set address1 = address;
alter table [gla].[dbo].[pp-complete1] drop column address;

-- Change column 'address1' name to 'address' before executing this command.
update [gla].[dbo].[pp-complete1]
	set address = case when left(address, 1) = ', ' then right(address, len(address)-2)
		else address end
