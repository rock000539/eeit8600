package tw.com.queautiful;

import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;
import org.springframework.social.UserIdSource;
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer;
import org.springframework.social.config.annotation.SocialConfigurer;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;

public class SocialConfig implements SocialConfigurer {
	
	@Bean
    public ConnectController connectController(
                ConnectionFactoryLocator connectionFactoryLocator,
                ConnectionRepository connectionRepository) {
        return new ConnectController(connectionFactoryLocator, connectionRepository) {
        	
        };
    }

	@Override
	public void addConnectionFactories(ConnectionFactoryConfigurer cfConfig, Environment env) {
		
		cfConfig.addConnectionFactory(new FacebookConnectionFactory(
	            env.getProperty("facebook.clientId"),
	            env.getProperty("facebook.clientSecret")));
		
		cfConfig.addConnectionFactory(new TwitterConnectionFactory(
	            env.getProperty("twitter.consumerKey"),
	            env.getProperty("twitter.consumerSecret")));
		
	}

	@Override
	public UserIdSource getUserIdSource() {
		return null;
	}

	@Override
	public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator arg0) {
		return null;
	}

}
