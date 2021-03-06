package com.and9.tckms.server;

import org.eclipse.jetty.server.Server;

/**
 * 使用Jetty运行调试Web应用, 在Console输入回车停止服务.
 * @author fly
 */
public class Start {
	public static final int PORT = 8080;
	public static final int TEST_PORT = 8082;
	public static final String CONTEXT = "/TCKMS";
	public static final String BASE_URL = "http://localhost:8080/TCKMS";
	public static final String TEST_BASE_URL = "http://localhost:8082/TCKMS";
	
	public static void main(String[] args) throws Exception {
		Server server = JettyFactory.buildNormalServer(PORT, CONTEXT);
		server.start();
		System.out.println("Server running at " + BASE_URL);
		System.out.println("Hit Enter in console to stop server");
		if (System.in.read() != 0) {
			server.stop();
			System.out.println("Server stopped");
		}
	}
}