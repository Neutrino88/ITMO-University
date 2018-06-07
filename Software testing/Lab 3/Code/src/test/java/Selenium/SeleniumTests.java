package Selenium;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.concurrent.TimeUnit;

public class SeleniumTests {
    private static String URL = "https://twitter.com/";
    private static String USERNAME = "Username";
    private static String PASSWORD = "Password";

    private WebDriver drivers[] = new WebDriver[2];

    private void login(WebDriver driver, String username, String password){
        driver.get(URL);

        driver.findElement(By.xpath("//*[contains(@class, 'StaticLoggedOutHomePage-buttonLogin')]")).click();
        // login
        driver.findElement(By.xpath("//*[contains(@class, 'js-username-field')]")).click();
        driver.findElement(By.xpath("//*[contains(@class, 'js-username-field')]")).sendKeys(username);
        // password
        driver.findElement(By.xpath("//*[contains(@class, 'js-password-field')]")).click();
        driver.findElement(By.xpath("//*[contains(@class, 'js-password-field')]")).sendKeys(password);
        // submit
        driver.findElement(By.xpath("//*[contains(@class, 'submit EdgeButton EdgeButton--primary EdgeButtom--medium')]")).click();
    }

    private void openSettings(WebDriver driver){
        driver.findElement(By.xpath("//*[contains(@class,'btn js-tooltip settings dropdown-toggle js-dropdown-toggle')]")).click();
        driver.findElement(By.xpath("//*[contains(@data-nav,'settings')]")).click();
    }

    private void pause(int millisec){
        try {
            Thread.sleep(millisec);
        } catch (InterruptedException ignored) {}
    }

    private WebElement openPost(WebDriver driver, int postNumber){
        WebElement postContainer = driver.findElement(By.xpath("//*[contains(@class, 'stream')]/ol[position()=1]/li[position()=" + postNumber + "]/div[position()=1]/div[position()=1]"));
        WebElement post = driver.findElement(By.xpath("//*[contains(@class, 'stream')]/ol[position()=1]/li[position()=" + postNumber + "]/div[position()=1]"));
        postContainer.click();

        return post;
    }

    @Before
    public void setUp () {
        System.setProperty("webdriver.gecko.driver", "C:\\Users\\Oleg\\Desktop\\Selenium\\drivers\\geckodriver.exe");
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\Oleg\\Desktop\\Selenium\\drivers\\chromedriver.exe");

        drivers[1] = new FirefoxDriver();
        drivers[1].manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);

        drivers[0] = new ChromeDriver();
        drivers[0].manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
    }

    @Test
    public void openPageTest() {
        for (WebDriver driver : drivers) {
            driver.get(URL);
            driver.quit();
        }
    }

    @Test
    public void loginWithInvalidDataTest() {
        for (WebDriver driver : drivers) {
            login(driver, "Lavrov", "Lavrov1950");
            //get message text
            String errorMsg = driver.findElement(By.xpath("//*[contains(@class, 'message-text')]")).getText();

            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox","Введённые имя пользователя и пароль не совпадают с сохранёнными в нашей базе данных. Проверьте правильность введённых данных и повторите попытку.", errorMsg);
            driver.quit();
        }
    }

    @Test
    public void loginWithValidDataTest() {
        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);
            //get message text
            String errorMsg = driver.findElement(By.xpath("//*[contains(text(), 'Твитнуть')]")).getText();

            driver.quit();
            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "Твитнуть", errorMsg);
        }
    }

    @Test
    public void readNewsWithoutAuthTest() {
        for (WebDriver driver : drivers) {
            driver.get(URL + "MID_RF");
            String text = driver.findElement(By.xpath("//*[contains(text(),'Читать')]")).getText();

            driver.quit();
            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox","Читать", text);
        }
    }

    @Test
    public void readNewsWithAuthTest() {
        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);
            driver.get(URL + "MID_RF");
            String text = driver.findElement(By.xpath("//*[contains(text(),'Читать')]")).getText();

            driver.quit();
            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "Читать", text);
        }
    }

    @Test
    public void changeNameToCorrectNameTest() {
        String newUsername = "OlegOlegOleg222";

        for (WebDriver driver : drivers) {
            if (driver == drivers[1]) { driver.quit(); continue; }
            login(driver, USERNAME, PASSWORD);
            openSettings(driver);

            //change username
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).clear();
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).sendKeys(newUsername.substring(0,4));
            pause(2000);
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).sendKeys(newUsername.substring(4));
            //submit
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).sendKeys(Keys.ENTER);
            // type password
            driver.findElement(By.xpath("//*[contains(@name,'auth_password')]")).sendKeys(PASSWORD);
            driver.findElement(By.xpath("//*[contains(@name,'auth_password')]")).sendKeys(Keys.ENTER);
            // get success
            driver.navigate().refresh();
            String link = driver.findElement(By.xpath("//*[contains(@class,'notification t1-infotext')]")).getText();
            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "https://twitter.com/" + newUsername, link);

            // CHANGE IT BACK
            //change username
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).clear();
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).sendKeys(USERNAME);
            //submit
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).sendKeys(Keys.ENTER);
            // type password
            driver.findElement(By.xpath("//*[contains(@name,'auth_password')]")).sendKeys(PASSWORD);
            driver.findElement(By.xpath("//*[contains(@name,'auth_password')]")).sendKeys(Keys.ENTER);

            driver.quit();
        }
    }

    @Test
    public void changeNameToIncorrectNameTest() {
        String newUsername = "Oleg";

        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);
            openSettings(driver);

            //change username
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).clear();
            pause(3000);
            driver.findElement(By.xpath("//*[contains(@name,'user[screen_name]')]")).sendKeys(newUsername);
            pause(3000);
            // get error message
            String errorMsg = driver.findElement(By.xpath("//*[contains(@class,'control-group problem')]/div[position()=1]/p[position()=1]")).getText();

            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "Имя пользователя слишком короткое", errorMsg);
            driver.quit();
        }
    }

    @Test
    public void seeChannelFollowingWithAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);

            driver.get(URL + channelName);
            //click to following
            driver.findElement(By.xpath("//*[contains(@class,'ProfileNav-item ProfileNav-item--following')]")).click();
            pause(5000);
            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "https://twitter.com/" + channelName + "/following", driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void seeChannelFollowingWithoutAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            driver.get(URL + channelName + "/following");
            pause(5000);

            Assert.assertNotEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "https://twitter.com/" + channelName + "/following", driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void seeChannelFollowersWithAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);

            driver.get(URL + channelName);
            //click to following
            driver.findElement(By.xpath("//*[contains(@class,'ProfileNav-item ProfileNav-item--followers')]")).click();
            pause(5000);
            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "https://twitter.com/" + channelName + "/followers", driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void seeChannelFollowersWithoutAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            driver.get(URL + channelName + "/followers");
            pause(5000);

            Assert.assertNotEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "https://twitter.com/" + channelName + "/followers", driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void seeChannelFavoritesWithAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);
            driver.get(URL + channelName + "/likes");
            pause(5000);

            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "https://twitter.com/" + channelName + "/likes", driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void seeChannelFavoritesWithoutAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            driver.get(URL + channelName + "/likes");
            pause(5000);

            Assert.assertNotEquals((driver == drivers[0]) ? "Chrome" : "Firefox", "https://twitter.com/" + channelName + "/likes", driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void seePostWithAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);
            driver.get(URL + channelName);

            WebElement post = openPost(driver, 1);
            pause(5000);
            String path = post.getAttribute("data-permalink-path");

            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", URL.substring(0, URL.length()-1) +  path, driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void seePostWithoutAuthTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            driver.get(URL + channelName);

            WebElement post = openPost(driver, 1);
            pause(5000);
            String path = post.getAttribute("data-permalink-path");

            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", URL.substring(0, URL.length()-1) +  path, driver.getCurrentUrl());
            driver.quit();
        }
    }

    @Test
    public void likePostTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);
            driver.get(URL + channelName);

            WebElement post = openPost(driver, 1);
            pause(3000);

            String likesCountOld = driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=3]/button[position()=1]/span[position()=1]/span[position()=1]")).getText();
            // like
            driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=3]/button[position()=1]")).click();
            pause(3000);
            String likesCountNew = driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=3]/button[position()=2]/span[position()=1]/span[position()=1]")).getText();

            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", Integer.parseInt(likesCountOld)+1, Integer.parseInt(likesCountNew));
            // dislike
            driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=3]")).click();
            pause(3000);
            driver.quit();
        }
    }

    @Test
    public void retweetPostTest() {
        String channelName = "MID_RF";

        for (WebDriver driver : drivers) {
            login(driver, USERNAME, PASSWORD);
            driver.get(URL + channelName);

            WebElement post = openPost(driver, 1);
            pause(3000);

            // count retweets
            String retweetsCountOld = driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=2]/button[position()=1]/span[position()=1]/span[position()=1]")).getText();
            // retweet
            driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=2]/button[position()=1]")).click();
            pause(3000);
            // submit
            driver.findElement(By.xpath("//*[contains(@class, 'RetweetDialog-retweetActionLabel')]/..")).click();
            pause(3000);
            // count retweets
            String retweetsCountNew = driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=2]/button[position()=2]/span[position()=1]/span[position()=1]")).getText();

            Assert.assertEquals((driver == drivers[0]) ? "Chrome" : "Firefox", Integer.parseInt(retweetsCountOld)+1, Integer.parseInt(retweetsCountNew));
            //cancel retweet
            pause(1000);
            driver.findElement(By.xpath("//*[contains(@class, 'permalink-inner permalink-tweet-container')]/div[position()=1]/div[position()=5]/div[position()=3]/div[position()=2]/button[position()=2]/..")).click();
            pause(1000);
            driver.quit();
        }
    }

}


