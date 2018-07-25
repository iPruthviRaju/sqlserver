/******************************
** File:    cursor_to_truncate_tables_with_prefix.sql
** Name:	cursor_to_truncate_tables_with_prefix
** Desc:	Cursor to truncate data from tables with prefix
** Auth:	Pruthvi
** Date:	July 25th, 2018
**************************
** Change History
**************************
** PR   Date        Author  Description 
** --   --------   -------   ------------------------------------
** 1    07/25/2018  Pruthvi	 Cursor to truncate data from tables with prefix
*******************************/
declare @tblname varchar(255)

declare tbl_cursor cursor for
select Name from sys.tables where name like 'prefix%' order by name

open tbl_cursor
fetch next from tbl_cursor into @tblname

while @@FETCH_STATUS = 0
begin
	EXECUTE ('truncate table '+ @tblname) -- this is where i get an error
	fetch next from tbl_cursor into @tblname
end 

close tbl_cursor

deallocate tbl_cursor 