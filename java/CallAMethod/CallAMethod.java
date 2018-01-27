public class CallAMethod {
    public static void main(String[] args) {
    	int a = 42; // 0x2A in hex
    	int b = 4;
    	int result = add(a, b);
    }

    private static int add(int a, int b) {
    	return a + b;
    }
}
