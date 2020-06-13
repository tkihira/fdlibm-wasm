#
#  @(#)Makefile 1.4 95/01/18 
# 
#  ====================================================
#  Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
# 
#  Developed at SunSoft, a Sun Microsystems, Inc. business.
#  Permission to use, copy, modify, and distribute this
#  software is freely granted, provided that this notice 
#  is preserved.
#  ====================================================
# 
# 

#
# There are two options in making libm at fdlibm compile time:
# 	_IEEE_LIBM 	--- IEEE libm; smaller, and somewhat faster
#	_MULTI_LIBM	--- Support multi-standard at runtime by 
#			    imposing wrapper functions defined in 
#			    fdlibm.h:
#				_IEEE_MODE 	-- IEEE
#				_XOPEN_MODE 	-- X/OPEN
#				_POSIX_MODE 	-- POSIX/ANSI
#				_SVID3_MODE 	-- SVID
#
# Here is how to set up CFLAGS to create the desired libm at 
# compile time:
#
# 	CFLAGS = -D_IEEE_LIBM		... IEEE libm (recommended)
#	CFLAGS = -D_SVID3_MODE	... Multi-standard supported
#					    libm with SVID as the 
#					    default standard
#	CFLAGS = -D_XOPEN_MODE	... Multi-standard supported
#					    libm with XOPEN as the 
#					    default standard
#	CFLAGS = -D_POSIX_MODE	... Multi-standard supported
#					    libm with POSIX as the 
#					    default standard
#	CFLAGS = 			... Multi-standard supported
#					    libm with IEEE as the 
#					    default standard
# 
# NOTE: if scalb's second arguement is an int, then one must
# define _SCALB_INT in CFLAGS. The default prototype of scalb
# is double scalb(double, double)
#


#
# Default IEEE libm
#
CFLAGS = -O2 -D_IEEE_LIBM -D__LITTLE_ENDIAN

CC = clang

INCFILES = fdlibm.h
.INIT: $(INCFILES)
.KEEP_STATE:
src = 	fdlibm/k_rem_pio2.c \
	fdlibm/k_cos.c fdlibm/k_sin.c fdlibm/k_tan.c \
	fdlibm/e_acos.c fdlibm/e_acosh.c fdlibm/e_asin.c fdlibm/e_atan2.c \
	fdlibm/e_atanh.c fdlibm/e_cosh.c fdlibm/e_exp.c fdlibm/e_fmod.c \
	fdlibm/e_gamma.c fdlibm/e_gamma_r.c fdlibm/e_hypot.c fdlibm/e_j0.c \
	fdlibm/e_j1.c fdlibm/e_jn.c fdlibm/e_lgamma.c fdlibm/e_lgamma_r.c \
	fdlibm/e_log.c fdlibm/e_log10.c fdlibm/e_pow.c fdlibm/e_rem_pio2.c fdlibm/e_remainder.c \
	fdlibm/e_scalb.c fdlibm/e_sinh.c fdlibm/e_sqrt.c \
	fdlibm/w_acos.c fdlibm/w_acosh.c fdlibm/w_asin.c fdlibm/w_atan2.c \
	fdlibm/w_atanh.c fdlibm/w_cosh.c fdlibm/w_exp.c fdlibm/w_fmod.c \
	fdlibm/w_gamma.c fdlibm/w_gamma_r.c fdlibm/w_hypot.c fdlibm/w_j0.c \
	fdlibm/w_j1.c fdlibm/w_jn.c fdlibm/w_lgamma.c fdlibm/w_lgamma_r.c \
	fdlibm/w_log.c fdlibm/w_log10.c fdlibm/w_pow.c fdlibm/w_remainder.c \
	fdlibm/w_sinh.c fdlibm/w_sqrt.c \
	fdlibm/s_asinh.c fdlibm/s_atan.c fdlibm/s_cbrt.c fdlibm/s_ceil.c fdlibm/s_copysign.c \
	fdlibm/s_cos.c fdlibm/s_erf.c fdlibm/s_expm1.c fdlibm/s_fabs.c fdlibm/s_finite.c fdlibm/s_floor.c \
	fdlibm/s_frexp.c fdlibm/s_ilogb.c fdlibm/s_isnan.c fdlibm/s_lib_version.c \
	fdlibm/s_log1p.c fdlibm/s_logb.c fdlibm/s_matherr.c fdlibm/s_modf.c fdlibm/s_nextafter.c \
	fdlibm/s_rint.c fdlibm/s_scalbn.c fdlibm/s_signgam.c fdlibm/s_significand.c fdlibm/s_sin.c \
	fdlibm/s_tan.c fdlibm/s_tanh.c

obj = 	fdlibm/k_rem_pio2.o \
	fdlibm/k_cos.o fdlibm/k_sin.o fdlibm/k_tan.o \
	fdlibm/e_acos.o fdlibm/e_acosh.o fdlibm/e_asin.o fdlibm/e_atan2.o \
	fdlibm/e_atanh.o fdlibm/e_cosh.o fdlibm/e_exp.o fdlibm/e_fmod.o \
	fdlibm/e_gamma.o fdlibm/e_gamma_r.o fdlibm/e_hypot.o fdlibm/e_j0.o \
	fdlibm/e_j1.o fdlibm/e_jn.o fdlibm/e_lgamma.o fdlibm/e_lgamma_r.o \
	fdlibm/e_log.o fdlibm/e_log10.o fdlibm/e_pow.o fdlibm/e_rem_pio2.o fdlibm/e_remainder.o \
	fdlibm/e_scalb.o fdlibm/e_sinh.o fdlibm/e_sqrt.o \
	fdlibm/w_acos.o fdlibm/w_acosh.o fdlibm/w_asin.o fdlibm/w_atan2.o \
	fdlibm/w_atanh.o fdlibm/w_cosh.o fdlibm/w_exp.o fdlibm/w_fmod.o \
	fdlibm/w_gamma.o fdlibm/w_gamma_r.o fdlibm/w_hypot.o fdlibm/w_j0.o \
	fdlibm/w_j1.o fdlibm/w_jn.o fdlibm/w_lgamma.o fdlibm/w_lgamma_r.o \
	fdlibm/w_log.o fdlibm/w_log10.o fdlibm/w_pow.o fdlibm/w_remainder.o \
	fdlibm/w_sinh.o fdlibm/w_sqrt.o \
	fdlibm/s_asinh.o fdlibm/s_atan.o fdlibm/s_cbrt.o fdlibm/s_ceil.o fdlibm/s_copysign.o \
	fdlibm/s_cos.o fdlibm/s_erf.o fdlibm/s_expm1.o fdlibm/s_fabs.o fdlibm/s_finite.o fdlibm/s_floor.o \
	fdlibm/s_frexp.o fdlibm/s_ilogb.o fdlibm/s_isnan.o fdlibm/s_lib_version.o \
	fdlibm/s_log1p.o fdlibm/s_logb.o fdlibm/s_matherr.o fdlibm/s_modf.o fdlibm/s_nextafter.o \
	fdlibm/s_rint.o fdlibm/s_scalbn.o fdlibm/s_signgam.o fdlibm/s_significand.o fdlibm/s_sin.o \
	fdlibm/s_tan.o fdlibm/s_tanh.o

all: libm.wasm 

libm.wasm : $(obj) 
	wasm-ld --no-entry --export=acos --export=acosh --export=asin --export=asinh --export=atan --export=atan2 --export=atanh \
	        --export=cbrt --export=ceil --export=cos --export=cosh --export=exp --export=expm1 --export=floor \
			--export=hypot --export=log --export=log1p --export=log10 --export=pow \
			--export=sin --export=sinh --export=sqrt --export=tan --export=tanh \
	        -o libm.wasm $(obj)

source: $(src) README

clean: 
	/bin/rm -f $(obj) libm.wasm