import tkinter as tk
from tkinter import ttk
from typing import List, Tuple

from m_gui.ttkComponent import TtkComponent


class GridRegion:

    def __init__(self, starting_column: int, starting_row: int):
        self.col = starting_column
        self.row = starting_row


class GridFrame(ttk.Frame):

    def create_textbox(self, label: str, col: int, row: int, width: int = None) -> tk.StringVar:
        tk_var = tk.StringVar()
        TtkComponent.create_labels(self, label, col, row, style="TLabel", anchor=tk.E)
        TtkComponent.create_data(self, tk_var, col + 1, row, width=width)
        return tk_var

    def create_title(self, title_str: str, col: int, row: int):
        TtkComponent.create_title(self, title_str, col + 1, row - 1)

    def create_label(self, label:str, col: int, row: int, width: int = None):
        TtkComponent.create_labels(self,label,col-1,row,style="TLabel",anchor=tk.E)

    def create_data_field(self, data_length: int, starting_column=2, starting_row=1, div=None, width: int = None):
        """
        Populate values in a grid view fashion

        :param data_length: number of values
        :param starting_column: column position in grid
        :param starting_row: row position in grid
        :param div: Number of items in each column
        :param width: width of the UI element
        """

        field_handles = []
        for i in range(data_length):
            column = starting_column
            row = i + starting_row
            if div is not None:
                column = int(i / div) + starting_column
                row = i % div + starting_row

            tk_var = tk.StringVar()
            field_handles.append(tk_var)
            TtkComponent.create_data(self, tk_var, column, row, width=width)
        return field_handles

    def create_entry_field(self, entry_count: int, col: int, row: int, width: int = 12):
        info_entry = []
        for i in range(entry_count):
            entry = tk.StringVar()
            TtkComponent.create_entry(self, entry, col, row + i, width=width)
            info_entry.append(entry)
        return info_entry
    
    def create_entrybox(self, col: int, row: int, width: int = 12):
        entry = tk.StringVar()
        TtkComponent.create_entry(self,entry,col,row,width=width)
        return entry
    


    def populate_by_row(self, labels: List[str], col: int, row: int, style="TLabel", anchor=tk.E):
        for i in range(len(labels)):
            TtkComponent.create_labels(self, labels[i], col, row + i, style=style, anchor=anchor)

    def populate_by_column(self, labels: List[str], col: int, row: int, style='TLabel', anchor=tk.E):
        for i in range(len(labels)):
            TtkComponent.create_labels(self, labels[i], col + i, row, style=style, anchor=anchor)

    def populate_separator(self, col: int, row: int):
        TtkComponent.create_labels(self, " ", col, row, style='Data.TLabel')
