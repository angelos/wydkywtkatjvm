public class GC {
	public static void main(String[] args) {
		long time = System.nanoTime();
		for (int i = 0; i < 2000000; i++) {
			if (i % 100000 == 0) {
				time = reportTiming(i, time);
			}
			Thing t = new Thing(i);
		}
	}

	private static class Thing {
		int i, j, k;
		public Thing(int i) {
			this.i = this.j = this.k = i;
		}
	}

	private static long reportTiming(int index, long previousTime) {
		long currentTime = System.nanoTime();
		long elapsed = currentTime - previousTime;
		System.out.println(String.format("> %10d, %9d ns", index, elapsed));
		return currentTime;
	}
}