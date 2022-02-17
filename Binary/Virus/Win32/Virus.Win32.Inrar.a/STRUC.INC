struc   rar                             ; структура RAR-архива
        head_crc        dw      ?       ; CRC полей от HEAD_TYPE
        head_type       db      ?       ; Тип заголовка
        head_flags      dw      ?       ; Битовые флаги
        head_size       dw      ?       ; Полный размер заголовка файла,
                                        ; включая имя файла и комментарии
        pack_size       dd      ?       ; Размер файла в архиве (сжатый)
        unp_size        dd      ?       ; Размер исходного файла (несжатый)
        host_os         db      ?       ; Использованная при архивировании OS
        file_crc        dd      ?       ; CRC файла
        file_time       dd      ?       ; Дата и время в формате MS-DOS
        unp_ver         db      ?       ; Версия RAR для извлечения файла
        method          db      ?       ; Метод сжатия
        name_size       dw      ?       ; Размер имени файла
        attr            dd      ?       ; Атрибуты файла
        file_name       db      ?       ; Имя файла
                                        ; (строка размером NAME_SIZE байт)
ends    rar

struc   FindData
        FileAttributes  dd      ?
        CreationTime    dd      ?,?
        LastAccessTime  dd      ?,?
        LastWriteTime   dd      ?,?
        FileSizeHigh    dd      ?
        FileSizeLow     dd      ?
        Reserved0       dd      ?
        Reserved1       dd      ?
        FileName        db      0FFh dup (?)
        AltFileName     db      0Eh dup (?)
ends    FindData
