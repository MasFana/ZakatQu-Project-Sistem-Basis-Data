from typing import List
from utils import switcher, terminal
from components import list


if __name__ == '__main__':
    while(True) :
        terminal.clear_screen()

        list_menu: List[str] = ["Login", "Amil zakat", "Pembayaran Zakat", "Distribusi", "Pemberi Zakat", "Penerima Zakat", "Keluar dari aplikasi"]

        list.print_list(list_menu)

        result: str = input("Pilih menu yang dituju : ")

        switcher.switcher_menu(result)




