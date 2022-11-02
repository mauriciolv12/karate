import com.intuit.karate.junit5.Karate;

public class karateRunner {
        //tipos de runner en nuestra ejecucion
        @Karate.Test
        Karate testSample() {
                return Karate.run("classpath:REST/karateTest.feature").tags("@casoPost");
        }

 }
