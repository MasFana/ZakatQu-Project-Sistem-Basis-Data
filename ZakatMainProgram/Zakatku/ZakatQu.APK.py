from typing import List

from utils import switcher, terminal
from components import list
from pages.login import login


if __name__ == '__main__':
    terminal.clear_screen()

    akun = login()
    while(True) :
        terminal.clear_screen()

        print(akun)

        list_menu: List[str] = ["Amil zakat", "Pembayaran Zakat", "Distribusi", "Pemberi Zakat", "Penerima Zakat", "Keluar dari aplikasi"]
        list.print_list(list_menu)

        result: str = input("Pilih menu yang dituju : ")
        switcher.main_menu(result)




