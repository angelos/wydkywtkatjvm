package addition;

public class SimpleAdditionWithRandom {
    public static void main(String[] args) {
    	int a = 42; // 0x2A in hex
    	int b = (int)(Math.random()*100);
    	int result = a + b;
    	System.out.println("> " + result);
    }
}
