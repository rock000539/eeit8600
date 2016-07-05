package tw.com.queautiful.product.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.com.queautiful.commons.util.FileProcessing;
import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.service.BrandService;

@Controller
@RequestMapping("/brands")
public class BrandController {

	@Autowired
	private BrandService brandService;

	@RequestMapping("/list")
	public String listPage(
			//Model model
			) {
		//model.addAttribute("brands", brandService.getAll());
		return "/brand/brandList";
	}

	@RequestMapping("/select")
	@ResponseBody
	public List<Brand> select() {
		return brandService.getAll();
	}
	
	@RequestMapping("/select_jqgrid")
	@ResponseBody
	public Page<Brand> select(@RequestParam(required=false) Integer page,
			@RequestParam(required=false) Integer rows){
		
		Pageable pageble = new PageRequest(page-1, rows);
		Page<Brand> brandPages = brandService.getAll(pageble);
		return brandPages;		
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/brand/brandAdd";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long brandId, Model model) {
		model.addAttribute("brand", brandService.getById(brandId));
		return "/brand/brandEdit";
	}

	@RequestMapping("/insert")
	@ResponseBody
	public Brand insert(@RequestPart("brand") Brand brand, 
			@RequestPart("brandImgFile") MultipartFile brandImgFile, HttpServletRequest req) {
		//取得品牌名稱當作檔名
		String brandName = brand.getBrandName();
		
		//存圖片-->直接使用FileProcessing檔的saveImg方法
		//傳入參數:1.imgName(檔名), 2.folderName(資料夾名稱), 3.MultipartFile
		//傳回檔案儲存的路徑
		String brandImg = FileProcessing.saveImg(brandName, "brand", brandImgFile);
//		String brandImg = FileProcessing.saveImg(brandName, "brand", brandImgFile ,req);
		
		//將檔案路徑存成Entity的屬性
		brand.setBrandImg(brandImg);
		
		brandService.insert(brand);
		return brand;
	}

	@RequestMapping("/update")
	@ResponseBody
	public Brand update(@RequestPart("brand") Brand brand,
			@RequestPart(value = "brandImgFile", required = false) MultipartFile brandImgFile, HttpServletRequest req) {
		
		//判斷是否有傳入圖片
		if (brandImgFile != null) {
			//取得品牌名稱當作檔名
			String brandName = brand.getBrandName();
			
			
			//存圖片-->直接使用FileProcessing檔的saveImg方法
			//傳入參數:1.imgName(檔名), 2.folderName(資料夾名稱), 3.MultipartFile
			//傳回檔案儲存的路徑
			String brandImg = FileProcessing.saveImg(brandName, "brand", brandImgFile);
//			String brandImg = FileProcessing.saveImg(brandName, "brand", brandImgFile ,req);
			
			//將檔案路徑存成Entity的屬性
			brand.setBrandImg(brandImg);
		}
		
		brandService.update(brand);
		return brand;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody Brand brand) {
		brandService.delete(brand.getBrandId());
	}

	@RequestMapping("/show")
	public void show(HttpServletResponse resp, @RequestParam Long brandId) {
		Brand brand = brandService.getById(brandId);
		
		//取得檔案路徑
		String brandImg = brand.getBrandImg();
		
		//在網頁中顯示圖片-->直接使用FileProcessing檔的showImg方法
		//傳入參數:1.HttpServletResponse, 2.檔案路徑
		FileProcessing.showImg(resp, brandImg);
	}
	

	// @RequestMapping(value = "/getimage", method = RequestMethod.GET, produces
	// = MediaType.IMAGE_JPEG_VALUE)
	// public void getImage( HttpServletResponse response ) throws IOException
	// {
	//
	// ByteStreams.copy( getClass().getResourceAsStream( "/preview-image.jpg" ),
	// response.getOutputStream() );
	// }

	public Map<String, String> validate(String[] data) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		return null;
	}

}
