package domainModelTest;

import org.junit.Before;
import org.junit.Test;
import domainModel.*;

import static org.junit.Assert.*;

public class DomainModelTest {
    private Artur artur;
    private Creatures creatures;
    private RandomHole randomHole;

    @Before
    public void SetUp(){
        artur = new Artur();
        creatures = new Creatures();
        randomHole = new RandomHole();
    }

    @Test
    public void testArturSay(){
        assertTrue(new Artur().say().equals("А у меня, кажется, большие проблемы с образом жизни"));
    }

    @Test
    public void testPhraseMovingCorrectly(){
        assertTrue(creatures.getLocation().equals(randomHole.getTransferLocation()));
    }

    // RANDOM HOLE //////////////
    @Test
    public void testRandomHoleFirstClose(){
        assertFalse(new RandomHole().getIsOpen());
    }

    @Test
    public void testExactSpeakingMomentArturPhrase(){
        artur.say();
        assertTrue(randomHole.getIsOpen());
    }

    @Test
    public void testRandomHoleTransferLocation(){
        assertTrue(randomHole.getTransferLocation().equals("Far, far in time in distant galaxy"));
    }

    @Test
    public void testRandomHoleOpeningPlace(){
        assertTrue(randomHole.getOpeningPlace().equals("The fabric of space-time"));
    }

    @Test
    public void testRandomHolePhraseMovePath(){
        assertTrue(randomHole.getPhraseMovePath().equals("Through almost endless expanses of space"));
    }

    @Test
    public void testRandomHoleOpen(){
        RandomHole randomHole = new RandomHole();
        randomHole.open();
        assertTrue(randomHole.getIsOpen());
    }

    @Test
    public void testRandomHoleMovePhrase(){
        RandomHole randomHole = new RandomHole();
        randomHole.open();
        assertTrue(randomHole.movePhrase("Phrase"));
    }

    // CREATURES //////////////
    @Test
    public void testCreaturesBalance(){
        assertTrue(creatures.balance());
    }

    @Test
    public void testCreaturesLocation(){
        assertTrue(creatures.getLocation().equals("Far, far in time in distant galaxy"));
    }

    @Test
    public void testCreaturesMindset(){
        assertEquals(CreaturesMindset.MILITANT, creatures.getMindset());
    }

    @Test
    public void testCreaturesDemeanor(){
        assertEquals(CreaturesDemeanor.STRANGE, creatures.getDemeanor());
    }

    @Test
    public void testCreaturesBalancingLocation(){
        assertEquals(CreaturesBalancingLocation.ON_THE_VERGE_OF_A_TERRIBLE_INTERSTELLAR_WAR, creatures.getBalancingLocation());
    }
}
