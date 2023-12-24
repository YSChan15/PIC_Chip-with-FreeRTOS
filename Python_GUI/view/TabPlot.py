import time
from m_gui.tab_view import ATabView
from model.MainModel import MainModel
from model.SerialPortModel import SerialReaderRaw, SerialReaderLine
from serial.threaded import ReaderThread,LineReader

import struct

class TabPlot(ATabView):

    model: MainModel

    def __init__(self, model: MainModel):
        super().__init__("Data Plot")
        self.model = model
        
    # override method
    def init_view(self):
        h_frame = super().init_view()
        super().init_controls(h_frame)
        #SerialReaderRaw.tk_handler = h_frame
        #SerialReaderRaw.data_received_cb = self.on_data
        SerialReaderLine.tk_handler = h_frame
        SerialReaderLine.data_received_cb = self.on_data

        #Textbox 
        self.avgtemp = h_frame.create_textbox("Average Temperature", 0, 3, 10)
        self.adc     = h_frame.create_textbox("ADC",0,4,10)
        self.voltage = h_frame.create_textbox("Voltage",0,5,10)
        self.alarm   = h_frame.create_textbox("Alarm State",0,6,10)
        self.button  = h_frame.create_textbox("Button State",0,7,10)

        self.redtitle   = h_frame.create_label("Red",6,3,10)
        self.red        = h_frame.create_entry_field(1,6,3,10)
        
        self.greentitle = h_frame.create_label("Green",6,4,10)
        self.green      = h_frame.create_entry_field(1,6,4,10)
        
        self.bluetitle  = h_frame.create_label("Blue",6,5,10)
        self.blue       = h_frame.create_entry_field(1,6,5,10)
        
        self.temptitle  = h_frame.create_label("Temperature Threshold",6,6,10)
        self.temp       = h_frame.create_entry_field(1,6,6,10)

        self.buffertitle= h_frame.create_label("Buffer Size",6,7,10)
        self.buffersize = h_frame.create_entry_field(1,6,7,10)
        
    # override method
    def btn_clear_clicked(self):
        super().btn_clear_clicked()
        self.avgtemp.set("")
        self.adc.set("")
        self.voltage.set("")
        self.alarm.set("")
        self.button.set("")


    def btn_read_clicked(self):
        super().btn_read_clicked()

        temperaturevalue = (self.temp[0].get())
        # self.tb.set("test value")
        # spawn async data listener
        if hasattr(self.model, 'h_comport'):
            if self.model.h_comport.ser.is_open == False:
                self.model.h_comport.open()

            temperature_hex = struct.pack('>f',float(temperaturevalue))
            #temperature_string = ''.join(f'{byte:02x}' for byte in temperature_hex)

            #Testing negative signed number 
            temperature_string = ''.join(f'{byte:02x}' for byte in struct.unpack('>l', temperature_hex))
            resultstring = f"d6B2{temperature_string}\n"    

            print(resultstring)

            self.model.h_comport.ser.write(resultstring.encode('utf-8'))    
                  

    def btn_write_clicked(self):
        super().btn_write_clicked()

        redvalue   = (self.red[0].get())
        bluevalue  = (self.blue[0].get())
        greenvalue = (self.green[0].get())

        if hasattr(self.model, 'h_comport'):
            if self.model.h_comport.ser.is_open == False:
                self.model.h_comport.open()

            if(int(redvalue) >= 0 and int(redvalue) <= 255) and \
            (int(bluevalue) >= 0 and int(bluevalue) <= 255) and \
            (int(greenvalue) >= 0 and int(greenvalue) <= 255):

                red_hex    = (hex(int(redvalue)))[2:].zfill(2)
                blue_hex   = (hex(int(bluevalue)))[2:].zfill(2)
                green_hex  = (hex(int(greenvalue)))[2:].zfill(2)

                resultstring = f"d69100{red_hex}{green_hex}{blue_hex}\n"    

                print(resultstring)

                self.model.h_comport.ser.write(resultstring.encode('utf-8'))

            else: 
                print("Fail to send, invalid RGB value\n")    
            
    def btn_alarm_clicked(self):
        super().btn_alarm_clicked()

        if hasattr(self.model, 'h_comport'):
            if self.model.h_comport.ser.is_open == False:
                self.model.h_comport.open()

            resultstring = f"d4811\n"

            print(resultstring)

            self.model.h_comport.ser.write(resultstring.encode('utf-8'))


    def btn_buffer_clicked(self):
        super().btn_buffer_clicked()           

        buffervalue = (self.buffersize[0].get())

        if hasattr(self.model, 'h_comport'):
            if self.model.h_comport.ser.is_open == False:
                self.model.h_comport.open()
            
            checkbuffervalue = int(buffervalue)
            if checkbuffervalue >= 8 and checkbuffervalue <= 32:
                bufferhex    = (hex(int(buffervalue)))[2:].zfill(2)
                resultstring = f"d482{bufferhex}\n"
                print(resultstring)
                self.model.h_comport.ser.write(resultstring.encode('utf-8'))

            else:
                print("Fail to send, invalid buffer size\n")


    def on_data(self, data):
        #length = len(data)
        print(data)
        marker = data[0:2]
        messagetype = data[2:4]
        payload = data[4:len(data)]

        #Alarm state
        if marker == 'd4' and messagetype == '01':
            self.alarm.set(int(data[4:6],16))

        #Button state
        elif marker == 'd4' and messagetype == '10':
            self.button.set(int(data[4:6],16))
        
        #Raw ADC
        elif marker == 'd5' and messagetype == '10':
            hex_data = data[4:8]
            reversed_hex_data = ''.join(reversed([hex_data[i:i+2] for i in range(0, len(hex_data), 2)]))
            self.adc.set(int(reversed_hex_data,16))

        #Voltage
        elif marker == 'd6' and messagetype == '31':
            payload_bytes = bytes.fromhex(payload)
            #Unpack the voltage, using little endian sort 
            payload_float = struct.unpack('<f',payload_bytes)[0]
            #print(payload_float)
            self.voltage.set(round(payload_float,3))

        #Temperature
        elif marker == 'd6' and messagetype == '32':
            payload_bytes = bytes.fromhex(payload)
            #Unpack the temperature, using little endian sort 
            payload_float = struct.unpack('<f',payload_bytes)[0]
            self.avgtemp.set(round(payload_float,3))
        

