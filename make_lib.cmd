@echo off
@call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\vcvars32.bat"
@dumpbin /exports qlua.dll |grep -E "luaopen|lua_|lua[A-Z]_"|sed -e "s/^.*lua/lua/" >%qlua.def.temp
echo LIBRARY "qlua_proxy"  > qlua.def
echo EXPORTS >> qlua.def
type qlua.def.temp >> qlua.def
@lib /def:qlua.def /out:qlua.lib /machine:X86
@del /F /Q qlua.def.temp
