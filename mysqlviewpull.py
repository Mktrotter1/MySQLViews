import mysql.connector
import os

def get_mysql_views():
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host='34.94.105.2',
        user='appsheet',
        password='AP!tst4m@3',
        database='information_schema'
    )

    cursor = connection.cursor()

    # Get all databases
    cursor.execute("SHOW DATABASES")
    databases = [database[0] for database in cursor.fetchall()]

    views = {}

    # Iterate through each database and retrieve views
    for database in databases:
        # Use the current database
        cursor.execute(f"USE `{database}`")

        # Get views in the current database
        cursor.execute("SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'VIEW'")
        view_names = [view[0] for view in cursor.fetchall()]

        # Get SQL for each view
        for view_name in view_names:
            try:
                cursor.execute(f"SHOW CREATE VIEW `{view_name}`")
                view_sql = cursor.fetchone()[1]
                views[f"{database}.{view_name}"] = view_sql
            except mysql.connector.Error as err:
                print(f"Error retrieving view {view_name}: {err}")

    cursor.close()
    connection.close()

    return views

def main():
    views = get_mysql_views()

    # Write SQL statements to a file
    with open("mysql_views.sql", "w") as file:
        for view, sql in views.items():
            file.write(f"-- View: {view}\n")
            file.write(sql)
            file.write("\n\n")

    print("MySQL views exported to mysql_views.sql")

if __name__ == "__main__":
    main()