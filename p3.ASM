 use16	  ;√енерировать 16-битный код
 org 100h  ;ѕрограмма начинаетс€ с адреса 100h

   mov BX,array 	;BX = адрес массива
   movzx CX,[length]	;CX = длина массива
   ;mov SI ,[zero]
   cwd

    ;÷икл по перобору €чеек диопазона

   plus:
    jcxz exit
     cmp [BX],DX  ;ѕровер€ем если значение BX>=0
     jbe minus	  ;≈сли условие выполнелось то переходим в minus
     mov AL,[BX]
     add AL,1
     mov [BX],AL
     inc BX
     loop plus	  ;CX<-CX-1 , после чего, усли CX<>0, переход на адрес plus


   minus:
    jcxz exit
     mov AL,[BX]
     sub AL,1
     mov [BX],AL
     inc BX	  ;”величить значение €чеки BX на 1
     loop plus	  ;CX<-CX-1 , после чего, усли CX<>0, переход на адрес plus

   exit:
     mov ax,4C00h   ;«авершение работы
     int 21h

length db 3
array  db 3,-2,5
zero   db 0