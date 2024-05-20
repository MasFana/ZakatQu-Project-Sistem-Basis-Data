from menu import login, distribusi, amil, pembayaran, pemberi, penerima
from typing import List

def print_menu(menus: List[str]):

    for idx, menu in enumerate(menus):
        print(f"{idx+1}. {menu}")

def switcher_menu(var: str):
    # switcher = {
    #     '1': login.login(),
    #     '2': amil.amil(),
    #     '3': pembayaran.pembayaran(),
    #     '4': distribusi.distribusi(),
    #     '5': pemberi.pemberi(),
    #     '6': penerima.penerima(),
    # }

    # Placeholder
    match var:
        case '1':
            login.login()
        case '2':
            amil.amil()
        case '3':
            pembayaran.pembayaran()
        case '4':
            distribusi.distribusi()
        case '5':
            pemberi.pemberi()
        case '6':
            penerima.penerima()
        case _:
            print("Input tidak valid!")

    # return switcher.get(var, 'Input tidak valid')


if __name__ == '__main__':

    list_menu: List[str] = ["Login", "Amil zakat", "Pembayaran Zakat", "Distribusi", "Pemberi Zakat", "Penerima Zakat"]

    print_menu(list_menu)

    result: str = input("Pilih menu yang dituju : ")

    switcher_menu(result)



