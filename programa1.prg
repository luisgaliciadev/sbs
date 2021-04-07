PUBLIC oMiForm
oMiForm = NEWOBJECT("MiForm")
oMiForm.SHOW
RETURN

DEFINE CLASS MiForm AS FORM
TOP = 0
LEFT = 0
HEIGHT = 400
WIDTH = 600
AUTOCENTER = .T.
CAPTION = "Arrastre la imagen con raton presionando el boton izquierdo"
XOffset = 0
YOffset = 0
NAME = "MiForm"

ADD OBJECT Image1 AS IMAGE WITH ;
TOP = 24, LEFT = 24, ;
PICTURE = HOME(1)+"fox.bmp", NAME = "Image1"

PROCEDURE DRAGDROP
LPARAMETERS oSource, nXCoord, nYCoord
oSource.LEFT = nXCoord - THISFORM.XOffset
oSource.TOP = nYCoord - THISFORM.YOffset
ENDPROC

PROCEDURE Image1.DRAGDROP
LPARAMETERS oSource, nXCoord, nYCoord
THIS.PARENT.DRAGDROP(oSource, nXCoord, nYCoord)
ENDPROC

PROCEDURE Image1.MOUSEMOVE
LPARAMETERS nButton, nShift, nXCoord, nYCoord
IF nButton = 1 && Boton Izquierdo
THISFORM.XOffset = nXCoord - THIS.LEFT
THISFORM.YOffset = nYCoord - THIS.TOP
THIS.DRAG
ENDIF
ENDPROC
ENDDEFINE
