
/***
 * 
 * @author Gabriel_Menachem
 * @ID 302423850
 * 
 */
package AESPackage;
import java.util.Scanner;

public class AES {
	public static int AddBytes(int a, int b){
		return a ^ b;
	}
	public static int DivisionBytes(int a){
		return a >> 1;
	}
	public static int MultiplicationBytes(int a){
		int res = a << 1;
		if(res > 255)
			return AddBytes(res, 0x11B);
		return res;
	}
	public static int MultiplicationPolinomyals(int a, int b){
		int res = 0;
		while(b !=0)
		{
			if(b%2 == 1)
				res = AddBytes(res, a);
			a = MultiplicationBytes(a);
			b = DivisionBytes(b);
		}
		return res;
	}
	public static int InverseMultiplication(int a){
		int res = 0;
		if(a == 0)
			return res;
		
		for(int i = 0 ; i < 255 ; i++ ){
			if(MultiplicationPolinomyals(a, i) == 1){
				res = i;
				break;
			}
		}
		return res;
	}
	public static int Coffiecients(int a){
		int count = 0;
		String Binary = Integer.toBinaryString(a);
		for(int i = 0 ; i < Binary.length() ; i++ )
			if( Binary.charAt(i) == '1')
				count++;
		return count%2;		
	}
	public static int ScalarMultiplication(int a, int b){
		return Coffiecients(a&b);
	}
	public static int MultiplicationMatrixByPolinomyal(int matrixPolinomyal, int Polinomyal){
		int res = 0;
		int currntRes = 0;
		for(int i = 0 ; i < 8 ; i++ ){
			currntRes = ScalarMultiplication(matrixPolinomyal,Polinomyal);
			res = res << 1;
			res = res | currntRes;
			matrixPolinomyal = ((matrixPolinomyal >> 1 | matrixPolinomyal << 7)) & 0xFF;
		}
		return res;
	}
	public static int Sbox(int a){
		return AddBytes(MultiplicationMatrixByPolinomyal(0xF8, InverseMultiplication(a)), 0x63);
	}
	public static int InverseSbox(int a){
		return InverseMultiplication(MultiplicationMatrixByPolinomyal(0x52, AddBytes(a, 0x63)));
	}
	public static void printSbox(){
		char[] str = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',};
		int index = 0;
		System.out.print(String.format("%2s", "   | "));
		for(int i = 0 ; i < str.length ; i++){
			System.out.print(String.format("%2s", str[i]) + " | ");
		}
		System.out.println();
		for(int j = 0 ; j < 256 ; j++ ){
			if(j%16 == 0) {
				System.out.print(String.format("%2s", str[j%16 + index++]) + " | ");
			}
			System.out.print(String.format("%2s", Integer.toHexString(Sbox(j))) + " | ");
			if((j+1)%16 == 0){
				System.out.println();
			}

		}
	}
	public static void printInverseSbox(){
		char[] str = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',};
		int index = 0;
		System.out.print(String.format("%2s", "   | "));
		for(int i = 0 ; i < str.length ; i++){
			System.out.print(String.format("%2s", str[i]) + " | ");
		}
		System.out.println();
		for(int i = 0 ; i < 256 ; i++ ){
			if(i%16 == 0) {
				System.out.print(String.format("%2s", str[i%16 + index++]) + " | ");
			}
			System.out.print(String.format("%2s", Integer.toHexString(InverseSbox(i))) + " | ");
			if((i+1)%16 == 0)
				System.out.println();
		}
	}
	
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		String a,b;
		int tr1, tr2, tr3, tr4, tr5, tr6, 
			tr7, tr8, tr9;
		
		Scanner in = new Scanner(System.in);
		System.out.println("Enter a number: ");
		a = in.nextLine();
		System.out.println("Enter b number: ");
		b = in.nextLine();
		
		tr1 = AddBytes(Integer.parseInt(a, 16), Integer.parseInt(b, 16));
		tr2 = DivisionBytes(Integer.parseInt(a, 16));
		tr3 = MultiplicationBytes(Integer.parseInt(a, 16));
		tr4 = MultiplicationPolinomyals(Integer.parseInt(a, 16),Integer.parseInt(b, 16));
		tr5 = InverseMultiplication(Integer.parseInt(a, 16));
		tr6 = Coffiecients(Integer.parseInt(a, 16));
		tr7 = ScalarMultiplication(Integer.parseInt(a, 16), Integer.parseInt(b, 16));
		tr8 = Sbox(Integer.parseInt(a, 16));
		tr9 = InverseSbox(Integer.parseInt(b, 16)); 
		
		System.out.println(a + " + " + b + " = " + Integer.toHexString(tr1));
		System.out.println(a + " " + getAscii(0xF5) + " X = " + Integer.toHexString(tr2));
		System.out.println(a + " * X = " + Integer.toHexString(tr3));
		System.out.println(a + " " + getAscii(0xF9) + " " + b + " = " + Integer.toHexString(tr4));
		System.out.println(a + "^-1 = " + Integer.toHexString(tr5));
		System.out.println("parity(" + a + ") = " + Integer.toHexString(tr6));
		System.out.println(a + " AND " + b + " = " + Integer.toHexString(tr7));
		System.out.println("Sbox " + a + " = " + Integer.toHexString(tr8));
		System.out.println("InverseSbox " + b + " = " + Integer.toHexString(tr9));
		
		System.out.println("\n\tS-Box\n");
		printSbox();
		System.out.println("\n\tInv S-Box\n");
		printInverseSbox();
	}
	private static char getAscii(int code) {
		char[] EXTENDED = { 0x00C7, 0x00FC, 0x00E9, 0x00E2,
	            0x00E4, 0x00E0, 0x00E5, 0x00E7, 0x00EA, 0x00EB, 0x00E8, 0x00EF,
	            0x00EE, 0x00EC, 0x00C4, 0x00C5, 0x00C9, 0x00E6, 0x00C6, 0x00F4,
	            0x00F6, 0x00F2, 0x00FB, 0x00F9, 0x00FF, 0x00D6, 0x00DC, 0x00A2,
	            0x00A3, 0x00A5, 0x20A7, 0x0192, 0x00E1, 0x00ED, 0x00F3, 0x00FA,
	            0x00F1, 0x00D1, 0x00AA, 0x00BA, 0x00BF, 0x2310, 0x00AC, 0x00BD,
	            0x00BC, 0x00A1, 0x00AB, 0x00BB, 0x2591, 0x2592, 0x2593, 0x2502,
	            0x2524, 0x2561, 0x2562, 0x2556, 0x2555, 0x2563, 0x2551, 0x2557,
	            0x255D, 0x255C, 0x255B, 0x2510, 0x2514, 0x2534, 0x252C, 0x251C,
	            0x2500, 0x253C, 0x255E, 0x255F, 0x255A, 0x2554, 0x2569, 0x2566,
	            0x2560, 0x2550, 0x256C, 0x2567, 0x2568, 0x2564, 0x2565, 0x2559,
	            0x2558, 0x2552, 0x2553, 0x256B, 0x256A, 0x2518, 0x250C, 0x2588,
	            0x2584, 0x258C, 0x2590, 0x2580, 0x03B1, 0x00DF, 0x0393, 0x03C0,
	            0x03A3, 0x03C3, 0x00B5, 0x03C4, 0x03A6, 0x0398, 0x03A9, 0x03B4,
	            0x221E, 0x03C6, 0x03B5, 0x2229, 0x2261, 0x00B1, 0x2265, 0x2264,
	            0x2320, 0x2321, 0x00F7, 0x2248, 0x00B0, 0x2219, 0x00B7, 0x221A,
	            0x207F, 0x00B2, 0x25A0, 0x00A0
	            };
		
		if (code >= 0x80 && code <= 0xFF) {
            return EXTENDED[code - 0x7F];
        }
        return (char) code;
	}
}
