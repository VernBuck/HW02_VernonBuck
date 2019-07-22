#define REG_DISPCTL *(unsigned short *)0x4000000
#define VIDEO_BUFFER ((unsigned short *)0x6000000)

/* Create a color with the specified RGB values */
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

/* Calculate the position of a pixel based on it's row and column */
#define OFFSET(R,C,ROWLEN) ((R)*ROWLEN+(C))

//Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

#define SCANLINECOUNTER *(volatile unsigned short *)0x4000006

void setPixel(int, int, unsigned short);
void waitForVblank();
//void delay(int n);
// TODO add the drawTriangle function prototype
void drawTriangle(int row, int col, int size, unsigned short color);
//gba 240, 160
int main() {
    REG_DISPCTL = 1027;
    int rd = 5;
    int cd = 5;
    int row = 30;
    //int row2 = 30;
    int col = 30;
    int size = 20;
    unsigned short color = RED;
    // TODO call the drawTriangle function at least 3 times
    
    while(1) {

        row += rd;
        col += cd;
        if(row <0) {
            row = 0; 
            rd = -rd;
        }
        //the - size and + 1 are there to manage hitting corners they're very needed
        if(row > 159 - size + 1){ 
            row = 159 - size + 1;
            rd = -rd;
            color = BLUE;
        }
        if (col < 0) {
            col = 0;
            cd = -cd;
        }
        if (col > 239 - (size) + 1) {
            col = 239 - size + 1;
            cd = -cd;
            color = GREEN;
        }
        drawTriangle(row, col, size, color);
        drawTriangle(50, col, size, color);
        drawTriangle(row, 70, size, color);
        waitForVblank();
        //delay(6);
        drawTriangle(row, col, size, BLACK);
        drawTriangle(50, col, size, BLACK);
        drawTriangle(row, 70, size, BLACK);
    }
    	
}



void setPixel(int row, int col, unsigned short color)
{
    VIDEO_BUFFER[OFFSET(row,col,240)] = color;
}

void drawTriangle(int row, int col, int size, unsigned short color) {
    // TODO implement this function
    for (int r = 0; r < size; r++) {
		for(int c = 0; c < r; c++) {
			setPixel(row + r, col + c, color);
		}
	}
    //setPixel(row + r, col + c, color);
}

void delay(int n) {
    //volatile says the compiler must do what you say even if it doesn't understand since
    //the compiler naturally optimizes what you code into assembly language 
    //the computer normally processes it so quickly that the the box teleports around
    // so the volatile says "slow down buddy"
    volatile int x = 0;
    for(int i = 0; i < n*5000; i++) {
        x = x + 1;
    }
}

void waitForVblank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}