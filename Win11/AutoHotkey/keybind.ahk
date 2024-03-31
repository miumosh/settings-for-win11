#InstallKeybdHook
#UseHook

SetKeyDelay 0



If is_not_target()
  Send %A_ThisHotkey%
Else
  ^p::Send {Up}
  ^n::Send {Down}
  ^f::Send {Right}
  ^b::Send {Left}
  ^d::Send {Del}
  ^h::Send {BS}
  ^a::Send {Home}
  ^e::Send {End}

  +^f::Send +{Right}
  +^b::Send +{Left}
  +^p::Send +{Up}
  +^n::Send +{Down}
  +^a::Send +{Home}
  +^e::Send +{End}
  
  !f::Send ^f
  ^\::Send ^a

  vkE2::_

  ; Ctrl+無変換/Ctrl+変換 == Ctrl+Shift+Tab/Ctrl+Tab
  ^vk1D::Send {Ctrl down}{Shift down}{Tab}{Ctrl up}{Shift up}
  ^vk1C::Send {Ctrl down}{Tab}{Ctrl up}

  +vk1D::Send {Shift down}{Tab}{Shift up}
  +vk1C::Send {Tab}

  ; Ctrl+Space == 半角/全角
  ^Space::Send {vkF3sc029}

  ; Ctrl+;/Ctrl+: == Date/Time
  ^;::Send %A_Year%%A_Mon%%A_MDay%
  ^sc028::Send %A_Hour%%A_Min%

  ; for Excel
  #IfWinActive, ahk_class XLMAIN
    ^;::Send ^{;}
    ^sc028::Send ^{sc028}
    ; base
    ; sc07B & s::Send, ^{PgUp}
    ; sc07B & d::Send, ^{PgDn}
    ^Tab::^PgDn
    ^+Tab::Send {Shift up}{Ctrl down}{PgUp}{Ctrl up}{Shift down}
  #IfWinActive

  ; for One Note
  #IfWinActive, ahk_class Framework::CFrame
    ^p::dllcall("keybd_event", int, 0x26, int, 0, int, 1, int, 0)
    ^n::dllcall("keybd_event", int, 0x28, int, 0, int, 1, int, 0)
  #IfWinActive
Return



is_not_target()
{
  ; ahk_class
  ; gitbash ; mintty
  ; VSCode  ; Chrome_WidgetWin_1
  ; Chrome  ; Chrome_WidgetWin_1
  ; Rlogin  ; #32770

  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
  Return 0
}