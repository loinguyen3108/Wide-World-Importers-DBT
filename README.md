Welcome to Wide World Importers with DBT

### Using the starter project

1. Setup python and virtual environment.
```
pip install dbt dbt-postgres
```

2. Setup source data from microsoft [here](https://learn.microsoft.com/en-us/sql/linux/tutorial-restore-backup-in-sql-server-container?view=sql-server-ver16)

3. Setup **Airbyte** EL (Extract & Load) tool to extract data from MSSQL to PostgreSQL:
- [airbyte-docker](https://docs.airbyte.com/quickstart/deploy-airbyte/)
- Use airbyte to EL data.

4. Try running the following commands:
```
cd dbt_wwi
dbt deps
dbt run
dbt test
dbt docs generate
dbt docs serve
```


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
