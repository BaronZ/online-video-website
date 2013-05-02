package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class MyFile {

	/**
     * 复制单个文件
     * @param oldPath String 原文件路径 如：c:/fqf.txt
     * @param newPath String 复制后路径 如：f:/fqf.txt
     * @return boolean
     */
   public static  void copyFile(String oldPath, String newPath) {
       try {
           int bytesum = 0;
           int byteread = 0;
           File oldfile = new File(oldPath);
           if (oldfile.exists()) { //文件存在时
        	   System.out.println("文件存在");
               InputStream inStream = new FileInputStream(oldPath); //读入原文件
               FileOutputStream fs = new FileOutputStream(newPath);
               byte[] buffer = new byte[1444];
               int length;
               while ( (byteread = inStream.read(buffer)) != -1) {
                   bytesum += byteread; //字节数 文件大小
                   System.out.println(bytesum);
                   fs.write(buffer, 0, byteread);
               }
               inStream.close();
           }
       }
       catch (Exception e) {
           System.out.println("复制单个文件操作出错");
           e.printStackTrace();

       }
       System.out.println("结束");
   }

	
	
	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//System.out.println("开始");
		//copyFile("src/main/webapp/upload/vimgs/1.exe", "src/main/webapp/upload/vimgs/2.exe");
//		File file=new File("src/main/webapp/upload/videos/2.MKV");
//		if(file.exists()&&file.isFile()){
//			File file1=new File("src/main/webapp/resource/videos/2.MKV");
//			file.renameTo(file1);
//		}
		System.out.println(deleteFile("src/main/webapp/upload/videos/2.MKV"));
		//System.out.println(cutFiletoNewFile("src/main/webapp/upload/videos/2.MKV",
			//	"src/main/webapp/resource/videos/2.MKV"));
	}
	
	public static final int noOldFile=0;
	public static final int cutNewFileSuccess=1;
	public static final int cutNewFileFail=2;
	public static final int noDelFile=3;
	public static final int deleteFileSuccess=4;
	public static final int deleteFileFail=5;
	
	
	/**
	 * 
	 * @param oldFilePath
	 * @param newFilePath
	 * @return int
	 * noOldFile:表示旧的文件路径不存在该文件或者该文件路径是一个文件夹
	 * cutNewFileSuccess:表示剪切文件成功
	 * cutNewFileFail:表示剪切文件失败
	 */
	public static int cutFiletoNewFile(String oldFilePath,String newFilePath){
		File oldfile=new File(oldFilePath);
		if(oldfile.exists()&&oldfile.isFile()){
			File newFile=new File(newFilePath);
			if(oldfile.renameTo(newFile)){
				return cutNewFileSuccess;
			}
			return cutNewFileFail;
		}
		return noOldFile;
	}
	
	public static int deleteFile(String filePath){
		
		File delFile =new File(filePath);
		if(delFile.exists()&&delFile.isFile()){
			if(delFile.delete()){
				return deleteFileSuccess;
			}
			return deleteFileFail;
		}
		return noDelFile;
	}
	/**
     * 删除文件
     * @param filePathAndName String 文件路径及名称 如c:/fqf.txt
     * @param fileContent String
     * @return boolean
     */
   public void delFile(String filePathAndName) {
       try {
           String filePath = filePathAndName;
           filePath = filePath.toString();
           java.io.File myDelFile = new java.io.File(filePath);
           myDelFile.delete();

       }
       catch (Exception e) {
           System.out.println("删除文件操作出错");
           e.printStackTrace();

       }

   }

}
