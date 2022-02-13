
include                 ..\..\INCLUDE\consts.inc

                        public  _uniquestr

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

                        .code

callX                   equ     callW
include                 ..\..\PLUGIN\LDRWIN32\unique.inc

                        end

