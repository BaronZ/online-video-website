package com.and9.tckms.web.utils;

import java.io.File;

public class FileOperation {
	
	public static final int noOldFile=0;
	public static final int cutNewFileSuccess=1;
	public static final int cutNewFileFail=2;
	public static final int noDelFile=3;
	public static final int deleteFileSuccess=4;
	public static final int deleteFileFail=5;
	
	
	private FileOperation(){
		
	}
	
	/**
	 * 
	 * @param oldFilePath
	 * @param newFilePath
	 * @return int
	 * noOldFile:表示旧的文件路径不存在该文件或者该文件路径是一个文件夹
	 * cutNewFileSuccess:表示剪切文件成功
	 * cutNewFileFail:表示剪切文件失败
	 */
	public static int cutFiletoNewFile(String oldFilePath,String newFilePath,String videoName){
		File oldfile=new File(oldFilePath,videoName);
		if(oldfile.exists()&&oldfile.isFile()){
			File newFile=new File(newFilePath,videoName);
			if(oldfile.renameTo(newFile)){
				return cutNewFileSuccess;
			}
			return cutNewFileFail;
		}
		return noOldFile;
	}
	
	/**
	 * 
	 * @param filePath
	 * @return int
	 * noDelFile:表示要删除的文件路径不存在该文件或者该文件路径是一个文件夹
	 * deleteFileSuccess:删除文件成功
	 * deleteFileFail:删除文件失败
	 */
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
	
}
