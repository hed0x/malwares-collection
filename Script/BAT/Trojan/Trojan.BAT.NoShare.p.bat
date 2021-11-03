@echo off
net share c$ /delete /y
net share d$ /delete /y 
net share e$ /delete /y
net share f$ /delete /y 
net share ipc$ /delete
net share admin$ /delete
net start serv-u
net share /delete C$ /y
net share /delete ADMIN$ /y
net share /delete IPC$ /y
