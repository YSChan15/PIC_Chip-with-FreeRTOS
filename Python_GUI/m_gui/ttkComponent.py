import tkinter as tk
from tkinter import ttk
from typing import List


class TtkComponent:

    @staticmethod
    def init_styles(theme: int = 0):
        s = ttk.Style()
        s.theme_use("default")

        # dark theme
        if theme == 1:
            # Tab (Frame)
            s.configure('TFrame', background='gray10')
            # Button styles
            s.configure('TButton', font=("Helvetica", 11), background='gray30', foreground='gray90')
            s.map('TButton', background=[('active', 'gray40')])
            # Label
            s.configure('TLabel', font=("Arial", 10), background='gray10', foreground='gray90', anchor=tk.E)
            # Label data field
            s.configure('Data.TLabel', font=("Calibri", 11), background='gray20', foreground='LightSkyBlue1', anchor=tk.E)
            # Entry field
            s.configure('TEntry', fieldbackground='dark khaki')
        else:
            # Button styles
            s.configure('TButton', font=("Helvetica", 11), background='gray70')
            # Label
            s.configure('TLabel', font=("Arial", 10), anchor=tk.E)
            # Modbus address field
            s.configure('Reg.TLabel', font=("Consolas", 10), foreground='purple4', anchor=tk.E)
            # Label data field
            s.configure('Data.TLabel', font=("Calibri", 11), background='white', foreground='RoyalBlue4', anchor=tk.E)
            # Entry field
            s.configure('TEntry', fieldbackground='lemon chiffon')

    @staticmethod
    def init_menu(root: tk.Tk):
        menu_handle = tk.Menu(root)
        root.config(menu=menu_handle, background='black')
        # self.menu.add_cascade(label='File', menu=menu_file)
        menu_handle.add_command(label='Exit', command=root.quit)

    @staticmethod
    def create_labels(master, text, column, row, style, width=None, padx=5, columnspan=1, anchor=tk.E):
        if width is None:
            ttk.Label(master, text=text, style=style, anchor=anchor)\
                .grid(column=column, row=row, padx=padx, pady=0, sticky="ew", columnspan=columnspan, rowspan=1)
        else:
            ttk.Label(master, text=text, style=style, width=width, anchor=anchor)\
                .grid(column=column, row=row, padx=padx, pady=0, sticky="ew", columnspan=columnspan, rowspan=1)

    @staticmethod
    def create_data(master, text_var, column, row, width=None, padx=5, pady=0, sticky="ew"):
        if width is None:
            ttk.Label(master, textvariable=text_var, style='Data.TLabel', anchor=tk.E)\
                .grid(column=column, row=row, padx=padx, pady=pady, sticky=sticky)
        else:
            ttk.Label(master, textvariable=text_var, width=width, style='Data.TLabel')\
                .grid(column=column, row=row, padx=padx, pady=pady, sticky=sticky)

    @staticmethod
    def create_entry(master, text_var, column, row, width=20):
        handle = ttk.Entry(master, textvariable=text_var, width=width)
        handle.grid(column=column, row=row, padx=5, pady=0, rowspan=1)
        return handle

    @staticmethod
    def create_title(master, title_str: str, column, row, width=40, columnspan=3):
        ttk.Label(master, text=title_str, relief=tk.SOLID, anchor=tk.CENTER, width=width)\
            .grid(column=column, row=row, columnspan=columnspan, padx=2, pady=1)

    @staticmethod
    def update_value(text_var: tk.StringVar, values):
        if type(values) is float:
             text_var.set(str(f'{values:.7f}'))
        else:
             text_var.set(values)

    @staticmethod
    def clear_value(text_var: List[tk.StringVar]):
        for field in text_var:
            field.set('')

    @staticmethod
    def create_option_menu(root, column, row, str_var: tk.StringVar, list_options: List[str], callback):

        paddings = {'padx': 5, 'pady': 5}
        ttk.Label(root, text=str_var.get())\
                .grid(column=column, row=row, **paddings, sticky=tk.E, rowspan=1)

        option_menu = tk.OptionMenu(root,
                                    str_var,
                                    "",
                                    *list_options,
                                    command=callback)\
                        .grid(column=column+1, row=row, sticky=tk.W, **paddings, rowspan=1)

        return option_menu
