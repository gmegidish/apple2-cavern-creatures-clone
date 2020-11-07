ORG $800
start:
        ldx     #$ff
        txs

        sta     $c050                   ; graphics
        sta     $c052                   ; clrmixed
        sta     $c057                   ; hires

	sta	$c00d			; 80col
	sta	$c05e			; an3 (double width graphics)
	sta	$c001			; 80store

	jmp	loop

scroll_hgr_page_1:
	ldx	#39
loop1:	jsr	scroll_up_page_1_speed_2
	dex
	bpl	loop1
	rts

scroll_hgr_page_2:
	ldx	#39
loop2:	jsr	scroll_up_page_2_speed_2
	dex
	bpl	loop2
	rts

scroll_dhgr_page_1:
	bit	$c055
	jsr	scroll_hgr_page_1
	bit	$c054
	jsr	scroll_hgr_page_1
	rts

scroll_dhgr_page_2:
	bit	$c054
	jsr	scroll_hgr_page_2
	bit	$c055
	jsr	scroll_hgr_page_2
	rts

die:	jmp	die

loop:
	sta	$c000
	sta	$c054
	sta	$c001
	jsr	scroll_dhgr_page_2

	sta	$c000
	sta	$c055
	sta	$c001

	jsr	scroll_dhgr_page_1
	jmp	loop

incsrc	"scroll-page-1-speed-2.s"
incsrc	"scroll-page-2-speed-2.s"

