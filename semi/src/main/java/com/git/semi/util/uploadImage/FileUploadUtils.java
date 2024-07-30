package com.git.semi.util.uploadImage;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.Part;

public class FileUploadUtils {
	
	
	public static String saveFile(Part part,String saveDir,String photo) throws IOException {
		
		String filename = extractFileName(part.getHeader("Content-Disposition"), photo);
	    if(part.getSize()>0) {
	    	
	    	File  f = new File(saveDir,filename);
	    	if(f.exists()) {
	    		long tm = System.currentTimeMillis();
	    		filename = String.format("%d_%s", tm,filename);
	    		f = new File(saveDir,filename);
	    	}
	    	
			part.write(saveDir + File.separator + filename);
			part.delete();
		}
		
		return filename;
	}
	
	
	static String extractFileName(String partHeader,String name) {
		
		//System.out.println(partHeader);
		
		if(partHeader.contains(name)) {
			for(String cd : partHeader.split(";")) {
				
				if(cd.contains("filename")) {
					//System.out.println(cd);
					
					String fileName = cd.substring(cd.lastIndexOf("=")+1).trim().replace("\"","");
					return fileName;
				}
				//int index = fileName.lastIndexOf(File.separator);
				//return fileName.substring(index+1);
			}
		}
		return null;
	}
	

}
