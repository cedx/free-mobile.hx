import free_mobile.*;
import mcover.coverage.MCoverage;
import mcover.coverage.client.LcovPrintClient;
import utest.Runner;
import utest.ui.Report;

/** Runs the test suites. **/
class TestAll {

	/** The test cases. **/
	static final tests = [
		new ClientTest()
	];

	/** Application entry point. **/
	static function main() {
		final runner = new Runner();
		runner.onComplete.add(_ -> {
			final logger = MCoverage.getLogger();
			logger.addClient(new LcovPrintClient("free_mobile", "var/lcov.info"));
			logger.report();
		});

		Report.create(runner);
		for (test in tests) runner.addCase(test);
		runner.run();
	}
}
