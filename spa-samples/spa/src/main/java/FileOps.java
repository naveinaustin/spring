import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileOps {
	static String from = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890.-_!@#$%^&(){}[]";
	static String to = new StringBuilder(from).reverse().toString();
	static int ENCODE = 1;
	static int DECODE = 2;
	
	public static void main(String[] argv) throws IOException {
	    String path = "C:\\Navein\\RnDWorkspace\\SPA\\spa-test\\spa2";
	    int action = DECODE;
	    	    
	    File folder = new File(path);
	    
	    if(ENCODE == action) {
	    	encodeFilesOfFolder(folder);
	    	encodeFolder(folder);
	    	BufferedWriter output = null;
	    	try {
	    		File f = new File(path + File.separator + "file.lock"); 
	            output = new BufferedWriter(new FileWriter(f));
	            output.write("FOLDER ENCRYPTION DONE");
	        } catch ( IOException e ) {
	            e.printStackTrace();
	        } finally {
	            if ( output != null ) {
	            	output.close();
	            }
	        }
	    } else if(DECODE == action) {
    		File f = new File(path + File.separator + "file.lock"); 
            if(f.exists()) {
            	f.delete();
            	decodeFolder(folder);
            	decodeFilesOfFolder(folder);
            }  	
	    }
	    
	    
	}
	
	public static void display(String value1) {
		String value2 = encode(value1);
	    System.out.print(value2 + " ");
	    System.out.println(decode(value2));
	}
	
	public static String encode(String name) {
		StringBuilder sb = new StringBuilder();

	    char[] charArr = name.toCharArray();
	    
	    for(int i = 0; i < charArr.length; i++)
	    {
	    	int index = from.indexOf(charArr[i]);
	    	sb.append(to.charAt(index));
	    }
	    
	    return sb.toString();
	}
	
	public static String decode(String name) {
		StringBuilder sb = new StringBuilder();

	    char[] charArr = name.toCharArray();
	    
	    for(int i = 0; i < charArr.length; i++)
	    {
	    	int index = to.indexOf(charArr[i]);
	    	sb.append(from.charAt(index));
	    }
	    
	    return sb.toString();
	}
	
	public static void encodeFilesOfFolder(File folder){
	    File[] listOfFiles = folder.listFiles();
	
	    if (listOfFiles != null) {
	        for (int i = 0; i < listOfFiles.length; i++) {
	            if (listOfFiles[i].isFile()) {
	            	String fileName = listOfFiles[i].getName();
	            	String encodedFileName = encode(listOfFiles[i].getName());
	                File f = new File(folder.getPath() + "/" + fileName); 
	                f.renameTo(new File(folder.getPath() + "/" + encodedFileName));
	            } else if (listOfFiles[i].isDirectory()) {
	            	encodeFilesOfFolder(listOfFiles[i]);
	            }
	        }
	    } else {
	        System.out.println("Path without files");
	    }  
	}
	
	public static void encodeFolder(File folder) {
		//System.out.println(folder.getPath());
		File[] listOfFiles = folder.listFiles();
			
	    if (listOfFiles != null) {
	        for (int i = 0; i < listOfFiles.length; i++) {
	            if (listOfFiles[i].isDirectory()) {
	            	String fileName = listOfFiles[i].getName();
	            	String encodedFileName = encode(listOfFiles[i].getName());
	                File f = new File(folder.getPath() + "/" + fileName); 
	                File newFile = new File(folder.getPath() + "/" + encodedFileName);
	                f.renameTo(newFile);
	                encodeFolder(newFile);
	            } 
	        }
	    } 
	}
	
	public static void decodeFilesOfFolder(File folder){
	    File[] listOfFiles = folder.listFiles();
	
	    if (listOfFiles != null) {
	        int count = 1;
	        for (int i = 0; i < listOfFiles.length; i++) {
	            if (listOfFiles[i].isFile()) {
	            	String fileName = listOfFiles[i].getName();
	            	String decodedFileName = decode(listOfFiles[i].getName());
	                File f = new File(folder.getPath() + "/" + fileName); 
	                f.renameTo(new File(folder.getPath() + "/" + decodedFileName));
	                count++;                    
	            } else if (listOfFiles[i].isDirectory()) {
	            	decodeFilesOfFolder(listOfFiles[i]);
	            }
	        }
	    } else {
	        System.out.println("Path without files");
	    }  
	}
	
	public static void decodeFolder(File folder) {
		File[] listOfFiles = folder.listFiles();
			
	    if (listOfFiles != null) {
	        for (int i = 0; i < listOfFiles.length; i++) {
	            if (listOfFiles[i].isDirectory()) {
	            	String fileName = listOfFiles[i].getName();
	            	String encodedFileName = decode(listOfFiles[i].getName());
	                File f = new File(folder.getPath() + "/" + fileName); 
	                File newFile = new File(folder.getPath() + "/" + encodedFileName);
	                f.renameTo(newFile);
	                decodeFolder(newFile);
	            } 
	        }
	    } else {
	        System.out.println("Path without files");
	    }  
	}
	
}