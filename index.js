import { PGlite } from "@electric-sql/pglite";
import fs from "node:fs/promises";

const setupDatabase = async () => {
  const db = new PGlite("./.pgdata");

  try {
    const tableExists = await db.query(`
      SELECT EXISTS (
        SELECT FROM information_schema.tables
        WHERE table_name = 'cars'
      );
    `);

    if (!tableExists.rows[0].exists) {
      const createTables = await fs.readFile("create-tables.sql", "utf-8");
      await db.exec(createTables);

      const insertData = await fs.readFile("insert-data.sql", "utf-8");
      await db.exec(insertData);

      // const alterTable = await fs.readFile("alter-table.sql", "utf-8");
      // await db.exec(alterTable);

      // const insertNewData = await fs.readFile("insert-new-data.sql", "utf-8");
      // await db.exec(insertNewData);
    }

    const query = await fs.readFile("query.sql", "utf-8");
    const result = await db.query(query);

    console.clear();
    console.table(result.rows);
  } catch (err) {
    console.error(err);
  }
};

setupDatabase();
