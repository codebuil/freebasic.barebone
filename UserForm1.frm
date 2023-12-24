VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "rectangle form"
   ClientHeight    =   5436
   ClientLeft      =   108
   ClientTop       =   456
   ClientWidth     =   11844
   OleObjectBlob   =   "UserForm1.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare PtrSafe Sub Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
Private Declare PtrSafe Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare PtrSafe Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare PtrSafe Function SetDCBrushColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare PtrSafe Function GetForegroundWindow Lib "user32" () As Long
Private Declare PtrSafe Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

Private Sub UserForm_Activate()
    Dim hwnd As Long
    Me.Repaint
    
    hwnd = GetForegroundWindow() ' Obter a janela com foco
    DesenharRetangulo hwnd, RGB(255, 0, 0), 10, 10, Me.Width - 10, Me.Height - 10
    
End Sub
Sub DesenharRetangulo(ByVal hwnd As Long, ByVal cor As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
    Dim hdc As Long
    Dim xxx

    ' Obt�m o contexto de dispositivo para a janela
    hdc = GetDC(hwnd)
    
    ' Define a cor da caneta
    SetDCBrushColor hdc, cor

    ' Desenha o ret�ngulo
   Rectangle hdc, x1, y1, x2, y2

    ' Libera o contexto de dispositivo
    ReleaseDC hwnd, hdc
End Sub

Private Sub UserForm_Click()

End Sub

Private Sub UserForm_Initialize()

Me.Repaint



End Sub

Private Sub UserForm_Layout()

End Sub
