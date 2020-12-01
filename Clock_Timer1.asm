
_Welcomm:

;Clock_Timer1.c,27 :: 		void Welcomm(){
;Clock_Timer1.c,29 :: 		Lcd_Out(1,7,"DRY");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Clock_Timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,30 :: 		Lcd_Out(2,1,"Don't repeat yourself");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Clock_Timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,32 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	CLRF       Welcomm_i_L0+0
L_Welcomm0:
	MOVLW      8
	SUBWF      Welcomm_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Welcomm1
;Clock_Timer1.c,33 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock_Timer1.c,34 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Welcomm3:
	DECFSZ     R13+0, 1
	GOTO       L_Welcomm3
	DECFSZ     R12+0, 1
	GOTO       L_Welcomm3
	NOP
	NOP
;Clock_Timer1.c,32 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	INCF       Welcomm_i_L0+0, 1
;Clock_Timer1.c,35 :: 		}
	GOTO       L_Welcomm0
L_Welcomm1:
;Clock_Timer1.c,37 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	CLRF       Welcomm_i_L0+0
L_Welcomm4:
	MOVLW      8
	SUBWF      Welcomm_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Welcomm5
;Clock_Timer1.c,38 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock_Timer1.c,39 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Welcomm7:
	DECFSZ     R13+0, 1
	GOTO       L_Welcomm7
	DECFSZ     R12+0, 1
	GOTO       L_Welcomm7
	NOP
	NOP
;Clock_Timer1.c,37 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	INCF       Welcomm_i_L0+0, 1
;Clock_Timer1.c,40 :: 		}
	GOTO       L_Welcomm4
L_Welcomm5:
;Clock_Timer1.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock_Timer1.c,44 :: 		for(i=0; i<8; i++) {
	CLRF       Welcomm_i_L0+0
L_Welcomm8:
	MOVLW      8
	SUBWF      Welcomm_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Welcomm9
;Clock_Timer1.c,45 :: 		Lcd_Out(1,8,"DRY");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Clock_Timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,46 :: 		Delay_ms(120);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      56
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Welcomm11:
	DECFSZ     R13+0, 1
	GOTO       L_Welcomm11
	DECFSZ     R12+0, 1
	GOTO       L_Welcomm11
	DECFSZ     R11+0, 1
	GOTO       L_Welcomm11
;Clock_Timer1.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock_Timer1.c,48 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Welcomm12:
	DECFSZ     R13+0, 1
	GOTO       L_Welcomm12
	DECFSZ     R12+0, 1
	GOTO       L_Welcomm12
	NOP
;Clock_Timer1.c,44 :: 		for(i=0; i<8; i++) {
	INCF       Welcomm_i_L0+0, 1
;Clock_Timer1.c,49 :: 		}
	GOTO       L_Welcomm8
L_Welcomm9:
;Clock_Timer1.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock_Timer1.c,52 :: 		}
L_end_Welcomm:
	RETURN
; end of _Welcomm

_InitTimer1:

;Clock_Timer1.c,56 :: 		void InitTimer1(){
;Clock_Timer1.c,57 :: 		T1CON         = 0x31;
	MOVLW      49
	MOVWF      T1CON+0
;Clock_Timer1.c,58 :: 		TMR1IF_bit         = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Clock_Timer1.c,59 :: 		TMR1H         = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;Clock_Timer1.c,60 :: 		TMR1L         = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;Clock_Timer1.c,61 :: 		TMR1IE_bit         = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;Clock_Timer1.c,62 :: 		INTCON         = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;Clock_Timer1.c,63 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_InitIoC:

;Clock_Timer1.c,65 :: 		void InitIoC(){
;Clock_Timer1.c,66 :: 		TRISB.B1 = 1;
	BSF        TRISB+0, 1
;Clock_Timer1.c,67 :: 		TRISB.B2 = 1;
	BSF        TRISB+0, 2
;Clock_Timer1.c,68 :: 		TRISB.B3 = 1;
	BSF        TRISB+0, 3
;Clock_Timer1.c,69 :: 		IOCB = 0x0E;
	MOVLW      14
	MOVWF      IOCB+0
;Clock_Timer1.c,70 :: 		RBIE_bit = 1;
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;Clock_Timer1.c,71 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Clock_Timer1.c,72 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Clock_Timer1.c,73 :: 		}
L_end_InitIoC:
	RETURN
; end of _InitIoC

_printClock:

;Clock_Timer1.c,75 :: 		void printClock(){
;Clock_Timer1.c,76 :: 		clock[0] = (hour/10)%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hour+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+0
;Clock_Timer1.c,77 :: 		clock[1] = hour%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hour+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+1
;Clock_Timer1.c,79 :: 		clock[3] = (min/10)%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _min+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+3
;Clock_Timer1.c,80 :: 		clock[4] = min%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _min+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+4
;Clock_Timer1.c,82 :: 		clock[6] = (second/10)%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _second+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+6
;Clock_Timer1.c,83 :: 		clock[7] = second%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _second+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _clock+7
;Clock_Timer1.c,85 :: 		Lcd_Out(1,1, clock);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,87 :: 		switch(changePosition){
	GOTO       L_printClock13
;Clock_Timer1.c,88 :: 		case 0:
L_printClock15:
;Clock_Timer1.c,89 :: 		Lcd_Out(2,1, "         ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Clock_Timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,90 :: 		break;
	GOTO       L_printClock14
;Clock_Timer1.c,91 :: 		case 1:
L_printClock16:
;Clock_Timer1.c,92 :: 		Lcd_Out(2,1, " ^       ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Clock_Timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,93 :: 		break;
	GOTO       L_printClock14
;Clock_Timer1.c,94 :: 		case 2:
L_printClock17:
;Clock_Timer1.c,95 :: 		Lcd_Out(2,1, "    ^    ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Clock_Timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,96 :: 		break;
	GOTO       L_printClock14
;Clock_Timer1.c,97 :: 		case 3:
L_printClock18:
;Clock_Timer1.c,98 :: 		Lcd_Out(2,1, "       ^ ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Clock_Timer1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Clock_Timer1.c,99 :: 		break;
	GOTO       L_printClock14
;Clock_Timer1.c,101 :: 		}
L_printClock13:
	MOVF       _changePosition+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_printClock15
	MOVF       _changePosition+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_printClock16
	MOVF       _changePosition+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_printClock17
	MOVF       _changePosition+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_printClock18
L_printClock14:
;Clock_Timer1.c,103 :: 		}
L_end_printClock:
	RETURN
; end of _printClock

_ChangeTimeUp:

;Clock_Timer1.c,105 :: 		void ChangeTimeUp(uint8_t position){
;Clock_Timer1.c,106 :: 		switch(position){
	GOTO       L_ChangeTimeUp19
;Clock_Timer1.c,107 :: 		case 1:
L_ChangeTimeUp21:
;Clock_Timer1.c,108 :: 		if(hour < 24){
	MOVLW      24
	SUBWF      _hour+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ChangeTimeUp22
;Clock_Timer1.c,109 :: 		hour++ ;
	INCF       _hour+0, 1
;Clock_Timer1.c,110 :: 		}
	GOTO       L_ChangeTimeUp23
L_ChangeTimeUp22:
;Clock_Timer1.c,112 :: 		hour = 0;
	CLRF       _hour+0
;Clock_Timer1.c,113 :: 		}
L_ChangeTimeUp23:
;Clock_Timer1.c,114 :: 		break;
	GOTO       L_ChangeTimeUp20
;Clock_Timer1.c,115 :: 		case 2:
L_ChangeTimeUp24:
;Clock_Timer1.c,116 :: 		if(min < 60){
	MOVLW      60
	SUBWF      _min+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ChangeTimeUp25
;Clock_Timer1.c,117 :: 		min++ ;
	INCF       _min+0, 1
;Clock_Timer1.c,118 :: 		}
	GOTO       L_ChangeTimeUp26
L_ChangeTimeUp25:
;Clock_Timer1.c,120 :: 		min = 0;
	CLRF       _min+0
;Clock_Timer1.c,121 :: 		}
L_ChangeTimeUp26:
;Clock_Timer1.c,122 :: 		break;
	GOTO       L_ChangeTimeUp20
;Clock_Timer1.c,123 :: 		case 3:
L_ChangeTimeUp27:
;Clock_Timer1.c,124 :: 		if(second < 60){
	MOVLW      60
	SUBWF      _second+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ChangeTimeUp28
;Clock_Timer1.c,125 :: 		second++ ;
	INCF       _second+0, 1
;Clock_Timer1.c,126 :: 		}
	GOTO       L_ChangeTimeUp29
L_ChangeTimeUp28:
;Clock_Timer1.c,128 :: 		second = 0;
	CLRF       _second+0
;Clock_Timer1.c,129 :: 		}
L_ChangeTimeUp29:
;Clock_Timer1.c,130 :: 		break;
	GOTO       L_ChangeTimeUp20
;Clock_Timer1.c,131 :: 		default:
L_ChangeTimeUp30:
;Clock_Timer1.c,132 :: 		break;
	GOTO       L_ChangeTimeUp20
;Clock_Timer1.c,133 :: 		}
L_ChangeTimeUp19:
	MOVF       FARG_ChangeTimeUp_position+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_ChangeTimeUp21
	MOVF       FARG_ChangeTimeUp_position+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_ChangeTimeUp24
	MOVF       FARG_ChangeTimeUp_position+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_ChangeTimeUp27
	GOTO       L_ChangeTimeUp30
L_ChangeTimeUp20:
;Clock_Timer1.c,134 :: 		}
L_end_ChangeTimeUp:
	RETURN
; end of _ChangeTimeUp

_ChangeTimeDown:

;Clock_Timer1.c,136 :: 		void ChangeTimeDown(uint8_t position){
;Clock_Timer1.c,138 :: 		switch(position){
	GOTO       L_ChangeTimeDown31
;Clock_Timer1.c,139 :: 		case 1:
L_ChangeTimeDown33:
;Clock_Timer1.c,140 :: 		if(hour > 0){
	MOVF       _hour+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_ChangeTimeDown34
;Clock_Timer1.c,141 :: 		hour--;
	DECF       _hour+0, 1
;Clock_Timer1.c,142 :: 		}
	GOTO       L_ChangeTimeDown35
L_ChangeTimeDown34:
;Clock_Timer1.c,144 :: 		hour = 23;
	MOVLW      23
	MOVWF      _hour+0
;Clock_Timer1.c,145 :: 		}
L_ChangeTimeDown35:
;Clock_Timer1.c,146 :: 		break;
	GOTO       L_ChangeTimeDown32
;Clock_Timer1.c,147 :: 		case 2:
L_ChangeTimeDown36:
;Clock_Timer1.c,148 :: 		if(min > 0){
	MOVF       _min+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_ChangeTimeDown37
;Clock_Timer1.c,149 :: 		min--;
	DECF       _min+0, 1
;Clock_Timer1.c,150 :: 		}
	GOTO       L_ChangeTimeDown38
L_ChangeTimeDown37:
;Clock_Timer1.c,152 :: 		min = 59;
	MOVLW      59
	MOVWF      _min+0
;Clock_Timer1.c,153 :: 		}
L_ChangeTimeDown38:
;Clock_Timer1.c,154 :: 		break;
	GOTO       L_ChangeTimeDown32
;Clock_Timer1.c,155 :: 		case 3:
L_ChangeTimeDown39:
;Clock_Timer1.c,156 :: 		if(second > 0){
	MOVF       _second+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_ChangeTimeDown40
;Clock_Timer1.c,157 :: 		second--;
	DECF       _second+0, 1
;Clock_Timer1.c,158 :: 		}
	GOTO       L_ChangeTimeDown41
L_ChangeTimeDown40:
;Clock_Timer1.c,160 :: 		second = 59;
	MOVLW      59
	MOVWF      _second+0
;Clock_Timer1.c,161 :: 		}
L_ChangeTimeDown41:
;Clock_Timer1.c,162 :: 		break;
	GOTO       L_ChangeTimeDown32
;Clock_Timer1.c,163 :: 		default:
L_ChangeTimeDown42:
;Clock_Timer1.c,164 :: 		break;
	GOTO       L_ChangeTimeDown32
;Clock_Timer1.c,165 :: 		}
L_ChangeTimeDown31:
	MOVF       FARG_ChangeTimeDown_position+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_ChangeTimeDown33
	MOVF       FARG_ChangeTimeDown_position+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_ChangeTimeDown36
	MOVF       FARG_ChangeTimeDown_position+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_ChangeTimeDown39
	GOTO       L_ChangeTimeDown42
L_ChangeTimeDown32:
;Clock_Timer1.c,166 :: 		}
L_end_ChangeTimeDown:
	RETURN
; end of _ChangeTimeDown

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Clock_Timer1.c,168 :: 		void Interrupt(){
;Clock_Timer1.c,169 :: 		if (TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt43
;Clock_Timer1.c,170 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Clock_Timer1.c,171 :: 		TMR1H         = 0x3C;
	MOVLW      60
	MOVWF      TMR1H+0
;Clock_Timer1.c,172 :: 		TMR1L         = 0xB0;
	MOVLW      176
	MOVWF      TMR1L+0
;Clock_Timer1.c,173 :: 		counter++;
	INCF       _counter+0, 1
;Clock_Timer1.c,174 :: 		if(counter < 5){
	MOVLW      5
	SUBWF      _counter+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt44
;Clock_Timer1.c,175 :: 		return;
	GOTO       L__Interrupt64
;Clock_Timer1.c,176 :: 		}
L_Interrupt44:
;Clock_Timer1.c,178 :: 		printToLCD = 1;
	MOVLW      1
	MOVWF      _printToLCD+0
;Clock_Timer1.c,180 :: 		counter = 0;
	CLRF       _counter+0
;Clock_Timer1.c,181 :: 		second++;
	INCF       _second+0, 1
;Clock_Timer1.c,182 :: 		if(second < 60){
	MOVLW      60
	SUBWF      _second+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt45
;Clock_Timer1.c,183 :: 		return;
	GOTO       L__Interrupt64
;Clock_Timer1.c,184 :: 		}
L_Interrupt45:
;Clock_Timer1.c,186 :: 		second = 0;
	CLRF       _second+0
;Clock_Timer1.c,187 :: 		min++;
	INCF       _min+0, 1
;Clock_Timer1.c,188 :: 		if(min < 60){
	MOVLW      60
	SUBWF      _min+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt46
;Clock_Timer1.c,189 :: 		return;
	GOTO       L__Interrupt64
;Clock_Timer1.c,190 :: 		}
L_Interrupt46:
;Clock_Timer1.c,192 :: 		min = 0;
	CLRF       _min+0
;Clock_Timer1.c,193 :: 		hour++;
	INCF       _hour+0, 1
;Clock_Timer1.c,194 :: 		if(hour < 24){
	MOVLW      24
	SUBWF      _hour+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt47
;Clock_Timer1.c,195 :: 		return;
	GOTO       L__Interrupt64
;Clock_Timer1.c,196 :: 		}
L_Interrupt47:
;Clock_Timer1.c,197 :: 		hour = 0;
	CLRF       _hour+0
;Clock_Timer1.c,198 :: 		}
L_Interrupt43:
;Clock_Timer1.c,200 :: 		if(RBIF_bit){
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_Interrupt48
;Clock_Timer1.c,201 :: 		if(BTN_SWITCH == 0){
	BTFSC      PORTB+0, 1
	GOTO       L_Interrupt49
;Clock_Timer1.c,202 :: 		if(changePosition<3){
	MOVLW      3
	SUBWF      _changePosition+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt50
;Clock_Timer1.c,203 :: 		changePosition++;
	INCF       _changePosition+0, 1
;Clock_Timer1.c,204 :: 		TMR1ON_bit = 0;
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Clock_Timer1.c,205 :: 		}else {
	GOTO       L_Interrupt51
L_Interrupt50:
;Clock_Timer1.c,206 :: 		changePosition = 0;
	CLRF       _changePosition+0
;Clock_Timer1.c,207 :: 		TMR1ON_bit = 1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Clock_Timer1.c,208 :: 		}
L_Interrupt51:
;Clock_Timer1.c,209 :: 		}
L_Interrupt49:
;Clock_Timer1.c,210 :: 		if(BTN_UP == 0){
	BTFSC      PORTB+0, 2
	GOTO       L_Interrupt52
;Clock_Timer1.c,211 :: 		ChangeTimeUp(changePosition);
	MOVF       _changePosition+0, 0
	MOVWF      FARG_ChangeTimeUp_position+0
	CALL       _ChangeTimeUp+0
;Clock_Timer1.c,212 :: 		}
L_Interrupt52:
;Clock_Timer1.c,213 :: 		if(BTN_DOWN == 0){
	BTFSC      PORTB+0, 3
	GOTO       L_Interrupt53
;Clock_Timer1.c,214 :: 		ChangeTimeDown(changePosition);
	MOVF       _changePosition+0, 0
	MOVWF      FARG_ChangeTimeDown_position+0
	CALL       _ChangeTimeDown+0
;Clock_Timer1.c,215 :: 		}
L_Interrupt53:
;Clock_Timer1.c,217 :: 		printToLCD = 1;
	MOVLW      1
	MOVWF      _printToLCD+0
;Clock_Timer1.c,218 :: 		RBIF_bit = 0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;Clock_Timer1.c,219 :: 		}
L_Interrupt48:
;Clock_Timer1.c,221 :: 		}
L_end_Interrupt:
L__Interrupt64:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;Clock_Timer1.c,224 :: 		void main() {
;Clock_Timer1.c,225 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;Clock_Timer1.c,226 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock_Timer1.c,227 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Clock_Timer1.c,228 :: 		Welcomm();
	CALL       _Welcomm+0
;Clock_Timer1.c,229 :: 		InitTimer1();
	CALL       _InitTimer1+0
;Clock_Timer1.c,230 :: 		InitIoC();
	CALL       _InitIoC+0
;Clock_Timer1.c,231 :: 		printClock();
	CALL       _printClock+0
;Clock_Timer1.c,233 :: 		while(1){
L_main54:
;Clock_Timer1.c,234 :: 		if(printToLCD){
	MOVF       _printToLCD+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main56
;Clock_Timer1.c,235 :: 		printToLCD = 0;
	CLRF       _printToLCD+0
;Clock_Timer1.c,236 :: 		printClock();
	CALL       _printClock+0
;Clock_Timer1.c,237 :: 		}
L_main56:
;Clock_Timer1.c,238 :: 		}
	GOTO       L_main54
;Clock_Timer1.c,239 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
