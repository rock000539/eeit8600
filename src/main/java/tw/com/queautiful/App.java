package tw.com.queautiful;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import tw.com.queautiful.product.entity.Product;
import tw.com.queautiful.product.service.ProductService;


@Configuration
@ComponentScan
@EnableAutoConfiguration
@ServletComponentScan
@SpringBootApplication
public class App extends SpringBootServletInitializer {
	
	public static void main(String[] args) throws Exception {
        SpringApplication.run(App.class, args);
    }
	
}
