 use16	  ;������������ 16-������ ���
 org 100h  ;��������� ���������� � ������ 100h

   mov BX,array 	;BX = ����� �������
   movzx CX,[length]	;CX = ����� �������
   ;mov SI ,[zero]
   cwd

    ;���� �� �������� ����� ���������

   plus:
    jcxz exit
     cmp [BX],DX  ;��������� ���� �������� BX>=0
     jbe minus	  ;���� ������� ����������� �� ��������� � minus
     mov AL,[BX]
     add AL,1
     mov [BX],AL
     inc BX
     loop plus	  ;CX<-CX-1 , ����� ����, ���� CX<>0, ������� �� ����� plus


   minus:
    jcxz exit
     mov AL,[BX]
     sub AL,1
     mov [BX],AL
     inc BX	  ;��������� �������� ����� BX �� 1
     loop plus	  ;CX<-CX-1 , ����� ����, ���� CX<>0, ������� �� ����� plus

   exit:
     mov ax,4C00h   ;���������� ������
     int 21h

length db 3
array  db 3,-2,5
zero   db 0