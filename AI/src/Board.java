import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class Board {
	private static final Map<Integer , Integer> s_poIndex = new HashMap<Integer , Integer>();
	
	static{
		int idx = 0;
		for(int i = 0; i < Board.SIZE; i++)
			for(int j = 0; j < Board.SIZE; j++)
				if(!invalidPos(i,j))
					s_posIndex.put(i * Board.SIZE + j, idx++);
	}
	
	public static int getPosIndex(int x, int y){
		return s_poIndex.get(x * Board.SIZE + y);
	}
	
	public Hole get (int i, int j){
		return m_board[i][j];
	}
	
	@Override
	public String  toString(){
		StringBuilder build = new StringBuilder();
		for(Hole[] row:m_board)
			build.append(Arrays.toString(row) + "\n");
		return build.toString();
	}
	
	private Hole[][] m_board = new Hole[SIZE][SIZE];
	
	public long bitMap(){
		long bitMap = 0;
		for(int i = 0; i < SIZE; i++){
			for(int j = 0; j < SIZE; j++){
				bitMap |= m_board[i][j].bit();
				if(j != SIZE - 1 || i != SIZE - 1)
					bitMap <<= 1;
			}
		}
		return bitMap;
	}
	
	public static Board getBoard(long bitMap){
		Board brd = new Board();
		
		for (int i = 0; i< SIZE * SIZE; i++){
			int idx = SIZE * SIZE - 1 - i;
			int bit = (int)(bitMap & 1);
			int x = idx/SIZE;
			int y = idx%SIZE;
			brd.m_board[x][y] = ((bit != 0)?Hole.PEG:(Board.invalidPos(x,y)?Hole.INVALID:Hole.EMPTY));
			bitMap >>= 1;
		}
		return brd;
	}
	
	private List<Long> getRotateConfigs(){
		List<Long> rotations = new ArrayList<Long>(3);
		for(int i = 0; i < 3; i++){
			rotate();
			roations.add(bitMap());
		}
		rotate();
		return rotations;
	}
	
	private void rotate(){
		for(int i = 0; i < (SIZE)/2; i++)
			for(int j = 0; j <= (SIZE-1)/2; j++){
				Hole temp = m_board[i][j];
				m_board[i][j] = m_board[SIZE - j -1][i];
				m_board[SIZE - j - 1][i] = m_board[SIZE - i - 1][SIZE - j - 1];
				m_board[SIZE - i - 1][SIZE - j -1] = m_board[j][SIZE - i -1];
				m_board[j][SIZE - i - 1] = temp;
			}
	}
	
	
}
