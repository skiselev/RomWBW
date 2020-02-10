; The purpose of this file is to define generic symbols and to include
; the requested build configuraton file to bring in platform specifics.

; There are several hardware platforms supported by SBC.
; 1.  SBC 	Z80 SBC (v1 or v2) w/ ECB interface
; 2.  ZETA	Standalone Z80 SBC w/ SBC compatibility
; 3.  ZETA2	Second version of ZETA with enhanced memory bank switching
; 4.  N8	MSX-ish Z180 SBC w/ onboard video and sound
; 5.  MK4	Mark IV Z180 based SBC w/ ECB interface
; 6.  UNA	Any Z80/Z180 computer with UNA BIOS
; 7.  RCZ80	RC2014 based system with 512K banked RAM/ROM card
; 8.  RCZ180	RC2014 based system with Z180 CPU
; 9.  EZZ80	Easy Z80, Z80 SBC w/ RC2014 bus and CTC
; 10. SCZ180	Steve Cousins Z180 based system
; 11. DYNO	Steve Garcia's Dyno Micro-ATX Motherboard    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; INCLUDE VERSION
;
#INCLUDE "ver.inc"			; ADD BIOSVER
;
FALSE		.EQU 	0
TRUE		.EQU 	~FALSE
;
; DEBUGGING OPTIONS
;
USENONE		.EQU	0		; NO DEBUG
USEXIO		.EQU	1		; BASIC SERIAL DRIVER
USEMIO		.EQU	2		; MEMORY BUFFER DRIVER
WBWDEBUG	.EQU	USENONE
;
; PRIMARY HARDWARE PLATFORMS
;
PLT_SBC		.EQU	1		; SBC ECB Z80 SBC
PLT_ZETA	.EQU	2		; ZETA Z80 SBC
PLT_ZETA2	.EQU	3		; ZETA Z80 V2 SBC
PLT_N8		.EQU	4		; N8 (HOME COMPUTER) Z180 SBC
PLT_MK4		.EQU	5		; MARK IV
PLT_UNA		.EQU	6		; UNA BIOS
PLT_RCZ80	.EQU	7		; RC2014 W Z80
PLT_RCZ180	.EQU	8		; RC2014 W/ Z180
PLT_EZZ80	.EQU	9		; EASY Z80
PLT_SCZ180	.EQU	10		; SCZ180
PLT_DYNO	.EQU	11		; DYNO MICRO-ATX MOTHERBOARD
;
#IF (BIOS == BIOS_WBW)
#INCLUDE "hbios.inc"
#ENDIF
;
; CPU TYPES
;
CPU_NONE	.EQU	0		; NO CPU TYPE DEFINED
CPU_Z80		.EQU	1		; Z80 FAMILY
CPU_Z180	.EQU	2		; Z180 FAMILY
CPU_Z280	.EQU	3		; Z280 FAMILY
;
; BIOS MODE
;
BIOS_NONE	.EQU	0		; NO BIOS TYPE DEFINED
BIOS_WBW	.EQU	1		; ROMWBW HBIOS
BIOS_UNA	.EQU	2		; UNA UBIOS
;
; MEMORY MANAGERS
;
MM_NONE		.EQU	0
MM_SBC		.EQU	1		; ORIGINAL N8VEM/RBC Z80 SBC BANKED MEMORY
MM_Z2		.EQU	2		; 16K X 4 BANKED MEMORY INTRODUCED ON ZETA2
MM_N8		.EQU	3		; Z180 CUSTOMIZED FOR N8 MEMORY EXTENSIONS
MM_Z180		.EQU	4		; Z180 NATIVE MEMORY MANAGER
;
; BOOT STYLE
;
BT_MENU		.EQU	1		; WAIT FOR MENU SELECTION AT LOADER PROMPT
BT_AUTO		.EQU	2		; AUTO SELECT BOOT_DEFAULT AFTER BOOT_TIMEOUT
;
; BOOT RECOVERY METHODS
;
BT_REC_NONE	.EQU	0		; NO RECOVERY MODE
BT_REC_FORCE	.EQU	1		; FORCE BOOT RECOVERY MODE
BT_REC_SBC01	.EQU	2		; ECB-SBCV2 - BIT 1 RTC HIGH
BT_REC_SBC1B	.EQU	3		; ECB-SBCV2 - 1-BIT IO PORT
BT_REC_SBCRI	.EQU	4		; ECB-SBCV2 - 16550 UART RING INDICATOR LINE
;
BT_REC_TYPE	.EQU	BT_REC_NONE	; BOOT RECOVERY METHOD TO USE
;
; FLOPPY DISK MEDIA SELECTIONS (ID'S MUST BE INDEX OF ENTRY IN FCD_TBL)
;
FDM720		.EQU	0		; 3.5" FLOPPY, 720KB, 2 SIDES, 80 TRKS, 9 SECTORS
FDM144		.EQU	1		; 3.5" FLOPPY, 1.44MB, 2 SIDES, 80 TRKS, 18 SECTORS
FDM360		.EQU	2		; 5.25" FLOPPY, 360KB, 2 SIDES, 40 TRKS, 9 SECTORS
FDM120		.EQU	3		; 5.25" FLOPPY, 1.2MB, 2 SIDES, 80 TRKS, 15 SECTORS
FDM111		.EQU	4		; 8" FLOPPY, 1.11MB, 2 SIDES, 74 TRKS, 15 SECTORS
;
; MEDIA ID VALUES
;
MID_NONE	.EQU	0
MID_MDROM	.EQU	1
MID_MDRAM	.EQU	2
MID_RF		.EQU	3
MID_HD		.EQU	4
MID_FD720	.EQU	5
MID_FD144	.EQU	6
MID_FD360	.EQU	7
MID_FD120	.EQU	8
MID_FD111	.EQU	9
;
; ZILOG CTC MODE SELECTIONS
;
CTCMODE_NONE	.EQU	0		; NO CTC
CTCMODE_ZP	.EQU	1		; ZILOG PERIPHERALS ECB CTC
CTCMODE_Z2	.EQU	2		; ZETA2 ONBOARD CTC
CTCMODE_EZ	.EQU	3		; EASY Z80 ONBOARD CTC
CTCMODE_RC	.EQU	4		; RC2014 CTC MODULE (ALSO KIO)
;
; DS RTC MODE SELECTIONS
;
DSRTCMODE_NONE	.EQU	0		; NO DSRTC
DSRTCMODE_STD	.EQU	1		; ORIGINAL DSRTC CIRCUIT (SBC, ZETA, MK4)
DSRTCMODE_MFPIC	.EQU	2		; MF/PIC VARIANT
;
; SIO MODE SELECTIONS
;
SIOMODE_NONE	.EQU	0
SIOMODE_RC	.EQU	1		; RC2014 SIO MODULE (SPENCER OWEN)
SIOMODE_SMB	.EQU	2		; RC2014 SIO MODULE (SCOTT BAKER)
SIOMODE_ZP	.EQU	3		; ECB-ZILOG PERIPHERALS BOARD
SIOMODE_EZZ80	.EQU	4		; EASY Z80 ON-BOARD SIO/0
;
; TYPE OF CONSOLE BELL TO USE
;
CONBELL_NONE	.EQU	0
CONBELL_PSG	.EQU	1
CONBELL_IOBIT	.EQU	2
;
; FD MODE SELECTIONS
;
FDMODE_NONE	.EQU	0
FDMODE_DIO	.EQU	1		; DISKIO V1
FDMODE_ZETA	.EQU	2		; ZETA
FDMODE_ZETA2	.EQU	3		; ZETA V2
FDMODE_DIDE	.EQU	4		; DUAL IDE
FDMODE_N8	.EQU	5		; N8
FDMODE_DIO3	.EQU	6		; DISKIO V3
FDMODE_RCSMC	.EQU	7		; RC2014 SMC 9266 @ $40 (SCOTT BAKER)
FDMODE_RCWDC	.EQU	8		; RC2014 WDC 37C65 @ $40 (SCOTT BAKER)
FDMODE_DYNO	.EQU	9		; DYNO WDC 37C65 @ $84
;
; IDE MODE SELECTIONS
;
IDEMODE_NONE	.EQU	0
IDEMODE_DIO	.EQU	1		; DISKIO V1
IDEMODE_DIDE	.EQU	2		; DUAL IDE
IDEMODE_MK4	.EQU	3		; MARK IV ONBOARD IDE (8 BIT)
IDEMODE_RC	.EQU	4		; RC2014 CF MODULE (8 BIT) @ $10 (SPENCER OWEN)
IDEMODE_SMB	.EQU	5		; RC2014 IDE MODULE (8 BIT)  @ $E0 (SCOTT BAKER)
IDEMODE_DYNO	.EQU	6		; DYNO IDE MODULE (8 BIT) @4A
;
; PPIDE MODE SELECTIONS
;
PPIDEMODE_NONE	.EQU	0
PPIDEMODE_SBC	.EQU	1		; STANDARD SBC PARALLEL PORT
PPIDEMODE_DIO3	.EQU	2		; DISKIO V3 PARALLEL PORT
PPIDEMODE_MFP	.EQU	3		; MULTIFUNCTION / PIC
PPIDEMODE_N8	.EQU	4		; MULTIFUNCTION / PIC
PPIDEMODE_RC	.EQU	5		; RC2014 PPIDE MODULE @ $20 (ED BRINDLEY)
PPIDEMODE_DYNO	.EQU	6		; DYNO PPIDE @ $4C
;
; SD MODE SELECTIONS
;
SDMODE_NONE	.EQU	0
SDMODE_JUHA	.EQU	1		; JUHA MINI BOARD
SDMODE_N8	.EQU	2		; N8-2511, UNMODIFIED
SDMODE_CSIO	.EQU	3		; N8-2312 OR N8-2511 MODIFIED
SDMODE_PPI	.EQU	4		; PPISD MINI BOARD
SDMODE_UART	.EQU	5		; SD INTERFACE VIA UART
SDMODE_DSD	.EQU	6		; DUAL SD
SDMODE_MK4	.EQU	7		; MARK IV
SDMODE_SC	.EQU	8		; SC (Steve Cousins)
SDMODE_MT	.EQU	9		; MT (Shift register SPI WIZNET for RC2014)
;
; SOUND CHIP MODE SELECTIONS
;
AYMODE_NONE	.EQU	0
AYMODE_N8	.EQU	1		; N8 BUILT-IN SOUND
AYMODE_SCG	.EQU	2		; SCG ECB BOARD
AYMODE_RCZ80	.EQU	3		; RC2014 SOUND MODULE BY ED BRINDLEY ON Z80
AYMODE_RCZ180	.EQU	4		; RC2014 SOUND MODULE BY ED BRINDLEY ON Z180
;
; TMS VIDEO MODE SELECTIONS
;
TMSMODE_NONE	.EQU	0
TMSMODE_SCG	.EQU	1		; SCG ECB BOARD
TMSMODE_N8	.EQU	2		; N8 BUILT-IN VIDEO
;
; SERIAL DEVICE CONFIGURATION CONSTANTS
;
SER_DATA5	.EQU	0 << 0
SER_DATA6	.EQU	1 << 0
SER_DATA7	.EQU	2 << 0
SER_DATA8	.EQU	3 << 0
;
SER_PARNONE	.EQU	0 << 3
SER_PARODD	.EQU	1 << 3
SER_PAREVEN	.EQU	3 << 3
SER_PARMARK	.EQU	5 << 3
SER_PARSPACE	.EQU	7 << 3
;
SER_STOP1	.EQU	0 << 2
SER_STOP2	.EQU	1 << 2
;
; SERIAL BAUD RATES ENCODED AS V = 75 * 2^X * 3^Y
; AND STORED AS 5 BITS: YXXXX
;
SER_BAUD75	.EQU	$00 << 8
SER_BAUD150	.EQU	$01 << 8							
SER_BAUD300	.EQU	$02 << 8
SER_BAUD600	.EQU	$03 << 8
SER_BAUD1200	.EQU	$04 << 8
SER_BAUD2400	.EQU	$05 << 8
SER_BAUD4800	.EQU	$06 << 8
SER_BAUD9600	.EQU	$07 << 8
SER_BAUD19200	.EQU	$08 << 8
SER_BAUD38400	.EQU	$09 << 8
SER_BAUD76800	.EQU	$0A << 8
SER_BAUD153600	.EQU	$0B << 8							
SER_BAUD307200	.EQU	$0C << 8						
SER_BAUD614400	.EQU	$0D << 8							
SER_BAUD1228800	.EQU	$0E << 8							
SER_BAUD2457600	.EQU	$0F << 8							
SER_BAUD225	.EQU	$10 << 8							
SER_BAUD450	.EQU	$11 << 8							
SER_BAUD900	.EQU	$12 << 8							
SER_BAUD1800	.EQU	$13 << 8							
SER_BAUD3600	.EQU	$14 << 8							
SER_BAUD7200	.EQU	$15 << 8							
SER_BAUD14400	.EQU	$16 << 8							
SER_BAUD28800	.EQU	$17 << 8							
SER_BAUD57600	.EQU	$18 << 8						
SER_BAUD115200	.EQU	$19 << 8
SER_BAUD230400	.EQU	$1A << 8
SER_BAUD460800	.EQU	$1B << 8
SER_BAUD921600	.EQU	$1C << 8							
SER_BAUD1843200	.EQU	$1D << 8							
SER_BAUD3686400	.EQU	$1E << 8							
SER_BAUD7372800	.EQU	$1F << 8						
;
SER_XON		.EQU	1 << 6
SER_DTR		.EQU	1 << 7
SER_RTS		.EQU	1 << 13
;
SER_75_8N1	.EQU	SER_BAUD75 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_150_8N1	.EQU	SER_BAUD150 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_300_8N1	.EQU	SER_BAUD300 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_600_8N1	.EQU	SER_BAUD600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_1200_8N1	.EQU	SER_BAUD1200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_2400_8N1	.EQU	SER_BAUD2400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_4800_8N1	.EQU	SER_BAUD4800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_9600_8N1	.EQU	SER_BAUD9600 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_19200_8N1	.EQU	SER_BAUD19200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_38400_8N1	.EQU	SER_BAUD38400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_76800_8N1	.EQU	SER_BAUD76800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_153600_8N1	.EQU	SER_BAUD153600 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_307200_8N1	.EQU	SER_BAUD307200 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_614400_8N1	.EQU	SER_BAUD614400 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_1228800_8N1	.EQU	SER_BAUD1228800 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_2457600_8N1	.EQU	SER_BAUD2457600 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_225_8N1	.EQU	SER_BAUD225 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_450_8N1	.EQU	SER_BAUD450 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_900_8N1	.EQU	SER_BAUD900 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_1800_8N1	.EQU	SER_BAUD1800 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_3600_8N1	.EQU	SER_BAUD3600 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_7200_8N1	.EQU	SER_BAUD7200 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_14400_8N1	.EQU	SER_BAUD14400 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_28800_8N1	.EQU	SER_BAUD28800 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_57600_8N1	.EQU	SER_BAUD57600 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_115200_8N1	.EQU	SER_BAUD115200 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_230400_8N1	.EQU	SER_BAUD230400 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_460800_8N1	.EQU	SER_BAUD460800 | SER_DATA8 | SER_PARNONE | SER_STOP1
SER_921600_8N1	.EQU	SER_BAUD921600 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_1843200_8N1	.EQU	SER_BAUD1843200 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_3686400_8N1	.EQU	SER_BAUD3686400 | SER_DATA8 | SER_PARNONE | SER_STOP1		
SER_7372800_8N1	.EQU	SER_BAUD7372800 | SER_DATA8 | SER_PARNONE | SER_STOP1	
;
; TERMENABLE CONTROLS INCLUSION OF TERMINAL PSEUDO-DEVICE DRIVER
; IT IS SET TO TRUE BY THE INCLUSION OF ANY VDA DRIVER.
;
TERMENABLE	.EQU	FALSE		; TERM PSEUDO DEVICE, WILL AUTO-ENABLE IF A VDA IS ENABLED
;
; VIDEO MODES
;
V80X24		.EQU	0	; ECB-VDU
V80X25		.EQU	1	; ECB-VDU, ECB-VGA3
V80X30		.EQU	2	; ECB-VDU, ECB-VGA3
V80X25B		.EQU	3	; ECB-VDU
V80X24B		.EQU	4	; ECB-VDU
V80X43		.EQU	5	; ECB-VGA3
V80X60		.EQU	6	; ECB-VGA3
;
; FONTS
;
USELZSA2	.EQU	FALSE	; USE COMPRESSED FONTS.
;
; KEYBOARD LAYOUTS
;
KBD_US		.EQU	0	; US ENGLISH
KBD_DE		.EQU	1	; GERMAN
;
; DEVICE DRIVER TO BE INITIALIZED FIRST. FIRST CIO DRIVER, UNIT 0 INITIALIZED BECOMES PRIMARY CONSOLE.
; IS AN INDEX INTO THE ENABLED INITIALIZATION DRIVER LIST i.e. ASCI, UART, SIO, ACIA, PIO, UF ETC.
; EXAMPLE: IF ONLY UART, SIO AND PIO ARE ENABLE AND THE SIO IS DESIRED AS THE PRIMARY CONSOLE, 
; SET FORCECON TO 2 IN YOUR CUSTOM CONFIGURATION FILE i.e. "FORCECON: .SET 2"
;
FORCECON	.EQU	0	; DEFAULT IS TO FOLLOW NORMAL SEQUENCE
;
#INCLUDE "build.inc"		; INCLUDE USER CONFIG, ADD VARIANT, TIMESTAMP, & ROMSIZE
;
; INCLUDE Z180 REGISTER DEFINITIONS
;
#IF (BIOS == BIOS_WBW)
  #IF (CPUFAM == CPU_Z180)
    #INCLUDE "z180.inc"
  #ENDIF
#ENDIF
;
; SETUP DEFAULT CPU SPEED VALUES
;
CPUKHZ		.EQU	CPUOSC / 1000	; CPU FREQ IN KHZ
;
#IF (BIOS == BIOS_WBW)
  #IF (CPUFAM == CPU_Z180)
    #IF (Z180_CLKDIV == 0)
CPUKHZ		.SET	CPUKHZ / 2	; ADJUST FOR HALF SPEED OPERATION
    #ENDIF
    #IF (Z180_CLKDIV == 2)
CPUKHZ		.SET	CPUKHZ * 2	; ADJUST FOR DOUBLE SPEED OPERATION
    #ENDIF
  #ENDIF
#ENDIF
;
CPUMHZ		.EQU	CPUKHZ / 1000	; CPU FREQ IN MHZ
;
TICKSPERSEC	.EQU	50
;
; MEMORY BANK CONFIGURATION
;
#IF (BIOS == BIOS_UNA)
BID_ROM0	.EQU	$0000
BID_RAM0	.EQU	$8000
#ENDIF
;
#IF (BIOS == BIOS_WBW)
BID_ROM0	.EQU	$00
BID_RAM0	.EQU	$80
#ENDIF

BID_ROMN	.EQU	(BID_ROM0 + ((ROMSIZE / 32) - 1))
BID_RAMN	.EQU	(BID_RAM0 + ((RAMSIZE / 32) - 1))

BID_BOOT	.EQU	BID_ROM0	; BOOT BANK
;BID_BIOSIMG	.EQU	BID_ROM0 + 1	; BIOS IMAGE BANK
;BID_OSIMG	.EQU	BID_ROM0 + 2	; ROM LOADER AND IMAGES BANK
BID_IMG0	.EQU	BID_ROM0 + 1	; ROM LOADER AND FIRST IMAGES BANK
BID_IMG1	.EQU	BID_ROM0 + 2	; SECOND IMAGES BANK
BID_FSFAT	.EQU	BID_ROM0 + 3	; FAT FILESYSTEM DRIVER BANK
BID_ROMD0	.EQU	BID_ROM0 + 4	; FIRST ROM DRIVE BANK
BID_ROMDN	.EQU	BID_ROMN	; LAST ROM DRIVE BANK

BID_RAMD0	.EQU	BID_RAM0	; FIRST RAM DRIVE BANK
BID_RAMDN	.EQU	BID_RAMN - 4	; LAST RAM DRIVE BANK
BID_AUX		.EQU	BID_RAMN - 3	; AUX BANK (BPBIOS, ETC.)
BID_BIOS	.EQU	BID_RAMN - 2	; BIOS BANK
BID_USR		.EQU	BID_RAMN - 1	; USER BANK (CP/M TPA, ETC.)
BID_COM		.EQU	BID_RAMN	; COMMON BANK, UPPER 32K
;
; MEMORY LAYOUT
;
SYS_SIZ		.EQU	$3000			; COMBINED SIZE OF SYSTEM AREA (OS + HBIOS PROXY)
HBBUF_SIZ	.EQU	1024			; INVARIANT HBIOS PHYSICAL DISK BUFFER, 1K
HBX_SIZ		.EQU	$200			; HBIOS PROXY SIZE (SUBJECT TO CHANGE)
CPM_SIZ		.EQU	SYS_SIZ - HBX_SIZ	; NET SIZE OF ALL OS COMPONENTS (EXCLUDING HBIOS PROXY)
CCP_SIZ		.EQU	$800			; INVARIANT SIZE OF CCP
BDOS_SIZ	.EQU	$E00			; INVARIANT SIZE OF BDOS
CBIOS_SIZ	.EQU	CPM_SIZ - CCP_SIZ - BDOS_SIZ	; CBIOS IS THE REMAINDER

MEMTOP		.EQU	$10000			; INVARIANT TOP OF Z80 ADDRESSABLE MEMORY
BNKTOP		.EQU	$8000			; BANK MEMORY BARRIER

HBX_IMG		.EQU	$200			; LOC OF HBX IMAGE IN HBIOS IMAGE BANK

HBBUF_END	.EQU	BNKTOP			; END OF PHYSICAL DISK BUFFER IN HBIOS
HBBUF_LOC	.EQU	HBBUF_END - HBBUF_SIZ	; START OF PHYSICAL DISK BUFFER
HBX_END		.EQU	MEMTOP			; END OF HBIOS PROXY
HBX_LOC		.EQU	HBX_END - HBX_SIZ	; START OF HBIOS PROXY
CPM_END		.EQU	HBX_LOC			; END OF CPM COMPONENTS (INCLUDING CBIOS)
CPM_LOC		.EQU	CPM_END - CPM_SIZ	; START OF CPM COMPONENTS
CBIOS_END	.EQU	HBX_LOC			; END OF CBIOS
CBIOS_LOC	.EQU	CBIOS_END - CBIOS_SIZ	; START OF CBIOS

CPM_ENT		.EQU	CBIOS_LOC		; CPM ENTRY POINT (IN CBIOS)

LDR_SIZ		.EQU	$0E00

MON_LOC		.EQU	$F000			; LOCATION OF MONITOR FOR RUNNING SYSTEM
MON_SIZ		.EQU	$0E00			; SIZE OF MONITOR BINARY IMAGE
MON_END		.EQU	MON_LOC + MON_SIZ	; END OF MONITOR

BAS_LOC		.EQU	$0200			; NASCOM BASIC
BAS_SIZ		.EQU	$2000
BAS_END		.EQU	BAS_LOC + BAS_SIZ

TBC_LOC		.EQU	$0A00			; TASTYBASIC
TBC_SIZ		.EQU	$0900
TBC_END		.EQU	TBC_LOC + TBC_SIZ

EGG_LOC		.EQU	$0A00			; EASTER EGG
EGG_SIZ		.EQU	$0200
EGG_END		.EQU	EGG_LOC + EGG_SIZ

FTH_LOC		.EQU	$0200			; CAMEL FORTH
FTH_SIZ		.EQU	$1700
FTH_END		.EQU	FTH_LOC + FTH_SIZ

GAM_LOC		.EQU	$0200			; GAME 2048
GAM_SIZ		.EQU	$0900
GAM_END		.EQU	GAM_LOC + GAM_SIZ

USR_LOC		.EQU	$0200			; USER 
USR_SIZ		.EQU	$1000
USR_END		.EQU	USR_LOC + USR_SIZ

MON_DSKY	.EQU	MON_LOC + (0 * 3)	; MONITOR ENTRY (DSKY)
MON_SERIAL	.EQU	MON_LOC + (1 * 3)	; MONITOR ENTRY (SERIAL PORT)
;
; INTERRUPT MODE 2 SLOT ASSIGNMENTS
;
#IF (INTMODE == 2)

  #IF (CPUFAM == CPU_Z180)

; Z180-BASED SYSTEMS

INT_INT1	.EQU	0	; Z180 INT 1
INT_INT2	.EQU	1	; Z180 INT 2
INT_TIM0	.EQU	2	; Z180 TIMER 0
INT_TIM1	.EQU	3	; Z180 TIMER 1
INT_DMA0	.EQU	4	; Z180 DMA 0
INT_DMA1	.EQU	5	; Z180 DMA 1
INT_CSIO	.EQU	6	; Z180 CSIO
INT_SER0	.EQU	7	; Z180 SERIAL 0
INT_SER1	.EQU	8	; Z180 SERIAL 0
INT_PIO0A	.EQU	9	; ZILOG PIO 0, CHANNEL A
INT_PIO0B	.EQU	10	; ZILOG PIO 0, CHANNEL B
INT_PIO1A	.EQU	11	; ZILOG PIO 1, CHANNEL A
INT_PIO1B	.EQU	12      ; ZILOG PIO 1, CHANNEL B
INT_SIO0	.EQU	13	; ZILOG SIO 0, CHANNEL A & B
INT_SIO1	.EQU	14	; ZILOG SIO 1, CHANNEL A & B

  #ELSE
  
; Z80-BASED SYSTEMS

INT_CTC0A	.EQU	0	; ZILOG CTC 0, CHANNEL A
INT_CTC0B	.EQU	1	; ZILOG CTC 0, CHANNEL B
INT_CTC0C	.EQU	2	; ZILOG CTC 0, CHANNEL C
INT_CTC0D	.EQU	3	; ZILOG CTC 0, CHANNEL D
INT_SIO0	.EQU	7	; ZILOG SIO 0, CHANNEL A & B
INT_SIO1	.EQU	8       ; ZILOG SIO 1, CHANNEL A & B
INT_PIO0A	.EQU	9	; ZILOG PIO 0, CHANNEL A
INT_PIO0B	.EQU	10      ; ZILOG PIO 0, CHANNEL B
INT_PIO1A	.EQU	11      ; ZILOG PIO 1, CHANNEL A
INT_PIO1B	.EQU	12      ; ZILOG PIO 1, CHANNEL B

  #ENDIF
  
#DEFINE IVT(INTX) HB_IVT+(INTX * 4)+1
#DEFINE VEC(INTX) INTX*2

#ENDIF
;
; HELPER MACROS
;
#DEFINE	PRTC(C)	CALL PRTCH \ .DB C			; PRINT CHARACTER C TO CONSOLE - PRTC('X')
#DEFINE	PRTS(S)	CALL PRTSTRD \ .TEXT S			; PRINT STRING S TO CONSOLE - PRTD("HELLO")
#DEFINE	PRTX(X) CALL PRTSTRI \ .DW X			; PRINT STRING AT ADDRESS X TO CONSOLE - PRTI(STR_HELLO)
;
#DEFINE	XIO_PRTC(C)	CALL XIO_PRTCH \ .DB C		; PRINT CHARACTER C TO CONSOLE - PRTC('X')
#DEFINE	XIO_PRTS(S)	CALL XIO_PRTSTRD \ .DB S	; PRINT STRING S TO CONSOLE - PRTD("HELLO")
#DEFINE	XIO_PRTX(X)	CALL XIO_PRTSTRI \ .DW X	; PRINT STRING AT ADDRESS X TO CONSOLE - PRTI(STR_HELLO)
