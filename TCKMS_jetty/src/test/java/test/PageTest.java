package test;

import java.util.ArrayList;
import java.util.Map;

import com.and9.tckms.dao.VideoDao;
import com.and9.tckms.dao.impl.VideoDaoImpl;
import com.and9.tckms.entity.Video;
import com.and9.tckms.service.VideoService;

public class PageTest {

	public static final int VIDEO_BOTTOM_PAGE_SIZE=7;
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		int[] pages=new int[20];
//		for(int i=0;i<pages.length;i++){
//			pages[i]=i+1;
//		}
//		for(int i=0;i<pages.length;i++){
//			print(pages, i+1,7);
//		}
//		getVideoBottomPage(20, 2);
//		
		
		Map<String, Object> map=new VideoService().getPageInfo2Index(1, 1);
		ArrayList<Video> arrayList=(ArrayList<Video>) map.get(VideoService.VIDEO_LIST);
		int a=Integer.parseInt( map.get(VideoService.CURRENT_PAGE).toString());
		int[] b=(int[]) map.get(VideoService.BOTTOM_PAGE);
		System.out.println(arrayList.size());
		System.out.println(b.length);
		
		VideoDao v=new VideoDaoImpl();
		System.out.println(v.getCountofVideoListByKey("java"));
		ArrayList<Video> arrayList2=(ArrayList<Video>) v.getVideoListByKey("f", 0, 12);
		System.out.println(arrayList2.size());
	}
	
	//1  2  3  4  5
	//2  3  4  5  6
	//5  6  7  8  9
	//8  9  10 11 12
	public static void print(int[] pages,int cur,int length){
		int f=0;
		int l=0;
		if(pages.length<=length){
			f=1;
			l=pages.length;
		}
		else{
			if(cur<=length/2+1){
				f=1;
				l=length;
			}
			else
			if((cur-(length/2+1)>0)&&(cur+(length/2+1)<=pages.length)){
				f=cur-(length/2);
				l=cur+(length/2);
			}
			else
			if(cur>pages.length-(length/2+1)){
				f=pages.length-(length-1);
				l=pages.length;
			}
		}
		for(int i=f-1;i<l;i++)
		{
			System.out.print(i+1+" ");
		}
		System.out.println("l="+(f+7-1));
	}
	
	public static int[] getVideoBottomPage(int allPageCount,int currentPage){

		int[] bottomPageSize=new int[VIDEO_BOTTOM_PAGE_SIZE];
		int f=0;
		
		
		if(allPageCount<=VIDEO_BOTTOM_PAGE_SIZE){
			f=1;
		}
		else{
			if(currentPage<=VIDEO_BOTTOM_PAGE_SIZE/2+1){
				f=1;
			}
			else
			if((currentPage-(VIDEO_BOTTOM_PAGE_SIZE/2+1)>0)
					&&(currentPage+(VIDEO_BOTTOM_PAGE_SIZE/2+1)<=allPageCount)){
				f=currentPage-(VIDEO_BOTTOM_PAGE_SIZE/2);
			}
			else
			if(currentPage>allPageCount-(VIDEO_BOTTOM_PAGE_SIZE/2+1)){
				f=allPageCount-(VIDEO_BOTTOM_PAGE_SIZE-1);
			}
		}
		for(int i=0;i<VIDEO_BOTTOM_PAGE_SIZE;i++){
			bottomPageSize[i]=f+i;
			System.out.println(f+i);
		}

		return bottomPageSize;
	}
}
