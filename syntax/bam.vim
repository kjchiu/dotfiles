" Vim syntax file
" Language:	BAM protocol
"

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case match

syn keyword Type boolean int long string array
syn keyword Keyword inner message extends protocol

syn region BlockComment start="/\*" end="\*/"
syn region LineComment start="//" end="\n"

if version >= 508 || !exists("did_bam_syntax_inits")
	let did_bam_syntax_inits = 1

	hi def link LineComment Comment
	hi def link BlockComment Comment
endif

let b:current_syntax="bam"
syn sync fromstart

