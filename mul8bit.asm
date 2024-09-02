org 100h  
 
num1 db 12h  
num2 db 34h   
start:
    
    mov al, [num1] 
    mov bl, [num2]   
    mul bl           
 
    mov bl, ah       
    call print_hex

    mov bl, al       
    call print_hex
  
    mov ah, 4Ch      
    int 21h           

print_hex:
   
    mov ah, bl         
    and ah, 0F0h      
    shr ah, 4          
    add ah, 30h        
    cmp ah, 39h        
    jle print_digit    

    add ah, 7          

print_digit:
    
    mov dl, ah
    mov ah, 02h        
    int 21h           

   
    mov ah, bl         
    and ah, 0Fh       
    add ah, 30h        
    cmp ah, 39h        
    jle print_digit_low

    add ah, 7         


print_digit_low:
    
    mov dl, ah
    mov ah, 02h        

    ret


         




