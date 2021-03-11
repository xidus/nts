import os
import sqlite3
import collections as cs


path_db = 'db.sqlite'
if not os.path.isfile(path_db):
    raise SystemExit(1)


def main():
    # with open('tables.txt', encoding='utf-8') as f:
    #     table_names = f.read().splitlines()

    row_counts = cs.defaultdict(int)
    with sqlite3.connect(path_db) as conn:
        cursor = conn.cursor()

        cursor.execute('SELECT tbl_name FROM sqlite_master WHERE type="table"')
        table_names = [row[0] for row in cursor.fetchall()]

        for name in table_names:
            print(f'Reading {name}')
            query = f'SELECT COUNT(*) FROM {name};'
            cursor.execute(query)
            result = cursor.fetchone()
            row_counts[name] = result[0]

    lines = [f'{count:03d};{name}' for (name, count) in row_counts.items()]
    lines = sorted(lines, reverse=True)
    with open('row_counts.csv', 'w+', encoding='utf-8') as f:
        f.write('\n'.join(lines))


if __name__ == '__main__':
    main()
