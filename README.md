# hasura-unlogged

A reproduction of a Hasura bug where querying an [unlogged][unlogged] Postgres table fails with the error:

```
cannot access temporary or unlogged relations during recovery
```

This demo creates an unlogged table, which you can find in [**up.sql**](./hasura/migrations/default/1699363022071_unlogged_table/up.sql).

## Getting started

Run things with:

```
make
```

This will launch a Hasura Console where you'll be able to run GraphQL operations and see the error.

### Creating a record

This works just fine:

```graphql
mutation CreateErrorLog {
  errorLog: insertErrorLogOne(
    object: {
      message: "message 1"
    }
  ) {
    message
  }
}
```

### Querying the unlogged table

Mysteriously, this works as well (I was expecting it to fail):

```graphql
query ListErrorLogs {
  errorLog {
    message
  }
}
```
