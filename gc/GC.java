public class GC {
	public static void main(String[] args) {
		for (int i = 0; i < 2000000; i++) {
			if (i % 100000 == 0) {
				System.out.println("> " + i);
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
}