<% Option Explicit %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Disk Space Checcer</title>
  </head>
  <body>
    <div><%
        Set objWMIService = GetObject("winmgmts:")
        Set objLogicalDisk = objWMIService.Get("Win32_LogicalDisk.DeviceID='c:'")
        Dim dblFreeSpace As Double
        dblFreeSpace = objLogicalDisk.FreeSpace
        dblFreeSpace = dblFreeSpace / 1024 / 1024
        dblFreeSpace = FormatNumber(dblFreeSpace, 2)
        dblFreeSpace = dblFreeSpace & " MB"
      %></div>
  </body>
</html>