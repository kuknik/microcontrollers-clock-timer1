#include <stdint.h>
// LCD module connections
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;
// End LCD module connections

#define BTN_SWITCH PORTB.B1
#define BTN_UP PORTB.B2
#define BTN_DOWN PORTB.B3


char clock[] = "hh:mm:ss";
uint8_t hour, min, second, printToLCD;
uint8_t counter, changePosition;

void Welcomm(){
  uint8_t i;
  Lcd_Out(1,7,"DRY");
  Lcd_Out(2,1,"Don't repeat yourself");

  for(i=0; i<8; i++) {             // Move text to the left 7 times
    Lcd_Cmd(_LCD_SHIFT_LEFT);
    Delay_ms(50);
  }

  for(i=0; i<8; i++) {             // Move text to the right 7 times
    Lcd_Cmd(_LCD_SHIFT_RIGHT);
    Delay_ms(50);
  }

  Lcd_Cmd(_LCD_CLEAR);

  for(i=0; i<8; i++) {
    Lcd_Out(1,8,"DRY");
    Delay_ms(120);
    Lcd_Cmd(_LCD_CLEAR);
    Delay_ms(10);
  }
  Lcd_Cmd(_LCD_CLEAR);

}

//Timer1
//Prescaler 1:8; TMR1 Preload = 15536; Actual Interrupt Time : 200 ms
void InitTimer1(){
  T1CON         = 0x31;
  TMR1IF_bit         = 0;
  TMR1H         = 0x3C;
  TMR1L         = 0xB0;
  TMR1IE_bit         = 1;
  INTCON         = 0xC0;
}

void InitIoC(){
  TRISB.B1 = 1;
  TRISB.B2 = 1;
  TRISB.B3 = 1;
  IOCB = 0x0E;
  RBIE_bit = 1;
  ANSEL = 0;
  ANSELH = 0;
}

void printClock(){
  clock[0] = (hour/10)%10 + 48;
  clock[1] = hour%10 + 48;

  clock[3] = (min/10)%10 + 48;
  clock[4] = min%10 + 48;

  clock[6] = (second/10)%10 + 48;
  clock[7] = second%10 + 48;

  Lcd_Out(1,1, clock);

  switch(changePosition){
    case 0:
    Lcd_Out(2,1, "         ");
    break;
    case 1:
    Lcd_Out(2,1, " ^       ");
    break;
    case 2:
    Lcd_Out(2,1, "    ^    ");
    break;
    case 3:
    Lcd_Out(2,1, "       ^ ");
    break;

  }

}

void ChangeTimeUp(uint8_t position){
 switch(position){
  case 1:
    if(hour < 24){
      hour++ ;
    }
    else {
      hour = 0;
    }
    break;
  case 2:
    if(min < 60){
      min++ ;
    }
    else {
      min = 0;
    }
    break;
  case 3:
    if(second < 60){
      second++ ;
    }
    else {
      second = 0;
    }
    break;
  default:
    break;
 }
}

void ChangeTimeDown(uint8_t position){

 switch(position){
  case 1:
    if(hour > 0){
      hour--;
    }
    else {
      hour = 23;
    }
    break;
  case 2:
    if(min > 0){
      min--;
    }
    else {
      min = 59;
    }
    break;
  case 3:
    if(second > 0){
      second--;
    }
    else {
      second = 59;
    }
    break;
  default:
    break;
 }
}

void Interrupt(){
  if (TMR1IF_bit){
    TMR1IF_bit = 0;
    TMR1H         = 0x3C;
    TMR1L         = 0xB0;
    counter++;
    if(counter < 5){
     return;
    }

    printToLCD = 1;

    counter = 0;
    second++;
    if(second < 60){
     return;
    }

    second = 0;
    min++;
    if(min < 60){
     return;
    }

    min = 0;
    hour++;
    if(hour < 24){
     return;
    }
    hour = 0;
  }
  
  if(RBIF_bit){
    if(BTN_SWITCH == 0){
      if(changePosition<3){
        changePosition++;
        TMR1ON_bit = 0;
      }else {
        changePosition = 0;
        TMR1ON_bit = 1;
      }
    }
    if(BTN_UP == 0){
      ChangeTimeUp(changePosition);
    }
    if(BTN_DOWN == 0){
      ChangeTimeDown(changePosition);
    }

    printToLCD = 1;
    RBIF_bit = 0;
  }
  
}


void main() {
  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Welcomm();
  InitTimer1();
  InitIoC();
  printClock();

  while(1){
   if(printToLCD){
     printToLCD = 0;
     printClock();
   }
  }
}