org 100h  

num1 dw 1234h  
num2 dw 5678h  

start:
  
    mov ax, [num1]

    mov cx, [num2]   
    mul cx           

    mov bx, dx        
    call print_hex

    mov bx, ax        
    call print_hex

    
    mov ah, 4Ch       
    int 21h           

print_hex:

    mov ah, bl         
    shr ah, 4          
    call print_digit

    mov ah, bl         
    and ah, 0Fh       
    call print_digit

    
    mov ah, bh         
    shr ah, 4          
    call print_digit

    
    mov ah, bh         
    and ah, 0Fh        
    call print_digit

    ret

print_digit:
    and ah, 0Fh       
    add ah, 30h       
    cmp ah, 39h       
    jle print_digit_display

    add ah, 7        

print_digit_display:
    mov dl, ah
    mov ah, 02h       
    int 21h           

    ret