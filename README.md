Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Export the staging DB

```bash
pg_dump -d wedtales_development -f wedtales_dev_db.psql
```

## Import the staging DB

```bash
sed -i -- 's/user_name/guochunzhong/g' wedtales_dev_db.psql
psql
DROP DATABASE wedtales_development;
CREATE DATABASE wedtales_development WITH ENCODING='UTF8' OWNER='guochunzhong';
\q
psql -d wedtales_development -f wedtales_dev_db.psql
```

