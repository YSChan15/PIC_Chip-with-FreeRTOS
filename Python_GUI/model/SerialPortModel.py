from typing import Callable
import tkinter as tk
from serial.threaded import ReaderThread, Protocol, LineReader


class SerialReaderRaw(Protocol):

    tk_handler: tk.Frame
    data_received_cb: Callable[[str], None]

    def __init__(self) -> None:
        super().__init__()

    # method override
    def data_received(self, data: bytes) -> None:
        self.tk_handler.after(0, self.data_received_cb, data.decode())


class SerialReaderLine(LineReader):

    tk_handler: tk.Frame
    TERMINATOR = b'\n'

    data_received_cb: Callable[[str], None]
    
    # method override
    def connection_made(self, transport: ReaderThread) -> None:
        return super().connection_made(transport)
    
    # method override
    def handle_line(self, line):
        self.tk_handler.after(0, self.data_received_cb, line)