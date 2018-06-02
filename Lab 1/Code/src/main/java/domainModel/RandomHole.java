package domainModel;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;
import lombok.extern.log4j.Log4j2;

@Log4j2
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RandomHole {
    @Getter
    String openingPlace;
    @Getter
    String transferLocation;
    @Getter
    Boolean isOpen;
    @Getter
    String phraseMovePath;

    public RandomHole(){
        openingPlace = "The fabric of space-time";
        transferLocation = "Far, far in time in distant galaxy";
        phraseMovePath = "Through almost endless expanses of space";
        isOpen = false;
    }

    public void open(){
        isOpen = true;
    }

    public boolean movePhrase(String phrase){
        return true;
    }

}
