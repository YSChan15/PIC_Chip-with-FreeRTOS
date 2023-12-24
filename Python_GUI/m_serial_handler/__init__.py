from asyncio import Queue
import threading
import time
import serial
import serial.tools.list_ports
from typing import List


class SerialPortProxy:

    port_name: str
    baud_rate: int
    ser: serial.Serial

    def __init__(self, port_name="COM3", baud=115200) -> None:
        self.port_name = port_name
        self.ser = serial.Serial()
        self.ser.port = port_name
        self.ser.baudrate = baud
        self.ser.timeout = 0
        self.ser.xonxoff = False
        self.ser.bytesize = serial.EIGHTBITS
        self.ser.parity = serial.PARITY_NONE
        self.ser.stopbits = serial.STOPBITS_ONE
    
    def open(self):
        self.ser.open()
        self.ser.flush()  # flush buffer

    def read(self):
        return self.ser.readline()
    
    def write(self, data: str):
        self.ser.write(str.encode(data))

    def close(self):
        self.ser.close()


class SerialPortSettings:

    baud_rate_list : List[int]
    port_name: List[str]

    def __init__(self) -> None:
        self.port_name = []
        self.baud_rate_list = [9600, 14400, 19200, 38400, 115200]

    def list_port_description(self):
        items = []
        ports = serial.tools.list_ports.comports()  # gather available ports

        for port, desc, hwid in sorted(ports):
            # items.append("{}: {} [{}]".format(port, desc, hwid))
            self.port_name.append(port)
            items.append("{}: {}".format(port, desc))

        return items


class SerialThread(threading.Thread):

    data_queue: Queue
    com_port: SerialPortProxy
    
    def __init__(self, serial_port:SerialPortProxy, queue:Queue):
        threading.Thread.__init__(self)
        self.com_port = serial_port
        self.data_queue = queue

    def run(self):
        #self.com_port.write(str.encode('a'))
        time.sleep(0.2)
        
        while True:
            if self.com_port.ser.inWaiting():
                text = self.com_port.ser.readline(self.com_port.ser.inWaiting())
                self.data_queue.put(text)
                #print(text.decode("ascii"))
