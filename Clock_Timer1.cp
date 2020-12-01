#line 1 "C:/Users/Korisnik/Desktop/MIPS GIT/microcontrollers-clock-timer1/Clock_Timer1.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 3 "C:/Users/Korisnik/Desktop/MIPS GIT/microcontrollers-clock-timer1/Clock_Timer1.c"
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







char clock[] = "hh:mm:ss";
uint8_t hour, min, second, printToLCD;
uint8_t counter, changePosition;

void Welcomm(){
 uint8_t i;
 Lcd_Out(1,7,"DRY");
 Lcd_Out(2,1,"Don't repeat yourself");

 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Delay_ms(50);
 }

 for(i=0; i<8; i++) {
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



void InitTimer1(){
 T1CON = 0x31;
 TMR1IF_bit = 0;
 TMR1H = 0x3C;
 TMR1L = 0xB0;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
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
 TMR1H = 0x3C;
 TMR1L = 0xB0;
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
 if( PORTB.B1  == 0){
 if(changePosition<3){
 changePosition++;
 TMR1ON_bit = 0;
 }else {
 changePosition = 0;
 TMR1ON_bit = 1;
 }
 }
 if( PORTB.B2  == 0){
 ChangeTimeUp(changePosition);
 }
 if( PORTB.B3  == 0){
 ChangeTimeDown(changePosition);
 }

 printToLCD = 1;
 RBIF_bit = 0;
 }

}


void main() {
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
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
