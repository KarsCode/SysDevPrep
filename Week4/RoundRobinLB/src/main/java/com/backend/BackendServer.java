package com.backend;

import java.io.*;
import java.net.*;

public class BackendServer {
    public static void main(String[] args) throws IOException
    {
        int port = Integer.parseInt(args[0]);
        ServerSocket serverSocket = new ServerSocket(port);
        System.out.println("Server running on port: "+ port);
        
        while(true)
        {
            Socket socket = serverSocket.accept();
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            BufferedWriter out= new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));

            //Read request(basic)

            String line;


            while((line = in.readLine())!=null && !line.isEmpty())
            {
                System.out.println("[" + port + "] Received: " + line);
            }


            // Respond with server port info
            out.write("HTTP/1.1 200 OK\r\n");
            out.write("Content-Type: text/plain\r\n");
            out.write("\r\n");
            out.write("Hello from backend server on port " + port + "\r\n");
            out.flush();

            socket.close();
        }
        
    }
}
