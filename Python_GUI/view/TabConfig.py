from typing import List
import tkinter as tk
from tkinter import ttk
from m_gui.tab_view import ATabView
from m_gui.ttkComponent import TtkComponent
from m_serial_handler import SerialPortProxy, SerialPortSettings
from model.MainModel import MainModel
from model.SerialPortModel import SerialReaderRaw, SerialReaderLine
from serial.threaded import ReaderThread,LineReader


class TabConfig(ATabView):

    om_comport: ttk.OptionMenu
    om_baudrate: ttk.OptionMenu

    selected_comport: tk.StringVar
    selected_baudrate: tk.StringVar

    model: MainModel

    def __init__(self, model: MainModel):
        super().__init__("COM Port")
        self.model = model

    def on_port_selected(self, selection: tk.StringVar):
        print("{} selected".format(selection))

    def on_baudrate_selected(self, selection: tk.StringVar):
        print("baud rate {} selected".format(selection))

    def init_comport(self):
        port_name = self.selected_comport.get()
        baud_rate = self.selected_baudrate.get()

        if port_name != None and baud_rate != None:
            self.model.h_comport = SerialPortProxy(port_name=port_name, baud=int(baud_rate))
            self.model.h_comport.open()
            print("open port {} at {} baud".format(port_name, baud_rate))

    def btn_port_open_clicked(self):
        try:
            if hasattr(self.model, 'h_comport'):
                self.model.h_comport.open()
                print("re-open port")
            else:
                self.init_comport()

            reader = ReaderThread(self.model.h_comport.ser, SerialReaderLine)
            reader.start()
        except:
            print("Error opening COM port")

    def btn_port_close_clicked(self):
        try:
            self.model.h_comport.close()
            print("close COM port")
        except:
            print("Error closing COM port")
        

    def populate_comport_options(self, root: tk.Frame, port_names: List[str]):
        h_selection = tk.StringVar(root)
        h_selection.set("ComPort")
        h_widget = TtkComponent.create_option_menu(root, 0, 1,
                                                   h_selection,
                                                   port_names,
                                                   self.on_port_selected)
        return h_selection, h_widget
    
    def populate_baudrate_options(self, root: tk.Frame, baud_rates: List[int]):
        h_selection = tk.StringVar(root)
        h_selection.set("Baudrate")
        h_widget = TtkComponent.create_option_menu(root, 0, 2,
                                                   h_selection,
                                                   baud_rates,
                                                   self.on_baudrate_selected)
        return h_selection, h_widget

    # override method
    def init_view(self):
        self.h_frame = super().init_view()

        ttk.Button(self.h_frame, text="Open", command=self.btn_port_open_clicked) \
            .grid(column=1, row=0, padx=5)
        ttk.Button(self.h_frame, text="Close", command=self.btn_port_close_clicked) \
            .grid(column=2, row=0, padx=5)

        port_settings = SerialPortSettings()
        port_settings.list_port_description()

        self.selected_comport, self.om_comport = self.populate_comport_options(self.h_frame, port_settings.port_name)
        self.selected_baudrate, self.om_baudrate = self.populate_baudrate_options(self.h_frame, port_settings.baud_rate_list)

    # override method
    def init_view_attributes(self):
        super().init_view_attributes()
