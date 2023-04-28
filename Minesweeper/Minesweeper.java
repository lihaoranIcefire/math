import java.lang.Math;
import java.awt.*;
import java.awt.event.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.*;
import javax.swing.JDialog;
import java.lang.*;
import java.util.*;
import java.util.Arrays;
import java.net.*;
import java.applet.*;


public class Minesweeper extends Applet {
	public static void main(String[] args) {
		new Dialogue(1, null);
	}
}


class GameMap extends JFrame {
	final int ROW = 10;
	final int COL = 10;
	final int WIDTH = 50;
	final int NUMBER_OF_MINES = 10;
	final int MINE = 9;
	final int TITLE_SIZE = 30;

    // Record eight different directions
	final int dx[] = { -1, -1, -1, 0, 0, 1, 1, 1 };
	final int dy[] = { -1, 0, 1, -1, 1, -1, 0, 1 };

    // opened recorder where a cell is opened, content contains the contents of a cell
	int opened[][] = new int [ROW][COL];
	int content[][] = new int [ROW][COL];
	int flagged[][] = new int [ROW][COL];
	boolean GAMEOVER = false;
	
	// Generate the map
	JButton map[][] = new JButton[ROW][COL];

	// MouseListener for buttons
	MouseAdapter mouse_listener = new MouseAdapter() {
		@Override
		public void mouseClicked(MouseEvent e) {
			if(e.getButton() == MouseEvent.BUTTON1) {
				process(GetCell(((AbstractButton) e.getSource())), e.getClickCount());
			}
			else if(e.getButton() == MouseEvent.BUTTON3) {
				process(GetCell(((AbstractButton) e.getSource())), 0);
			}
			if(GameOverWon()) {
				for(int p = 0; p < ROW; p++) {
					for(int q = 0; q < COL; q++) {
						map[p][q].removeMouseListener(mouse_listener);
						if(content[p][q] == MINE) map[p][q].setIcon(icon[11]);
						else map[p][q].setIcon(icon[content[p][q]]);
					}
				}
				new Dialogue(2, GameMap.this);
			}
		}
	};

	// Choose icons for the map
	URL[] url = new URL[13];
	ImageIcon[] icon = new ImageIcon[13];


	public int[] GetCell(AbstractButton button) {
		int[] coordinate = new int[2];
		for(int x = 0; x < ROW; x++) {
			for(int y = 0; y < COL; y++) {
				if(map[x][y] == button) {
					coordinate[0] = x;
					coordinate[1] = y;
					return coordinate;
				}
			}
		}
		return coordinate;
	}
	
	
	public void StartGame() {
		InitializeMap();
		
		setSize(ROW * WIDTH, COL * WIDTH + TITLE_SIZE);
		setTitle("Minesweeper Game");
		setLayout(new BorderLayout());
		setLocationRelativeTo(null);
		
		JPanel Panel = new JPanel();
		Panel.setLayout(null);

		// Set the map
		for(int i = 0; i < ROW; i++) {
			for( int j = 0; j < COL; j++) {
				map[i][j] = new JButton();
		        map[i][j].setBounds(WIDTH * i, WIDTH * j, WIDTH, WIDTH);
		    	map[i][j].setIcon(icon[10]);
				Panel.add(map[i][j]);
			}
		}

		// Give instructions when button was clicked
		for(int i = 0; i < ROW; i++) {
			for(int j = 0; j < COL; j++) {
				map[i][j].addMouseListener(mouse_listener);
			};
		}
		
		add(Panel, BorderLayout.CENTER);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

    // Initialize the map
	public void InitializeMap() {
		try {
			for(int i = 0; i <= 12; i++) {
				String str = "https://raw.githubusercontent.com/lihaoranIcefire/math/master/Minesweeper/icons/";
				if(i == 9) str += "mine.png";
				else if(i == 10) str += "unopened.png";
				else if(i == 11) str += "flag.png";
				else if(i == 12) str += "mine_explodes.png";
				else str += Integer.toString(i) + ".png";
				url[i] = new URL(str);
				// icon[i] = new ImageIcon(url[i]);
				icon[i] = new ImageIcon((new ImageIcon(url[i])).getImage().getScaledInstance(WIDTH, WIDTH, Image.SCALE_SMOOTH));
			}
		} catch (MalformedURLException e) {
			System.out.println("The URL is malformed: " + e.getMessage());
		}
		int mine_count = 0;
		while(mine_count < NUMBER_OF_MINES) {
			int pos = (int)(Math.random() * (ROW * COL));
	    	if(content[pos/COL][pos%COL] == MINE) continue;
	    	content[pos/COL][pos%COL] = MINE;
	    	mine_count++;
		}
		for(int i = 0; i < ROW; i++) {
		    for(int j = 0; j < COL; j++) {
				opened[i][j] = 0; flagged[i][j] = 0;
				if(content[i][j] != MINE) content[i][j] = CountMineNear(i, j, false);
		    }
        }
	}

	// Decide whether position is valid
	boolean IsPosValid(int x, int y) {return 0 <= x && x < ROW && 0 <= y && y < COL;}
	
	// Count the number of mines in the nearby eight cells
	int CountMineNear(int x, int y, boolean openMap) {
		int mine_count = 0;
		int mine_count_open = 0;
		int X, Y;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(IsPosValid(X, Y) && content[X][Y] == MINE) mine_count++;
			if(IsPosValid(X, Y) && content[X][Y] == MINE && flagged[X][Y] == 1) mine_count_open++;
		}
		if(openMap) return mine_count_open;
		else return mine_count;
	}

	public void process(int[] coordinate, int key) {
		int x = coordinate[0]; int y = coordinate[1];
		switch(key) {
			case 0: // This stands for right-click
				if(opened[x][y] == 1) return;
				if(flagged[x][y] == 0) {flagged[x][y] = 1; map[x][y].setIcon(icon[11]);}
				else {flagged[x][y] = 0; map[x][y].setIcon(icon[10]);}
				break;
			case 1: click(x, y); break;
			case 2: double_click(x, y); break;
		}
	}

	boolean GameOverWon() {
		for(int i = 0; i < ROW; i++) {
			for(int j = 0; j < COL; j++) {
				if(opened[i][j] == 0 && content[i][j] != MINE) return false;
			}
		}
		return true;
	}

	void click(int x, int y)
	{
		if(opened[x][y] == 1) return;
		if(content[x][y] == MINE) {
			for(int p = 0; p < ROW; p++) {
				for(int q = 0; q < COL; q++) {
					map[p][q].removeMouseListener(mouse_listener);
					map[p][q].setIcon(icon[content[p][q]]);
				}
			}
			map[x][y].setIcon(icon[12]);
			new Dialogue(0, GameMap.this);
			return;
		}
		opened[x][y] = 1;
		map[x][y].setIcon(icon[content[x][y]]);
		if(CountMineNear(x, y, true) < content[x][y]) return;
		int X, Y;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(IsPosValid(X, Y) && flagged[X][Y] == 0 && opened[X][Y] == 0 && opened[X][Y] == 0) {click(X, Y);}
		}
	}
	
	void double_click(int x, int y) {
		if(opened[x][y] == 0 || content[x][y] == MINE) return;
		int X, Y;
		if(CountMineNear(x, y, true) < content[x][y]) return;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(IsPosValid(X, Y) && flagged[X][Y] == 0 && opened[X][Y] == 0) {click(X, Y);}
		}
	}
}

class Dialogue extends JDialog {
	private GameMap gameMap;
	public Dialogue(int option, GameMap gameMap) {
		this.gameMap = gameMap;
		Dimension screen_size = Toolkit.getDefaultToolkit().getScreenSize();
		setLocation(screen_size.width / 3, screen_size.height / 3);
		
		setSize(300,200);
		setTitle("Minesweeper Game");
		setLayout(new BorderLayout());
		switch(option) {
			case 0: add(new JLabel("Sorry, you lost!", SwingConstants.CENTER), BorderLayout.CENTER); break;
			case 1: add(new JLabel("Welcome to the Minesweeper Game!", SwingConstants.CENTER), BorderLayout.CENTER); break;
			case 2: add(new JLabel("Congratulations! You won!", SwingConstants.CENTER), BorderLayout.CENTER); break;
		}
		JPanel panel = new JPanel();
		JButton start = new JButton("Start");
		start.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		    	if (gameMap != null) {
					gameMap.dispose();
				}
				GameMap game_map = new GameMap();
				game_map.StartGame();
		    	dispose();
		    }
		});
		
		JButton exit = new JButton("End");
		exit.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
		    	System.exit(0);
		    }
		});
		
		panel.add(start);
		panel.add(exit);
		add(panel, BorderLayout.SOUTH);
		setVisible(true);
	}
}
