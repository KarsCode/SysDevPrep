package com.lb;

import java.io.*;
import java.net.*;
import java.util.*;

public class LoadBalancer {
    private static final int LB_PORT = 8080;
    private static final List<InetSocketAddress> backendServers = Arrays.asList(
            new InetSocketAddress("localhost", 9001),
            new InetSocketAddress("localhost", 9002),
            new InetSocketAddress("localhost", 9003));

    private static int currentIndex = 0;

    public static void main(String[] args) throws IOException {
        ServerSocket lbSocket = new ServerSocket(LB_PORT);
        System.out.println("Load Balancer started on port " + LB_PORT);

        while (true) {
            Socket clientSocket = lbSocket.accept();
            InetSocketAddress backend = getNextServer();
            System.out.println("Forwarding request to " + backend);
            new Thread(() -> handleRequest(clientSocket, backend)).start();
        }
    }

    private static synchronized InetSocketAddress getNextServer() {
        InetSocketAddress server = backendServers.get(currentIndex);
        currentIndex = (currentIndex + 1) % backendServers.size();
        return server;
    }

    private static void handleRequest(Socket clientSocket, InetSocketAddress backendAddress) {
        try (
                Socket backendSocket = new Socket(backendAddress.getHostName(), backendAddress.getPort());
                InputStream fromClient = clientSocket.getInputStream();
                OutputStream toClient = clientSocket.getOutputStream();
                InputStream fromServer = backendSocket.getInputStream();
                OutputStream toServer = backendSocket.getOutputStream();) {
            Thread c2s = new Thread(() -> transfer(fromClient, toServer));
            Thread s2c = new Thread(() -> transfer(fromServer, toClient));
            c2s.start();
            s2c.start();
            c2s.join();
            s2c.join();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                clientSocket.close();
            } catch (IOException ignored) {
            }
        }
    }

    private static void transfer(InputStream in, OutputStream out) {
        try {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
                out.flush();
            }
        } catch (IOException ignored) {
        }
    }
}
