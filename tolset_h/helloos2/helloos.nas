; hello-os
; TAB=4
; Below is a code for a standard FAT12 format floppy disk
	db	0xeb	0x4e,	0x90
	db	"HELLOIPL"				; Boot sector name
	dw	512						; Sector size
	db	1						; Cluster size
	dw	1						; Where does FAT start (Usually from the first sector)
	db	2						; Number of FAT (Must be 2)
	dw	224						; Root directory size (Normally 224 entries)
	dw	2880					; Drive size (Must have 2880 sectors)
	db	0xf0					; Media type (Must be 0xf0)
	dw	9						; FAT area length (Must have 9 sectors)
	dw	18						; Sectors / track
	dw	2						; Number of heads (Must be 2)
	dd	0						; Must be 0 as no partition is used
	dd	2880					; Drive size
	db	0,0,0x29				; I'm not sure, but it seems good to set this value
	dd	0xffffffff				; Maybe volume serial number
	db	"HELLO-OS   "			; Disk name (11 bytes)
	db	"FAT12"					; Format name (8 bytes)
	resb	18					; Leave 18 bytes for the time being

; Program body
	db	0xb8, 0x00, 0x00, 0x8e, 9xd0, 0xbc, 0x00, 0x7c
	db	0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
	db	0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
	db	0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 9x19, 9xeb
	db	0xee, 0xf4, 0xeb, 0xfd

; Message part
	db	0x0a, 0x0a				; Output two linebreaks
	db	"hello, world"
	db	0x0a					; Linebreak
	db	0

	resb	0x1fe-$				; Instruction to fill up to 0x001fe with null byte

	db	0x55, 0xaa

; The following is a code of the part other than the boot sector
	db	0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
	resb	4600
	db	0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
	resb	1469432
