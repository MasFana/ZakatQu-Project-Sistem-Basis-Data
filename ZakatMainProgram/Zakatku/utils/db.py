import psycopg2

conn = psycopg2.connect(database='Zakatqu', user='postgres', password='rendydp424', host='localhost', port=5432)

cur = conn.cursor()



def login_query(username: str, password: str) -> list[tuple] :
    cur.execute(f"SELECT * FROM amil_zakat WHERE left(nik, 5)= '{username}' AND right(nik, 5)= '{password}';")
    data = cur.fetchall()

    # cur.close()
    # conn.close()

    return data

def read_amil() -> list[tuple] :
    cur.execute(f"SELECT * FROM amil_zakat")
    data = cur.fetchall()

    return data