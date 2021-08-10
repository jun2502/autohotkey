;ボタンの配置はchangekeyで配置を変えている
;無変換+jkilで移動させてる


; チューニングしてるとだんだんスクリプトの編集・ロードをこまめにやりたくなってくるので追加

; Editだとnotepad.exeが起動するが、VSCodeで編集したかったのでRunで記述
; フルパスを書く必要がある
; 環境変数は使わなくてもいいけどGistで公開する際のユーザー名マスク用途で使っている
; 同じキーマップを使いたくなったらコメントアウトする
; 無変換 + E = スクリプト編集
~vk1D & E::
    Run, "%USERPROFILE%\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%USERPROFILE%\Documents\Gist\AutoHotkey"
    Return

; ReloadのR
~vk1D & R::Reload               ; 無変換 + R = スクリプトのリロード


; キーリピートの早いキーボードだと警告が出るので設定
#HotkeyInterval 100

; 主要なキーをホットキーとして検知可能にしておく
; A_ThisHotkey で検知可能にするための記述
; 検知だけしてAutoHotKey側では何も処理しない
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~LAlt::
*~RAlt::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
    Return

; 変換を修飾キーとして扱うための準備
; 変換を押し続けている限りリピートせず待機
$vk1C::
    startTime := A_TickCount
    KeyWait, vk1C
    keyPressDuration := A_TickCount - startTime
    ; 変換を押している間に他のホットキーが発動した場合は入力しない
    ; 変換を長押ししていた場合も入力しない
    If (A_ThisHotkey == "$vk1C" and keyPressDuration < 200) {
        Send,{vk1C}
    }
    Return

; 無変換を修飾キーとして扱うための準備
; 無変換を押し続けている限りリピートせず待機
$vk1D::
    startTime := A_TickCount
    KeyWait, vk1D
    keyPressDuration := A_TickCount - startTime
    ; 無変換を押している間に他のホットキーが発動した場合は入力しない
    ; 無変換を長押ししていた場合も入力しない
    If (A_ThisHotkey == "$vk1D" and keyPressDuration < 200) {
        Send,{vk1D}
    }
    Return

; Tabを修飾キーとして扱うための準備
; Tabを押し続けている限りリピートせず待機
$Tab::
    startTime := A_TickCount
    KeyWait, Tab
    keyPressDuration := A_TickCount - startTime
    ; Tabを押している間に他のホットキーが発動した場合は入力しない
    ; Tabを長押ししていた場合も入力しない
    If (A_ThisHotkey == "$Tab" and keyPressDuration < 200) {
        Send,{Tab}
    }
    Return

; Alt + Tab に同じ動作のホットキーを割り当てることでウィンドウ切り替えをホットキー扱いにする
; Alt + Tab を入力した際にTabが入力されてしまうことを防ぐため
Alt & Tab::AltTabAndMenu

; Shift + Tabも同様にTab入力を防ぐためホットキー扱いにする
+Tab::Send,+{Tab}


;======================================================



;基本十字キーjkli
;~vk1D & j::Send {Left}
;~vk1D & k::Send {Down}
;~vk1D & i::Send {Up}
;~vk1D & l::Send {Right}

;基本移動jkliと無変換+シフトで範囲選択もできる
~vk1D & j::
    if GetKeyState("shift", "P"){
        Send, +{Left}
    }else{
        Send,{Left}
    }
    return
;基本移動jkliと無変換+シフトで範囲選択もできる
~vk1D & k::
    if GetKeyState("shift", "P"){
        Send, +{Down}
    }else{
        Send,{Down}
    }
    return
;基本移動jkliと無変換+シフトで範囲選択もできる
~vk1D & i::
    if GetKeyState("ctrl", "P"){
        Send, +{Up}
    }else{
        Send,{Up}
    }
    return
;基本移動jkliと無変換+シフトで範囲選択もできる
~vk1D & l::
    if GetKeyState("shift", "P"){
        Send, +{Right}
    }else{
        Send,{Right}
    }
    return

;無変換+Hで単語ごとの移動
;無変換+;で単語ごとの移動
;無変換+;で先頭へ移動（HOME）
;無変換+;で後方へ移動（END）
;無変換+uでbs
;無変換+yでdel
;無変換+,で戻る
;無変換+.で進む

~vk1D & h::Send,{Blind}^{NumpadLeft}
~vk1D & `;::Send,{Blind}^{NumpadRight}
~vk1D & n::Send,{Blind}{Home}
~vk1D & m::Send,{Blind}{End}
~vk1D & u::Send,{Blind}{BS}
~vk1D & y::Send,{Blind}{Del}

~vk1D & ,::Send,{Blind}^{z}
~vk1D & .::Send,{Blind}^{y}





























