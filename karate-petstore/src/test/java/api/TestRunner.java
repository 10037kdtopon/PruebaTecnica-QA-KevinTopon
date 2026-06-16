package api;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestRunner {

    private static final String REPORT_DIR = "target/karate-reports";

    @Test
    void testUserApiSuite() {
        Results results = Runner.path("classpath:api")
                .tags("~@e2e")
                .outputCucumberJson(true)
                .reportDir(REPORT_DIR)
                .parallel(1);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    void testUserLifecycleE2E() {
        Results results = Runner.path("classpath:api/user/user-lifecycle.feature")
                .outputCucumberJson(true)
                .reportDir(REPORT_DIR)
                .parallel(1);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
