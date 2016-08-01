package tw.com.queautiful.product.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.Post;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/facebook")
public class FacebookController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	private Facebook facebook;
	private ConnectionRepository connectionRepository;

    @Inject
    public FacebookController(Facebook facebook, ConnectionRepository connectionRepository) {
        this.facebook = facebook;
		this.connectionRepository = connectionRepository;
    }
    
    @RequestMapping(value="/connect", method=RequestMethod.GET)
    public String connectFacebook() {
    	return "/connect/facebookConnect";
    }
    
    @RequestMapping(value="/connected", method=RequestMethod.GET)
    public String connectedFacebook() {
    	return "/connect/facebookConnected";
    }

    @RequestMapping(method=RequestMethod.GET)
    public String helloFacebook(Model model) {
    	
        if (connectionRepository.findPrimaryConnection(Facebook.class) == null) {
        	log.debug("helloFacebook inside");
        	return "/connect/facebookConnected";
        }
        
        log.debug("helloFacebook outside");
        model.addAttribute("facebookProfile", facebook.userOperations().getUserProfile());
        PagedList<Post> feed = facebook.feedOperations().getFeed();
        model.addAttribute("feed", feed);
    	
        return "/connect/hello";
    }
	
}
