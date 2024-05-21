import psycopg2

conn = psycopg2.connect(database='ZakatQu', user='postgres', password='19Januari', host='localhost', port=5432)

cur = conn.cursor()


def login_query(username: str, password: str) -> any :
    cur.execute(f"SELECT * FROM amil_zakat WHERE left(nik, 5)= '{username}' AND right(nik, 5)= '{password}';")
    data = cur.fetchall()

    # cur.close()
    # conn.close()

    return data

def QueryInput(InputQuery, NamaTabel, NamaKolom):
    cur.execute("INSERT INTO " + NamaTabel + " " + f'({NamaKolom})' + " VALUES " + f'{InputQuery}'.replace("[", "(").replace("]", ")"))
    conn.commit()

def searchPemberi(Input):
    cur.execute(f"SELECT * FROM pemberi_zakat where nama_pemberi_zakat = '{Input}';")
    data = cur.fetchall()
    if data:
        return data
    else:
        return "Data Tidak Ada"

def searchBentukZakat(Input):
    cur.execute(f"SELECT * FROM bentuk_zakat where id_bentuk_zakat = '{Input}';")
    data = cur.fetchall()
    if data:
        return data
    else:
        return "Data Tidak Ada"
    
def searchJenisZakat(Input):
    cur.execute(f"SELECT * FROM jenis_zakat where id_jenis_zakat = '{Input}';")
    data = cur.fetchall()
    if data:
        return data
    else:
        return "Data Tidak Ada"
    