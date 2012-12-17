" Vim syntax file
" Maintainer: 	Jochen Bartl <jochen.bartl@gmail.com>
" URL: 		http://verbosemo.de/~lobo/files/grsecurity.vim
" Last Change: 	2008-12-13
" Version: 	0.1
" Contributions: Corey Henderson

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal foldmethod=syntax
syn sync fromstart

syn match grsecComment		/#.*$/
syn keyword grsecStatement	define role_transitions subject
syn match grsecRole		/^role/ contains=grsecRoleFlags
syn match grsecRoleAllowIP	/^role_allow_ip/ contains=grsecIPv4,grsecNM
syn keyword grsecGroupTrans	group_transition_allow
syn keyword grsecUserTrans	user_transition_allow
syn keyword grsecSocketType	stream dgram

syn keyword grsecLinuxCap 	CAP_CHOWN CAP_DAC_OVERRIDE CAP_DAC_READ_SEARCH CAP_FOWNER CAP_FSETID CAP_KILL CAP_SETGID
syn keyword grsecLinuxCap 	CAP_SETUID CAP_SETPCAP CAP_LINUX_IMMUTABLE CAP_NET_BIND_SERVICE CAP_NET_BROADCAST CAP_NET_ADMIN
syn keyword grsecLinuxCap 	CAP_NET_RAW CAP_IPC_LOCK CAP_IPC_OWNER CAP_SYS_MODULE CAP_SYS_RAWIO CAP_SYS_CHROOT CAP_SYS_PTRACE
syn keyword grsecLinuxCap 	CAP_SYS_PACCT CAP_SYS_ADMIN CAP_SYS_BOOT CAP_SYS_NICE CAP_SYS_RESOURCE CAP_SYS_TIME
syn keyword grsecLinuxCap 	CAP_SYS_TTY_CONFIG CAP_MKNOD CAP_LEASE CAP_AUDIT_WRITE CAP_AUDIT_CONTROL CAP_SETFCAP
syn keyword grsecLinuxCap 	CAP_MAC_OVERRIDE CAP_MAC_ADMIN CAP_ALL

syn keyword grsecPaxFlags 	PAX_EMUTRAMP PAX_MPROTECT PAX_PAGEEXEC PAX_RANDMMAP PAX_SEGMEXEC

syn match grsecObjFlags		/\s[acdhilmprstwx]*$/
syn match grsecRoleFlags	/\s[suAG]*$/

syn keyword grsecDis		disabled
syn match grsecIPv4		/\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}/
syn match grsecNM		/\/\d\+/


syn region grsecSubject		start=/{/ end=/}/ transparent fold contains=ALLBUT,grsecRole,grsecStatement,grsecSubject

hi def link grsecLinuxCap	Type
hi def link grsecPaxFlags	Type
hi def link grsecComment	Comment
hi def link grsecDis		Constant
hi def link grsecIPv4		Type
hi def link grsecNM		Constant
hi def link grsecObjFlags	Constant
hi def link grsecRoleFlags	Constant
hi def link grsecRole		Statement
hi def link grsecRoleAllowIP	Statement
hi def link grsecStatement	Statement
hi def link grsecSocketType	Type

hi def link grsecUserTrans	Statement
hi def link grsecGroupTrans	Statement
