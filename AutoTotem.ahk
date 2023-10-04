; Declare global variables
Global X := 820
Global Y := 580
Global ItemCount := 0
Global RowIterations = 0

; Set the delay between actions (in milliseconds)
Delay := 10  ; Adjust as needed



; Define a hotkey (Shift+5) to trigger the action
1 & 5::
  ; Open the inventory (press 'Tab' key)
    SendInput, {Tab}
    Sleep, 60

    ; Move the mouse cursor smoothly to the specified coordinates and press 'C' key
    MouseMove, X, Y, 0.8
    Sleep, 10

  ; Press 'C' key to equip a new totem
    SendInput, c
    Sleep, % 30

    ; Close the inventory (press 'Tab' key again)
    SendInput, {Tab}
    Sleep, 50

    ; Increment the item count
    ItemCount := ItemCount + 1
    
    ; Check if ItemCount is 5, and if so, adjust X and Y
    if (ItemCount = 5) {
        X := X - 280  ; Subtract 350 units from X
        Y := Y + 70   ; Drop Y by 70 units
        ItemCount := 0  ; Reset the item count
	RowIterations = RowIterations + 1

    } else {
        X := X + 70  ; Increase X by 70 units
    }
    if (RowIterations = 3) {
	Y := Y - 210  ;
	RowIterations = 0
	

return

; Exit the script when the user presses '0'
0::ExitApp
