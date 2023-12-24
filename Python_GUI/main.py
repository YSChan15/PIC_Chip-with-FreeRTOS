# Yu Sheng Chan 

from m_gui import MainView
from model.MainModel import MainModel
from view.TabConfig import TabConfig
from view.TabPlot import TabPlot

def run_main(model: MainModel):

    # spawn serial thread
    #serial_thread = SerialThread(serial_handle, serial_queue)
    #serial_thread = SerialThread(serial_port, serial_queue)
    #serial_thread.run()


    # GUI composition
    ui = MainView()
    ui.app_title = "ECE422 Final Project GUI"
    ui.init_components([    
        TabPlot(model),
        TabConfig(model),
        # TabControl(),
        ])
    ui.run()
    

'''
Main Entry point of the application
'''
if __name__ == '__main__':
    print("GUI demo")
    app_model = MainModel()
    run_main(app_model)
