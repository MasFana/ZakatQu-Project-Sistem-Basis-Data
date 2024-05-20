from getpass import getpass
from typing import List

from utils import terminal

def login()-> List[str]:
    terminal.clear_screen()

    print("Halaman Login\n")

    username: str = input("Username : ")
    password: str = getpass("Password : ")
