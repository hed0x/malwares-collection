Attribute VB_Name = "OpenGl"
Public Text1Output As String 'used by frminput
''''''''''''''''''''''''''''''''''''''''''''''





''''''''''''''''''''''''''''''''''''''
'Start of OpenGl by Hans Henning Klein
''''''''''''''''''''''''''''''''''''''
Global PrgRun As Boolean 'Flag = Programm läuft

Public Texture(15) As GLuint 'Handle der Texturen

Private hrc As Long 'Handle für den OpenGL Gerätekontext

Public Type BITMAPINFOHEADER 'Struktur des Infobereichs einer Bitmap
  biSize As Long 'bestimmt die Anzahl von Bytes, die von der BITMAPINFOHEADER-Struktur benötigt werden
  biWidth As Long 'bestimmt die Breite der Bitmaps in Pixel
  biHeight As Long 'bestimmt die Höhe der Bitmaps in Pixel
  biPlanes As Integer 'bestimmt die Anzahl der Farbebenen (normalerweise 1)
  biBitCount As Integer 'bestimmt die Anzahl der Bits pro Pixel
  biCompression As Long 'bestimmt den Kompressionstyp für ein komprimiertes Bitmap
  biSizeImage As Long 'bestimmt die Bildgröße in Bytes, ohne BITMAPINFOHEADER und RGBQUAD-Strukturen
  biXPelsPerMeter As Long 'bestimmt die horizontale Auflösung des Bitmaps für das Zielgerät in Pixel pro Meter
  biYPelsPerMeter As Long 'bestimmt die vertikale Auflösung des Bitmaps für das Zielgerät in Pixel pro Meter
  biClrUsed As Long 'bestimmt die Anzahl der Farbindizes in der Farbpalette, die gerade vom Bitmap verwendet wird
  biClrImportant As Long 'bestimmt die Anzahl der Farbindizes, die für die Darstellung des Bitmaps für unabdingbar erachtet werden
End Type

Public Type RGBQUAD 'Struktur für 3 Farben = 3 Byte + 1 Reserve
  rgbBlue As Byte 'Blau
  rgbGreen As Byte 'Grün
  rgbRed As Byte 'Rot
  rgbReserved As Byte 'ungenutzt
End Type


Public Sub LoadAbout()
   Static r4eckX As GLfloat 'Winkel der X-Achse für das Viereck
   Static r4eckY As GLfloat 'Winkel der Y-Achse für das Viereck
   Static r4eckZ As GLfloat 'Winkel der Z-Achse für das Viereck

   Dim frm As Form
   PrgRun = True 'Flag = das Programm läuft
   Set frm = New frmAbout 'Fenster für OpenGL-Ausgabe
   frm.ScaleMode = vbPixels 'das Fenster muß zwingend in Pixel bemessen werden
   'frm.Show vbModal
   If CreateGLWindow(frm, 640, 480, 16) Then 'Fenster initialisieren
      Do 'Endlosschleife in der das Fenster laufend gelöscht und neu aufgebaut wird.
         'Die Laufzeit dieser Schleife ist ausschlaggebend, wieviele Objekt gezeichnet werden können
         glClear clrColorBufferBit Or clrDepthBufferBit ' löscht das Fenster und den Tiefenpuffer
         glLoadIdentity 'setzt die aktuelle Modell-Matrix zurück

         glTranslatef 0#, 0#, -5# 'Zeichenpunkt zurücksetzen
         
         glRotatef r4eckX, 0#, 0#, 1# 'Drehen des Würfels um die X Achse
         glRotatef r4eckY, 0#, 1#, 0# 'Drehen des Würfels um die Y Achse
         glRotatef r4eckZ, 1#, 0#, 0# 'Drehen des Würfels um die Z Achse
         
         glBindTexture GL_TEXTURE_2D, Texture(2) 'Auswahl der gewünschten Textur
         glBegin bmQuads 'Deckel eines Würfels
            glTexCoord2f 1#, 1#: glVertex3f 1#, 1#, -1# 'Oben Rechts (Oberseite)
            glTexCoord2f 0#, 1#: glVertex3f -1#, 1#, -1# 'Oben Links (Oberseite)
            glTexCoord2f 0#, 0#: glVertex3f -1#, 1#, 1# 'Unten Links (Oberseite)
            glTexCoord2f 1#, 0#: glVertex3f 1#, 1#, 1# 'Unten Rechts (Oberseite)
            glTexCoord2f 1#, 1#: glVertex3f 1#, -1#, 1# 'Oben Rechts (Unterseite)
            glTexCoord2f 0#, 1#: glVertex3f -1#, -1#, 1# 'Oben Links (Unterseite)
            glTexCoord2f 0#, 0#: glVertex3f -1#, -1#, -1# 'Unten Links (Unterseite)
            glTexCoord2f 1#, 0#: glVertex3f 1#, -1#, -1# 'Unten Rechts (Unterseite)
         glEnd 'Ende des Würfels
         
         glBindTexture GL_TEXTURE_2D, Texture(1) 'Auswahl der gewünschten Textur
         glBegin bmQuads 'Rest eines Würfels
            glTexCoord2f 1#, 1#: glVertex3f 1#, 1#, 1# 'Oben Rechts (Vorderseite)
            glTexCoord2f 0#, 1#: glVertex3f -1#, 1#, 1# 'Oben Links (Vorderseite)
            glTexCoord2f 0#, 0#: glVertex3f -1#, -1#, 1# 'Unten Links (Vorderseite)
            glTexCoord2f 1#, 0#: glVertex3f 1#, -1#, 1# 'Unten Rechts (Vorderseite)
            glTexCoord2f 0#, 0#: glVertex3f 1#, -1#, -1# 'Unten Links (Rückseite)
            glTexCoord2f 1#, 0#: glVertex3f -1#, -1#, -1# 'Unten Rechts (Rückseite)
            glTexCoord2f 1#, 1#: glVertex3f -1#, 1#, -1# 'Oben Rechts (Rückseite)
            glTexCoord2f 0#, 1#: glVertex3f 1#, 1#, -1# 'Oben Links (Rückseite)
            glTexCoord2f 1#, 1#: glVertex3f -1#, 1#, 1# 'Oben Rechts (Links)
            glTexCoord2f 0#, 1#: glVertex3f -1#, 1#, -1# 'Oben Links (Links)
            glTexCoord2f 0#, 0#: glVertex3f -1#, -1#, -1# 'Unten Links (Links)
            glTexCoord2f 1#, 0#: glVertex3f -1#, -1#, 1# 'Unten Rechts (Links)
            glTexCoord2f 1#, 1#: glVertex3f 1#, 1#, -1# 'Oben Rechts (Rechts)
            glTexCoord2f 0#, 1#: glVertex3f 1#, 1#, 1# 'Oben Links (Rechts)
            glTexCoord2f 0#, 0#: glVertex3f 1#, -1#, 1# 'Unten Links (Rechts)
            glTexCoord2f 1#, 0#: glVertex3f 1#, -1#, -1# 'Unten Rechts (Rechts)
         glEnd 'Ende des Würfels

         SwapBuffers (frm.hdc) 'Puffer tauschen (Double Buffering)
         DoEvents

         'damit es eine laufende Drehung wird, ändern wir mit jedem Schleifendurchlauf alle Winkel
         r4eckX = r4eckX + 0.4
         r4eckY = r4eckY + 0.3
         r4eckZ = r4eckZ + 0.2
      
      Loop While PrgRun 'Programm nur beenden, wenn PrgRun = False
      'PrgRun ist Global definiert und wird im KeyDown-Ereignis von Form1 bei drücken von Escape gesetzt.
      'alles freigeben und Programm beenden
      If hrc <> 0 Then 'hatten wir einen Gerätekontext für OpenGL?
         wglMakeCurrent 0, 0 'Freigeben des Gerätekontexts
         wglDeleteContext (hrc) 'Freigeben des Renderingkontexts
      End If
      Unload frm
      Set frm = Nothing
   End If
End Sub

Public Function CreateGLWindow(frm As Form, Width As Integer, Height As Integer, Bits As Integer) As Boolean
   Dim pfd As PIXELFORMATDESCRIPTOR ' pfd erklärt Windows, wie das Fenster beschaffen sein soll
   Dim PixelFormat As GLuint ' enthält das Ergebnis vom Versuch, ein Fenster mit den gegebenen Parametern zu erstellen
      
   pfd.cColorBits = Bits 'Farbtiefe
   pfd.cDepthBits = 16 '16 Bit Tiefenpuffer
   'Der Tiefenpuffer enthält die Entfernung eines Pixels zur Kamera (Betrachter).
   'Er verhindert, daß Objekte im Hintergrund beim Zeichnen Objekte im Vordergund überlagern.
   pfd.dwFlags = PFD_DRAW_TO_WINDOW Or PFD_SUPPORT_OPENGL Or PFD_DOUBLEBUFFER
   'PFD_DRAW_TO_WINDOW = das Format muß als Fenster sichtbar sein können
   'PFD_SUPPORT_OPENGL = das Format muß OpenGL unterstützen
   'PFD_DOUBLEBUFFER = das Foramt muß Double Buffering unterstützen
   pfd.iLayerType = PFD_MAIN_PLANE 'Die Hauptebene auf der gezeichnt wird.
   pfd.iPixelType = PFD_TYPE_RGBA 'Pixel werden im RGBA Modus dargestellt.
   'RGB ist mit VB identisch. Für A wird ein Alpha-Wert für die Transparenz übergeben
   pfd.nSize = Len(pfd) 'Größe der Struktur sollte natürlich stimmen
   pfd.nVersion = 1 'Versionsnummer

   PixelFormat = ChoosePixelFormat(frm.hdc, pfd) 'Windows nach einem oben beschriebenen Pixelformat fragen
   If PixelFormat <> 0 Then
      'Windows hat ein entsprechendes Format gefunden
      If SetPixelFormat(frm.hdc, PixelFormat, pfd) <> 0 Then
         'Einrichten des Pixelformates war erfolgreich
         hrc = wglCreateContext(frm.hdc)
         If hrc <> 0 Then
            'ein Rendering Kontext wurde erstellt
            If wglMakeCurrent(frm.hdc, hrc) <> 0 Then
               'Der Kontext wurde aktiviert
               frm.Show 'Fenster anzeigen
               Call LoadTextureS(App.Path & "\Texture1.bmp", 1) 'laden und erzeugen eines Textures
               Call LoadTextureS(App.Path & "\Texture2.bmp", 2) 'laden und erzeugen eines weiteren Textures
               glEnable glcTexture2D 'Einschalten des Texture Mappings
               glShadeModel smSmooth 'schaltet schöne Farbübergange ein
               glClearColor 0#, 0#, 0#, 0# 'schwarzer Hintergrund
               glClearDepth 1# 'Tiefenpuffer zurücksetzten (später mehr)
               glEnable glcDepthTest 'Aktivierung des Tiefentests (später mehr)
               glDepthFunc cfLEqual 'Typ des Tiefentests (später mehr)
               glHint htPerspectiveCorrectionHint, hmNicest 'Art der Perspectivenansicht
               'hmNicest = beste Ansicht / hmFastest = schnellste Darstellung
               CreateGLWindow = True
            End If
         End If
      End If
   End If
End Function

Public Sub ReSizeGLScene(ByVal Width As GLsizei, ByVal Height As GLsizei)
   'Anpassen der Größe und Initialisierung des OpenGL-Fensters
   If Height = 0 Then 'Die Fensterhöhe muß größer 0 sein
       Height = 1 'sonst kommt es zu einem Division by Zero Fehler
   End If
   glViewport 0, 0, Width, Height 'leeren des aktuellen Viewports
   glMatrixMode mmProjection 'Auswahl der Projektionsmatrix
   glLoadIdentity 'setzt die aktuelle Modell-Matrix zurück

   gluPerspective 45#, Width / Height, 0.1, 100# 'Berechnung des aktuellen Seitenverhältnisses des Fensters

   glMatrixMode mmModelView 'Auswahl der Modelview Projektionsmatrix
   glLoadIdentity 'setzt die aktuelle Modell-Matrix zurück
End Sub



Public Function LoadTexture(ByVal Filename As String, ByVal Index As Long) As Boolean
   Dim H As Long, W As Long 'Höhe und Breite der Grafik
   Dim X As Long, Y As Long 'Zählvariablen
   Dim C As Long 'Farbwert eines Punktes als Long
   Dim Ypos As Long 'Korrigierte Y-Position für Array
   Dim TextureImg() As GLbyte
   
   'Vorraussetzungen:
   'Die Grafik muß quadratisch sein!
   'Die Seitenlänge der Grafiken müssen 2er Potenzen entsprechen:
   '16,32,64,128,256,512,1024 Pixel etc.
   'Durch den Umweg über die Picturebox sind aber auch Formate wie jpg oder gif möglich.
   'Die Autosize-Eigenschaft der Picturebox muß auf True stehen!
   
   Form1.Picture1.Picture = LoadPicture(Filename) 'Bild laden
   
   H = Form1.Picture1.ScaleHeight 'Höhe der Grafik übernehmen
   W = Form1.Picture1.ScaleWidth 'Breite der Grafik übernehmen
   
   ReDim TextureImg(2, H - 1, W - 1) 'Speicher für die Bilddaten reservieren
   
   'Alle Bildpunkte werden in das Array TextureImg() übertragen
   For X = 0 To W - 1 'in einer doppelten Schleife die Farbe jedes Bildpunktes erfassen
       For Y = 0 To H - 1
           C = Form1.Picture1.Point(X, Y) 'gibt die Farbe des Punkte als Long-Wert zurück
           Ypos = H - Y - 1 'Konvertieren der Y-Position
           Call CopyMemory(TextureImg(0, X, Ypos), C, 3) 'schnelle Zerlegung des Long-Wertes in RGB-Farben
           'beruht auf Tip 427: Farbwert in RGB schneller auflösen II
       Next
   Next
   
   glGenTextures 1, Texture(Index)  'kreiert eine Textur
   glBindTexture glTexture2D, Texture(Index) 'Zuweisung: die Textur ist 2D
   'Generieren der eigentlichen Texture in OpenGL
   glTexImage2D glTexture2D, 0, 3, W, H, 0, GL_RGB, GL_UNSIGNED_BYTE, TextureImg(0, 0, 0)
   'Der 1. Parameter besagt wieder 2D Texture
   'Der 2. Parameter gibt den Grad der Details an, ist aber vorerst einmal unwichtig
   'Der 3. Parameter gibt die Art der Farbkanäle an, 3 = RGB.
   'Parameter 4 und 5 sind Breite und Höhe der Texture
   'Der 6. Parameter gibt die Rahmenbreite an, vorerst aber mal 0.
   'Parameter 7 und 8 geben Farbformat (RGB) und Art der Daten (Unsigned Byte = 0 - 255) an.
   'Der letzte Parameter übergibt schlußendlich die eigentliche Textur.
   
   'Diese Zeilen legen fest, welcher Filter verwendet werden soll:
   glTexParameteri glTexture2D, tpnTextureMinFilter, GL_LINEAR
   glTexParameteri glTexture2D, tpnTextureMagFilter, GL_LINEAR
   'tpnTextureMinFilter besagt, mit welchem Filter die Grafik zusammengedrückt werden soll.
   'tpnTextureMagFilter besagt, mit welchem Filter die Grafik auseinandergezogen wird.
   'Der Parameter GL_LINEAR erzeugt das beste Ergebnis, belastet aber den Prozessor.
   'Möglich wäre auch GL_NEAREST. Das entlastet zwar die Hardware, sieht aber schnell recht pixelig aus.
   
   Erase TextureImg 'Der Speicher wird nicht mehr gebraucht.
End Function



Public Function LoadTextureS(ByVal Filename As String, ByVal Index As Long) As Boolean
    On Error GoTo fehler
   Dim F As Long 'Dateihandle
   Dim BmpFile As BITMAPFILEHEADER 'Fileheader-Struktur einer Bitmap
   Dim BmpInfo As BITMAPINFOHEADER 'Info-Struktur einer Bitmap
   Dim BmpRGB() As RGBQUAD 'RGB Struktur = 4 Byte = 3 Farben und 1 Reserve
   Dim BmpImageSize As Long 'Größe der Bitmap in Byte
   Dim BmpPixelSize As Integer 'Größe der Daten eines Pixels in Byte
   Dim BmpImageData() As Byte 'Array für die eigentlichen Bitmapdaten
   
   F = FreeFile 'freie Dateinummer abholen
   Open Filename For Binary As #F 'Bitmap im Binär-Modus öffnen
   
   Get #F, , BmpFile 'Fileheader-Struktur / brauchen wir aber nicht!
   Get #F, , BmpInfo 'Struktur der Bitmap

   'wenn die Farbtiefe weniger als 24 Bit beträgt muß die Größe des Arrays angepaßt werden.
   'aus Grunden der Kompatibilität sollten die verwendeten Bitmaps aber immer 24-Bit Farbtiefe haben.
   If (BmpInfo.biBitCount < 24) Then
      ReDim BmpRGB(bmInfo.biClrUsed) 'anpassen des Arrays
      Get #F, , BmpRGB 'einlesen der Farbdaten
   End If

   BmpPixelSize = BmpInfo.biBitCount / 8 'Anzahl der Bytes für Farbe je Pixel
  
   BmpImageSize = BmpInfo.biWidth * BmpInfo.biHeight * BmpPixelSize 'Gesamtgröße der Bitmap
   ReDim BmpImageData(BmpImageSize) 'Array an Gesamtgröße der Bitmap anpassen
   
   Get #F, , BmpImageData 'einlesen der Bitmap und schon haben wir die Daten für OpenGL im Speicher
   
   Close #F

   glGenTextures 1, Texture(Index)  'kreiert eine Textur
   glBindTexture glTexture2D, Texture(Index) 'Zuweisung: die Textur ist 2D
   'Generieren der eigentlichen Texture in OpenGL
   glTexImage2D glTexture2D, 0, 3, BmpInfo.biWidth, BmpInfo.biHeight, 0, tiBGRExt, GL_UNSIGNED_BYTE, BmpImageData(0)
   'Der 1. Parameter besagt wieder 2D Texture
   'Der 2. Parameter gibt den Grad der Details an, ist aber vorerst einmal unwichtig
   'Der 3. Parameter gibt die Art der Farbkanäle an, 3 = RGB.
   'Parameter 4 und 5 sind Breite und Höhe der Texture und stammen aus der Info-Struktur der Bitmap
   'Der 6. Parameter gibt die Rahmenbreite an, vorerst aber mal 0.
   'Parameter 7 und 8 geben Farbformat (erweitertes RGB Format einer Bitmap) und Art der Daten (Unsigned Byte = 0 - 255) an.
   'Der letzte Parameter übergibt schlußendlich die eigentliche Textur.
   
   'Diese Zeilen legen fest, welcher Filter verwendet werden soll:
   glTexParameteri glTexture2D, tpnTextureMinFilter, GL_LINEAR
   glTexParameteri glTexture2D, tpnTextureMagFilter, GL_LINEAR
   'tpnTextureMinFilter besagt, mit welchem Filter die Grafik zusammengedrückt werden soll.
   'tpnTextureMagFilter besagt, mit welchem Filter die Grafik auseinandergezogen wird.
   'Der Parameter GL_LINEAR erzeugt das beste Ergebnis, belastet aber den Prozessor.
   'Möglich wäre auch GL_NEAREST. Das entlastet zwar die Hardware, sieht aber schnell recht pixelig aus.
   
   Erase BmpImageData 'Speicher freigen
   Erase BmpRGB
   Exit Function
fehler:
   MsgBox "The textures 'texture1.bmp' + 'texture2.bmp' must be in the same directory", 16, "Azazel"
End Function




