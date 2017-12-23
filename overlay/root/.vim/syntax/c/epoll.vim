let s:save_cpo = &cpo
set cpo&vim

if !exists('c_no_posix_struct')
  syntax keyword cPosixStruct epoll_event
endif

if !exists('c_no_posix_constant')
  syntax keyword cPosixConstant EPOLLIN
  syntax keyword cPosixConstant EPOLLOUT
  syntax keyword cPosixConstant EPOLLET
  syntax keyword cPosixConstant EPOLLRDHUP
  syntax keyword cPosixConstant EPOLLPRI
  syntax keyword cPosixConstant EPOLLERR
  syntax keyword cPosixConstant EPOLLHUP
  syntax keyword cPosixConstant EPOLLONESHOT
  syntax keyword cPosixConstant EPOLLWAKEUP
  syntax keyword cPosixConstant EPOLLEXCLUSIVE

  syntax keyword cPosixConstant EPOLL_CTL_ADD
  syntax keyword cPosixConstant EPOLL_CTL_MOD
  syntax keyword cPosixConstant EPOLL_CTL_DEL

  syntax keyword cPosixConstant EPOLL_CLOEXEC
endif

if !exists('c_no_posix_function')
  syntax keyword cPosixFunction epoll_create
  syntax keyword cPosixFunction epoll_create1
  syntax keyword cPosixFunction epoll_ctl
  syntax keyword cPosixFunction epoll_pwait
  syntax keyword cPosixFunction epoll_wait
endif

let &cpo = s:save_cpo
unlet s:save_cpo

