package tw.com.queautiful.commons.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public class FileProcessing {
	
	//設定檔案儲存路徑
	private static final String path ="src\\main\\webapp\\WEB-INF\\img\\";
	
	//存圖片
	//傳入參數:1.imgName(檔名), 2.folderName(資料夾名稱), 3.MultipartFile
	//傳回檔案儲存的路徑
	public static String saveImg(String imgName, String folderName, MultipartFile brandImgFile){
		String imgPath = null;
		if(!brandImgFile.isEmpty()){
			try {
				byte[] bytes = brandImgFile.getBytes();
				File dir = new File( path + folderName );

				if(!dir.exists())
					dir.mkdirs();
				System.out.println();
				imgPath = path + folderName + File.separator + imgName + ".png";
				
				File file = new File(imgPath);
				FileOutputStream fos = new FileOutputStream(file);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				fos.close();
								
			} catch (IOException e) {
				System.out.println("Failed to upload " + imgName + " => " + e.getMessage());
				e.printStackTrace();
			}
		}else{
			System.out.println("Failed to upload " + imgName + " because the file was empty.");
		}
		return imgPath;
	}
	
	
	//在網頁中顯示圖片
	//傳入參數:1.HttpServletResponse, 2.檔案路徑
	public static void showImg(HttpServletResponse resp,String imgPath){
		try (InputStream is = new FileInputStream(imgPath);
				ServletOutputStream out = resp.getOutputStream();){			
				byte[] b = new byte[8192];
				int len = 0;
				while ((len = is.read(b)) != -1) {
				out.write(b, 0, len);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
	
	}
	
}
