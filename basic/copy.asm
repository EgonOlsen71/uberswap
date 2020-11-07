*=$c000

MEM=832
CC=$fb
PO=$fd

jmp copytop
jmp copyright
jmp swap
jmp savescreen
jmp restorescreen

copytop:

jsr copyparams

ldy #0
lda (CC),y
sta 2
tya
sta (CC),y
iny
sta (CC),y
ldy #80
lda 2
sta (CC),y
iny
sta (CC),y

ldy #40
lda (PO),y
ldy #80
sta (PO),y

ldy #41
lda (PO),y
ldy #81
sta (PO),y

ldy #0
lda (PO),y
ldy #40
sta (PO),y

ldy #1
lda (PO),y
ldy #41
sta (PO),y
rts

copyparams:
lda MEM
sta CC
sec
sbc #<54272
sta PO
lda MEM+1
sta CC+1
sbc #>54272
sta PO+1
rts

copyright:

jsr copyparams

ldx #0
ldy #0
copyloop:

ldy #2
lda (CC),y
pha
lda (PO),y
ldy #0
sta (PO),y
pla
sta (CC),y

ldy #3
lda (CC),y
pha
lda (PO),y
ldy #1
sta (PO),y
pla
sta (CC),y

clc
lda MEM
adc #40
sta MEM
lda MEM+1
adc #0
sta MEM+1
jsr copyparams
inx
cpx #24
bne copyloop

rts

swap:

lda MEM
sta CC
lda MEM+1
sta CC+1
lda MEM+2
sta PO
lda MEM+3
sta PO+1

ldy #0
jsr swapone
ldy #1
jsr swapone
ldy #40
jsr swapone
ldy #41
jsr swapone

sec
lda CC
sbc #<54272
sta CC
lda CC+1
sbc #>54272
sta CC+1

sec
lda PO
sbc #<54272
sta PO
lda PO+1
sbc #>54272
sta PO+1

ldy #0
jsr swapone
ldy #1
jsr swapone
ldy #40
jsr swapone
ldy #41
jsr swapone
rts

swapone:

lda (CC),y
pha
lda (PO),y
sta (CC),y
pla
sta (PO),y
rts

restorescreen:
lda #<1024
sta to1+1
lda #>1024
sta to1+2

lda #<51200
sta from1+1
lda #>51200
sta from1+2

lda #<55296
sta to2+1
lda #>55296
sta to2+2

lda #<52224
sta from2+1
lda #>52224
sta from2+2
jmp copyscreen

savescreen:

lda #<1024
sta from1+1
lda #>1024
sta from1+2

lda #<51200
sta to1+1
lda #>51200
sta to1+2

lda #<55296
sta from2+1
lda #>55296
sta from2+2

lda #<52224
sta to2+1
lda #>52224
sta to2+2

copyscreen:

ldy #4
ldx #0

screenloop:

from1:
lda $ffff,x
to1:
sta $ffff,x
from2:
lda $ffff,x
to2:
sta $ffff,x
inx
bne screenloop
inc from1+2
inc from2+2
inc to1+2
inc to2+2
dey
bne screenloop
rts




