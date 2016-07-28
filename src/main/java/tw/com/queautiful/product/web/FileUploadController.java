package tw.com.queautiful.product.web;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.hateoas.Link;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/upload")
public class FileUploadController {
	
	// 查看路徑和檔案名稱用
	private Logger log = LoggerFactory.getLogger(FileUploadController.class);

	// 路徑, 也可寫本地路徑  ex -> E:\Pic\
	public static final String ROOT = "src\\main\\webapp\\WEB-INF\\img\\";
	
	// 讀取資源檔案都可使用  ex -> 圖片、檔案、property檔, 透過下面建構子Autowired建立
	private final ResourceLoader resourceLoader;

	@Autowired
	public FileUploadController(ResourceLoader resourceLoader) {
		this.resourceLoader = resourceLoader;
	}
	
	// 讀取此路徑下所有檔案路徑轉為List集合
	@RequestMapping(method = RequestMethod.GET, value = "/links")
	@ResponseBody
	public List<Link> getFileInfo(Model model) throws IOException {
		
		List<Link> links = Files.walk(Paths.get(ROOT))
		.filter(path -> !path.equals(Paths.get(ROOT)))
		.map(path -> Paths.get(ROOT).relativize(path))
		.map(path -> linkTo(methodOn(FileUploadController.class).getFile(path.toString())).withRel(path.toString()))
		.collect(Collectors.toList());
		
		for(Link link : links) {
			log.debug("link = {}", link);
		}
		
		return links;
	}
	
	// 透過檔名和檔案取得
	@RequestMapping(method = RequestMethod.GET, value = "/{filename:.+}")
	@ResponseBody
	public ResponseEntity<?> getFile(@PathVariable String filename) {

		try {
			// ResponseEntity和ResponseBody有些類似, 但更具有彈性, 請參考  http://goo.gl/Oa4TQ3
			// resourceLoader.getResource() 透過路徑和檔名取得檔案送回
			return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(ROOT, filename).toString()));
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}
	
	// 將檔案寫入資料夾中
	@RequestMapping(method = RequestMethod.POST, value = "/file")
	public String handleFileUpload(@RequestParam("file") MultipartFile file,
								   RedirectAttributes redirectAttributes) {
		
		if (!file.isEmpty()) {
			try { // 將傳入的檔案copy到資料夾(目前使用傳入的檔名)
				Files.copy(file.getInputStream(), Paths.get(ROOT, file.getOriginalFilename()));
				redirectAttributes.addFlashAttribute("message", "You successfully uploaded " + file.getOriginalFilename() + "!");
			} catch (IOException|RuntimeException e) {
				redirectAttributes.addFlashAttribute("message", "Failued to upload " + file.getOriginalFilename() + " => " + e.getMessage());
			}
		} else {
			redirectAttributes.addFlashAttribute("message", "Failed to upload " + file.getOriginalFilename() + " because it was empty");
		}

		return "redirect:/upload/";
	}
	
	// 上傳圖片測試網站
	@RequestMapping(method = RequestMethod.GET, value = "/")
	public String uploadFormPage(Model model) {
		return "/product/uploadForm";
	}
	
}
