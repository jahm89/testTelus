package com.test.jahm;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationSuccessHandlerImpl implements ApplicationListener<AuthenticationSuccessEvent>  {

	@Override
	public void onApplicationEvent(final AuthenticationSuccessEvent event) {
		
		try {
			
			DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
			Date dateCurrent = new Date();
			String dateCurrentS = formatter.format(dateCurrent);
			FileWriter fw = new FileWriter("CounterVist.txt",true);
			
			
			//Read file to get last line
			BufferedReader br = new BufferedReader(new FileReader("CounterVist.txt"));
			
			String lastLine = "";
			
			String sCurrentLine;
			String newLine;
			
			StringBuilder sb = new StringBuilder();
			
			while((sCurrentLine = br.readLine()) != null) {
				
				lastLine = sCurrentLine;
			}
			
			br = new BufferedReader(new FileReader("CounterVist.txt"));
			
			while((sCurrentLine = br.readLine()) != null) {
				
				if(lastLine.equals(sCurrentLine)) {
					
					String[] dateOld = lastLine.split("\\|");
					String oldDate = dateOld[0];
					
					
					if(dateCurrentS.equals(oldDate)) {
						int countDay = Integer.parseInt(dateOld[1]);
						countDay++;
						
						sb.append(oldDate+"|"+countDay);
						sb.append("\n");
					}
					else {
						
						sb.append(oldDate+"|"+dateOld[1]);
						sb.append("\n");
						sb.append(dateCurrentS+"|"+1);
						sb.append("\n");
					}
					
					
				}
				else {
					
					sb.append(sCurrentLine);
					sb.append("\n");
					
				}
				
				
				
				
				
			}
			
			//If file has not lines
			if(lastLine == "") {
				
				
				newLine = dateCurrentS+"|"+"1";
				fw.write(newLine);
				
				
			}else {
				FileWriter fws = new FileWriter("CounterVist.txt");
				fws.write(sb.toString());
				fws.close();
			}
			
			fw.close();
		

			
			
			
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
