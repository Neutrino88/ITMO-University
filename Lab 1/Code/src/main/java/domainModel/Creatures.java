package domainModel;

import lombok.Getter;
import lombok.experimental.FieldDefaults;
import lombok.extern.log4j.Log4j2;

import static lombok.AccessLevel.PRIVATE;

@Log4j2
@FieldDefaults(level = PRIVATE)
public class Creatures {
    @Getter
    CreaturesMindset mindset;
    @Getter
    CreaturesDemeanor demeanor;
    @Getter
    CreaturesBalancingLocation balancingLocation;
    @Getter
    String location;

    public Creatures(){
        mindset = CreaturesMindset.MILITANT;
        demeanor = CreaturesDemeanor.STRANGE;
        balancingLocation = CreaturesBalancingLocation.ON_THE_VERGE_OF_A_TERRIBLE_INTERSTELLAR_WAR;
        location = "Far, far in time in distant galaxy";
    }

    public boolean balance(){
        return true;
    }
}