from pages import login, distribusi, amil, pembayaran, pemberi, penerima


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