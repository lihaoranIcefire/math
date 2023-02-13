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
		new Dialogue(1);
	}
}


class GameMap extends JFrame {
	final int ROW = 10;
	final int COL = 10;
	final int WIDTH = 50;
	final int NUMBER_OF_MINES = 10;
	final int MINE = 9;

    // Record eight different directions
	final int dx[] = { -1, -1, -1,  0,  0,  1,  1,  1 };
	final int dy[] = { -1,  0,  1, -1,  1, -1,  0,  1 };

    // opened recorder where a cell is opened, content contains the contents of a cell
	int opened[][] = new int [ROW][COL];
	int content[][] = new int [ROW][COL];
	
	// Generate the map
	JButton map[][] = new JButton[ROW][COL];

	// Choose icons for the map
	URL[] url = new URL[11];
	ImageIcon[] icon = new ImageIcon[11];


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
		
		setSize(ROW * WIDTH, COL * WIDTH + 30);
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
				map[i][j].addMouseListener(new MouseAdapter() {
					@Override
					public void mouseClicked(MouseEvent e) {
						if(e.getButton() == MouseEvent.BUTTON1) {
							process(GetCell(((AbstractButton) e.getSource())), e.getClickCount());
						}
						else if(e.getButton() == MouseEvent.BUTTON3) {
							process(GetCell(((AbstractButton) e.getSource())), 0);
						}
						if(only_landmine_left()) {
							dispose();
							new Dialogue(2);
						}
					}
				});
			};
		}
		
		add(Panel, BorderLayout.CENTER);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

    // Initialize the map
	public void InitializeMap() {
		try {
			for(int i = 0; i <= 10; i++) {
				String str = "https://raw.githubusercontent.com/lihaoranIcefire/math/master/Minesweeper/icons/";
				if(i == 9) str += "flag.png";
				else if(i == 10) str += "unopened.png";
				else str += Integer.toString(i) + ".png";
				url[i] = new URL(str);
				icon[i] = new ImageIcon(url[i]);
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
				if(content[i][j] != MINE) content[i][j] = CountMineNear(i, j);
		    }
        }
	}
	
	// Count the number of mines in the nearby eight cells
	int CountMineNear(int x, int y) {
		int mine_count = 0;
		int X, Y;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(0 <= X && X < ROW && 0 <= Y && Y < COL && content[X][Y] == MINE) mine_count++;
		}
		return mine_count;
	}

	public void process(int[] coordinate, int option) {
		int x = coordinate[0]; int y = coordinate[1];
		switch(option) {
			case 0:
				if(opened[x][y] == 1) return;
				if(content[x][y] != MINE) {
					dispose();
					new Dialogue(0);
				}
				opened[x][y] = 1;
			break;
			case 1:
				if(opened[x][y] == 1) return;
				if(content[x][y] == MINE) {
					dispose();
					new Dialogue(0);
				}
				else dig(x, y);
			break;
			case 2:
				if(opened[x][y] == 0) return;
				double_click(x, y);
			break;
		}
		for(int p = 0; p < ROW; p++) {
			for(int q = 0; q < COL; q++) {
				if(opened[p][q] == 1) map[p][q].setIcon(icon[content[p][q]]);
			}
		}
	}

	boolean only_landmine_left() {
		for(int i = 0; i < ROW; i++) {
			for(int j = 0; j < COL; j++) {
				if(opened[i][j] == 0 && content[i][j] != MINE) return false;
			}
		}
		return true;
	}

	void dig(int x, int y)
	{
		if(content[x][y] == MINE) return;
		int count = 0, X, Y;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(0 <= X && X < ROW && 0 <= Y && Y < COL && content[X][Y] == MINE && opened[X][Y] == 1) count++;
		}
		if(count < content[x][y]) {
			opened[x][y] = 1;
			return;
		}
		opened[x][y] = 1;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(0 <= X && X < ROW && 0 <= Y && Y < COL) {
				if(opened[X][Y] == 0) dig(X, Y);
			}
		}
	}
	
	void double_click(int x, int y) {
		if(content[x][y] == MINE) return;
		int count = 0, X, Y;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(0 <= X && X < ROW && 0 <= Y && Y < COL && content[X][Y] == MINE && opened[X][Y] == 1) count++;
		}
		if(count < content[x][y]) return;
		for(int i = 0; i < 8; i++) {
			X = x + dx[i];
			Y = y + dy[i];
			if(0 <= X && X < ROW && 0 <= Y && Y < COL) {
				if(opened[X][Y] == 0) dig(X, Y);
			}
		}
	}
}

class Dialogue extends JDialog {
	public Dialogue(int option)
	{
		Dimension screen_size = Toolkit.getDefaultToolkit().getScreenSize();
		setLocation(screen_size.width / 3, screen_size.height / 3);
		
		setSize(300,200);
		setTitle("Minesweeper Game");
		setLayout(new BorderLayout());
		switch(option) {
			case 0: add(new JLabel("Sorry, you lost!", SwingConstants.CENTER), BorderLayout.CENTER);
			break;
			case 1: add(new JLabel("Welcome to the Minesweeper Game!", SwingConstants.CENTER), BorderLayout.CENTER);
			break;
			case 2: add(new JLabel("Congratulations! You won!", SwingConstants.CENTER), BorderLayout.CENTER);
			break;
		}
		JPanel panel = new JPanel();
		JButton start = new JButton("Start");
		start.addActionListener(new ActionListener() {
		    public void actionPerformed(ActionEvent e) {
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
