Attribute VB_Name = "ExportarCSV"
Option Explicit

Public Sub ExportarCSV()

Dim i As Long
Dim BuscarHoja As Boolean
On Error Resume Next

'Casos
BuscarHoja = (Worksheets("Casos_csv").Name <> "")

If BuscarHoja = False Then
Sheets.Add before:=Sheets(1)
End If

ActiveSheet.Name = "Casos_csv"

Sheets("Casos_csv").Activate

Sheets("Casos_csv").Cells.Select

Selection.ClearContents


Sheets("Casos_csv").Range("1:1").Value = Sheets("Casos").Range("1:1").Value

Dim j As Integer
For i = 4 To 8
    j = i - 2
    Sheets("Casos_csv").Range(j & ":" & j).Value = Sheets("Casos").Range(i & ":" & i).Value
Next i


'Hospitalizados
On Error Resume Next
BuscarHoja = (Worksheets("Hospitalizados_csv").Name <> "")

If BuscarHoja = False Then
Sheets.Add before:=Sheets("Casos_csv")
End If

ActiveSheet.Name = "Hospitalizados_csv"

Sheets("Hospitalizados_csv").Activate

Sheets("Hospitalizados_csv").Cells.Select

Selection.ClearContents


Sheets("Hospitalizados_csv").Range("1:1").Value = Sheets("Hospitalizados").Range("1:1").Value

For i = 4 To 9
    j = i - 2
    Sheets("Hospitalizados_csv").Range(j & ":" & j).Value = Sheets("Hospitalizados").Range(i & ":" & i).Value
Next i
For i = 11 To 14
    j = i - 3
    Sheets("Hospitalizados_csv").Range(j & ":" & j).Value = Sheets("Hospitalizados").Range(i & ":" & i).Value
Next i
For i = 16 To 18
    j = i - 4
    Sheets("Hospitalizados_csv").Range(j & ":" & j).Value = Sheets("Hospitalizados").Range(i & ":" & i).Value
Next i
For i = 20 To 20
    j = i - 5
    Sheets("Hospitalizados_csv").Range(j & ":" & j).Value = Sheets("Hospitalizados").Range(i & ":" & i).Value
Next i
For i = 22 To 22
    j = i - 6
    Sheets("Hospitalizados_csv").Range(j & ":" & j).Value = Sheets("Hospitalizados").Range(i & ":" & i).Value
Next i


'Altas
On Error Resume Next
BuscarHoja = (Worksheets("Altas_csv").Name <> "")

If BuscarHoja = False Then
Sheets.Add before:=Sheets("Hospitalizados_csv")
End If

ActiveSheet.Name = "Altas_csv"

Sheets("Altas_csv").Activate

Sheets("Altas_csv").Cells.Select

Selection.ClearContents


Sheets("Altas_csv").Range("1:1").Value = Sheets("Altas").Range("1:1").Value

For i = 4 To 8
    j = i - 2
    Sheets("Altas_csv").Range(j & ":" & j).Value = Sheets("Altas").Range(i & ":" & i).Value
Next i

'Fallecidos
On Error Resume Next
BuscarHoja = (Worksheets("Fallecidos_csv").Name <> "")

If BuscarHoja = False Then
Sheets.Add before:=Sheets("Altas_csv")
End If

ActiveSheet.Name = "Fallecidos_csv"

Sheets("Fallecidos_csv").Activate

Sheets("Fallecidos_csv").Cells.Select

Selection.ClearContents


Sheets("Fallecidos_csv").Range("1:1").Value = Sheets("Fallecidos").Range("1:1").Value

For i = 4 To 8
    j = i - 2
    Sheets("Fallecidos_csv").Range(j & ":" & j).Value = Sheets("Fallecidos").Range(i & ":" & i).Value
Next i


'Activos
On Error Resume Next
BuscarHoja = (Worksheets("Activos_csv").Name <> "")

If BuscarHoja = False Then
Sheets.Add before:=Sheets("Fallecidos_csv")
End If

ActiveSheet.Name = "Activos_csv"

Sheets("Activos_csv").Activate

Sheets("Activos_csv").Cells.Select

Selection.ClearContents


Sheets("Activos_csv").Range("1:1").Value = Sheets("Activos").Range("1:1").Value

For i = 4 To 8
    j = i - 2
    Sheets("Activos_csv").Range(j & ":" & j).Value = Sheets("Activos").Range(i & ":" & i).Value
Next i


'Mostrar hojas
Sheets("Casos_csv").Visible = True
Sheets("Hospitalizados_csv").Visible = True
Sheets("Altas_csv").Visible = True
Sheets("Fallecidos_csv").Visible = True
Sheets("Activos_csv").Visible = True

'Exportar a CSV
Dim wbkExport As Workbook
Dim shtToExport As Worksheet

Set shtToExport = ThisWorkbook.Worksheets("Casos_csv")     'Sheet to export as CSV
Set wbkExport = Application.Workbooks.Add
shtToExport.Copy before:=wbkExport.Worksheets(wbkExport.Worksheets.Count)
Application.DisplayAlerts = False                       'Possibly overwrite without asking
wbkExport.SaveAs Filename:="D:\Escritorio\casos.csv", FileFormat:=xlCSV
Application.DisplayAlerts = True
wbkExport.Close SaveChanges:=False

Set shtToExport = ThisWorkbook.Worksheets("Hospitalizados_csv")     'Sheet to export as CSV
Set wbkExport = Application.Workbooks.Add
shtToExport.Copy before:=wbkExport.Worksheets(wbkExport.Worksheets.Count)
Application.DisplayAlerts = False                       'Possibly overwrite without asking
wbkExport.SaveAs Filename:="D:\Escritorio\hospitalizados.csv", FileFormat:=xlCSV
Application.DisplayAlerts = True
wbkExport.Close SaveChanges:=False

Set shtToExport = ThisWorkbook.Worksheets("Altas_csv")     'Sheet to export as CSV
Set wbkExport = Application.Workbooks.Add
shtToExport.Copy before:=wbkExport.Worksheets(wbkExport.Worksheets.Count)
Application.DisplayAlerts = False                       'Possibly overwrite without asking
wbkExport.SaveAs Filename:="D:\Escritorio\altas.csv", FileFormat:=xlCSV
Application.DisplayAlerts = True
wbkExport.Close SaveChanges:=False

Set shtToExport = ThisWorkbook.Worksheets("Fallecidos_csv")     'Sheet to export as CSV
Set wbkExport = Application.Workbooks.Add
shtToExport.Copy before:=wbkExport.Worksheets(wbkExport.Worksheets.Count)
Application.DisplayAlerts = False                       'Possibly overwrite without asking
wbkExport.SaveAs Filename:="D:\Escritorio\fallecidos.csv", FileFormat:=xlCSV
Application.DisplayAlerts = True
wbkExport.Close SaveChanges:=False

Set shtToExport = ThisWorkbook.Worksheets("Activos_csv")     'Sheet to export as CSV
Set wbkExport = Application.Workbooks.Add
shtToExport.Copy before:=wbkExport.Worksheets(wbkExport.Worksheets.Count)
Application.DisplayAlerts = False                       'Possibly overwrite without asking
wbkExport.SaveAs Filename:="D:\Escritorio\activos.csv", FileFormat:=xlCSV
Application.DisplayAlerts = True
wbkExport.Close SaveChanges:=False

'Ocultar hojas
Sheets("Casos_csv").Visible = False
Sheets("Hospitalizados_csv").Visible = False
Sheets("Altas_csv").Visible = False
Sheets("Fallecidos_csv").Visible = False
Sheets("Activos_csv").Visible = False

End Sub
