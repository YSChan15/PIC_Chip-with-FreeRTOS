import abc
import tkinter as tk
from tkinter import ttk
from typing import List

from m_gui.CompositeComponents import GridFrame
from m_gui.ttkComponent import TtkComponent


class ATabView(metaclass=abc.ABCMeta):

    grid_layout: GridFrame

    def __init__(self, name: str):
        self.name = name

    def set_tab_handle(self, handle: GridFrame):
        self.grid_layout = handle

    def init_view(self):
        frame_region = GridFrame(self.grid_layout)
        frame_region.columnconfigure(0, weight=1)
        frame_region.grid(column=0, row=0, sticky=tk.E)
        return frame_region
    
    def init_controls(self, root: ttk.Frame):
        ttk.Button(root, text="Clear", command=self.btn_clear_clicked)\
            .grid(column=0, row=0, padx=5)
        ttk.Button(root, text="Send Threshold", command=self.btn_read_clicked) \
            .grid(column=7, row=0, padx=5)
        ttk.Button(root, text="Send RGB values", command=self.btn_write_clicked) \
            .grid(column=6, row=0, padx=5)
        ttk.Button(root, text="Clear Alarm", command = self.btn_alarm_clicked) \
            .grid(column=4, row=0, padx=5)
        ttk.Button(root, text="Send Buffer", command = self.btn_buffer_clicked)\
            .grid(column=5, row = 0, padx= 5)
    
    def btn_clear_clicked(self):
        print("Button clear clicked")

    def btn_read_clicked(self):
        print("Temperature threshold clicked")

    def btn_write_clicked(self):
        print("Send RGB values clicked")

    def btn_alarm_clicked(self):
        print("Clear Alarm")

    def btn_buffer_clicked(self):
        print("Send buffer temperature")    

    def on_data(self, data):
        pass
