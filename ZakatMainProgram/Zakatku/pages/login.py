from getpass import getpass
from typing import List

from utils import terminal
from utils.db import login_query



def login() -> List[str]:
    terminal.clear_screen()

    print("Halaman Login\n")

    username: str = input("Username : ")
    password: str = getpass("Password : ")

    data: any = login_query(username, password)

    return data