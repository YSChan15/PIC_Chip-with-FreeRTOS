import tkinter as tk
from tkinter import ttk
from typing import List

from m_gui.CompositeComponents import GridFrame
from m_gui.tab_view import ATabView
from m_gui.ttkComponent import TtkComponent


class MainView:

    app_title: str

    def __init__(self):
        self.root = tk.Tk()
        self.color_theme = 0
        self.app_title = "GUI Demo"

    def init_components(self, tab_views: List[ATabView]):
        notebook = ttk.Notebook(self.root)

        for i in range(len(tab_views)):
            tab_control = ttk.Frame(notebook)
            notebook.add(tab_control, text=tab_views[i].name)
            tab_views[i].set_tab_handle(tab_control)
            tab_views[i].init_view()

        TtkComponent.init_styles(self.color_theme)
        TtkComponent.init_menu(self.root)
        notebook.pack(fill=tk.BOTH, expand=True)

    def run(self):
        self.root.title(self.app_title)
        self.root.minsize(640,480)
        self.root.deiconify()
        self.root.mainloop()
