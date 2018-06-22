package aula7ex1;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {
	
	private ServerSocket servsocket;
	private int porto;
	private Banco b;

	public Server (int porto){
		this.porto = porto;
		this.b = new Banco();
	}
	
	public void startServer(){
		try {
			System.out.println("#### SERVER ####");
			this.servsocket = new ServerSocket(this.porto);
		
			while(true){
				System.out.println("ServerMain > Server is running waiting for a new connection...");
				Socket socket = servsocket.accept();
				System.out.println("ServerMain > Connection received! Create worker thread to handle connection.");

				ServerWorker sw = new ServerWorker(socket, b);
				new Thread(sw).start();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		Server s = new Server(12345);
		s.startServer();
	}

}
