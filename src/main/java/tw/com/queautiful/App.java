package tw.com.queautiful;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
@ServletComponentScan
@SpringBootApplication(
		exclude = {
				org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration.class,
		}
)
public class App {
	public static void main(String[] args) throws Exception {
        SpringApplication.run(App.class, args);
    }
}
