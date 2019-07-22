# 1 "lab2.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab2.c"
# 22 "lab2.c"
void setPixel(int, int, unsigned short);
void waitForVblank();


void drawTriangle(int row, int col, int size, unsigned short color);

int main() {
    *(unsigned short *)0x4000000 = 1027;
    int rd = 5;
    int cd = 5;
    int row = 30;

    int col = 30;
    int size = 20;
    unsigned short color = ((31) | (0)<<5 | (0)<<10);


    while(1) {

        row += rd;
        col += cd;
        if(row <0) {
            row = 0;
            rd = -rd;
        }

        if(row > 159 - size + 1){
            row = 159 - size + 1;
            rd = -rd;
            color = ((0) | (0)<<5 | (31)<<10);
        }
        if (col < 0) {
            col = 0;
            cd = -cd;
        }
        if (col > 239 - (size) + 1) {
            col = 239 - size + 1;
            cd = -cd;
            color = ((0) | (31)<<5 | (0)<<10);
        }
        drawTriangle(row, col, size, color);
        drawTriangle(50, col, size, color);
        drawTriangle(row, 70, size, color);
        waitForVblank();

        drawTriangle(row, col, size, 0);
        drawTriangle(50, col, size, 0);
        drawTriangle(row, 70, size, 0);
    }

}



void setPixel(int row, int col, unsigned short color)
{
    ((unsigned short *)0x6000000)[((row)*240 +(col))] = color;
}

void drawTriangle(int row, int col, int size, unsigned short color) {

    for (int r = 0; r < size; r++) {
  for(int c = 0; c < r; c++) {
   setPixel(row + r, col + c, color);
  }
 }

}

void delay(int n) {




    volatile int x = 0;
    for(int i = 0; i < n*5000; i++) {
        x = x + 1;
    }
}

void waitForVblank() {
 while(*(volatile unsigned short *)0x4000006 > 160);
 while(*(volatile unsigned short *)0x4000006 < 160);
}
