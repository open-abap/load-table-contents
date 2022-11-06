import {SQLiteDatabaseClient} from "@abaplint/database-sqlite";

export async function setup(abap, schemas, insert) {
  abap.context.databaseConnections["DEFAULT"] = new SQLiteDatabaseClient();
  await abap.context.databaseConnections["DEFAULT"].connect();
  for (const s of schemas.sqlite) {
    await abap.context.databaseConnections["DEFAULT"].execute(s);
  }
  for (const i of insert) {
    await abap.context.databaseConnections["DEFAULT"].execute(i);
  }
}