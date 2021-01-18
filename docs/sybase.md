# Sybase

__Links__

*   [Alphabetical list of functions][]

[Alphabetical list of functions]: http://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.infocenter.dc38151.1510/html/iqrefbb/BABHEJCF.htm

__Table info__

```sql
sp_help Hovedoplysning
```

__Example:__

```R
dbGetQuery(conn, "sp_help Hovedoplysning")
            Name Owner Object_type Object_status         Create_date
1 Hovedoplysning   dbo        view         merge Apr  8 2013  1:27PM
```

__Table schema__

```sql
sp_columns Hovedoplysning
```

__Example:__

```R
dbGetQuery(conn, "sp_columns Hovedoplysning")
   table_qualifier table_owner     table_name                column_name data_type type_name precision length scale    radix nullable remarks ss_data_type colid column_def sql_data_type sql_datetime_sub char_octet_length    ordinal_position is_nullable
```
