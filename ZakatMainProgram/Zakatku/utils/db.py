import psycopg2

conn: connection = psycopg2.connect(database='matkul', user='postgres', password='rendydp424', host='localhost', port=5432)

cur = conn.cursor()

def login_query(username: str, password: str) -> any :
    cur.execute(f"SELECT * FROM amil_zakat WHERE left(nik, 5)= '${username}' AND right(nik, 5)= '${password}';")
    data = cur.fetchall()

    cur.close()
    conn.close()

    return data