#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM espec3 */
	case 3: // STATE 1 - _spin_nvr.tmp:25 - [((!(!((((pulsaciones==codigo[2])&&(posicion==2))&&(flag_t==1))))&&!(codigo_ok)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][1] = 1;
		if (!(( !( !((((now.pulsaciones==now.codigo[2])&&(now.posicion==2))&&(now.flag_t==1))))&& !(now.codigo_ok))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:30 - [(!(codigo_ok))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][8] = 1;
		if (!( !(now.codigo_ok)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 13 - _spin_nvr.tmp:32 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM espec2 */
	case 6: // STATE 1 - _spin_nvr.tmp:14 - [((!(!((pulsaciones>codigo[posicion])))&&!(codigo_err)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][1] = 1;
		if (!(( !( !((now.pulsaciones>now.codigo[ Index(now.posicion, 3) ])))&& !(now.codigo_err))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 8 - _spin_nvr.tmp:19 - [(!(codigo_err))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][8] = 1;
		if (!( !(now.codigo_err)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 13 - _spin_nvr.tmp:21 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[3][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM espec1 */
	case 9: // STATE 1 - _spin_nvr.tmp:3 - [((!(!((boton==1)))&&!((estado==1))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!(( !( !((now.boton==1)))&& !((now.estado==1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - _spin_nvr.tmp:8 - [(!((estado==1)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][8] = 1;
		if (!( !((now.estado==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC entorno */
	case 12: // STATE 1 - modelAlarma.pml:87 - [boton = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.boton;
		now.boton = 1;
#ifdef VAR_RANGES
		logval("boton", now.boton);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 5 - modelAlarma.pml:90 - [printf('boton: %d ',boton)] (0:0:0 - 3)
		IfNotBlocked
		reached[1][5] = 1;
		Printf("boton: %d ", now.boton);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 6 - modelAlarma.pml:91 - [printf('start_temp: %d ',start_t)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		Printf("start_temp: %d ", now.start_t);
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 7 - modelAlarma.pml:92 - [printf('flag_temp: %d \\n',flag_t)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		Printf("flag_temp: %d \n", now.flag_t);
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 8 - modelAlarma.pml:93 - [printf('codigo: %d',codigo[posicion])] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		Printf("codigo: %d", now.codigo[ Index(now.posicion, 3) ]);
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 9 - modelAlarma.pml:95 - [printf('estado: %d',estado)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		Printf("estado: %d", now.estado);
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 10 - modelAlarma.pml:96 - [printf('t: %d',t)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		Printf("t: %d", now.t);
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 11 - modelAlarma.pml:97 - [printf('posicion: %d',posicion)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		Printf("posicion: %d", now.posicion);
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 12 - modelAlarma.pml:98 - [printf('pulsaciones: %d \\n \\n',pulsaciones)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		Printf("pulsaciones: %d \n \n", now.pulsaciones);
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 16 - modelAlarma.pml:101 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fsmAlarma */
	case 22: // STATE 1 - modelAlarma.pml:24 - [estado = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.estado;
		now.estado = 0;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 2 - modelAlarma.pml:28 - [((estado==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((now.estado==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 3 - modelAlarma.pml:30 - [((boton==1))] (55:0:6 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((now.boton==1)))
			continue;
		/* merge: pulsaciones = 1(55, 4, 55) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = now.pulsaciones;
		now.pulsaciones = 1;
#ifdef VAR_RANGES
		logval("pulsaciones", now.pulsaciones);
#endif
		;
		/* merge: boton = 0(55, 5, 55) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[1] = now.boton;
		now.boton = 0;
#ifdef VAR_RANGES
		logval("boton", now.boton);
#endif
		;
		/* merge: start_t = 1(55, 6, 55) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[2] = now.start_t;
		now.start_t = 1;
#ifdef VAR_RANGES
		logval("start_t", now.start_t);
#endif
		;
		/* merge: codigo_err = 0(55, 7, 55) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[3] = now.codigo_err;
		now.codigo_err = 0;
#ifdef VAR_RANGES
		logval("codigo_err", now.codigo_err);
#endif
		;
		/* merge: codigo_ok = 0(55, 8, 55) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[4] = now.codigo_ok;
		now.codigo_ok = 0;
#ifdef VAR_RANGES
		logval("codigo_ok", now.codigo_ok);
#endif
		;
		/* merge: estado = 1(55, 9, 55) */
		reached[0][9] = 1;
		(trpt+1)->bup.ovals[5] = now.estado;
		now.estado = 1;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 11, 55) */
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 8 */
	case 25: // STATE 13 - modelAlarma.pml:39 - [((estado==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((now.estado==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 14 - modelAlarma.pml:41 - [((((flag_t==1)&&(pulsaciones==codigo[posicion]))&&(posicion<2)))] (55:0:4 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (!((((now.flag_t==1)&&(now.pulsaciones==now.codigo[ Index(now.posicion, 3) ]))&&(now.posicion<2))))
			continue;
		/* merge: posicion = (posicion+1)(55, 15, 55) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.posicion;
		now.posicion = (now.posicion+1);
#ifdef VAR_RANGES
		logval("posicion", now.posicion);
#endif
		;
		/* merge: flag_t = 0(55, 16, 55) */
		reached[0][16] = 1;
		(trpt+1)->bup.ovals[1] = now.flag_t;
		now.flag_t = 0;
#ifdef VAR_RANGES
		logval("flag_t", now.flag_t);
#endif
		;
		/* merge: pulsaciones = 0(55, 17, 55) */
		reached[0][17] = 1;
		(trpt+1)->bup.ovals[2] = now.pulsaciones;
		now.pulsaciones = 0;
#ifdef VAR_RANGES
		logval("pulsaciones", now.pulsaciones);
#endif
		;
		/* merge: estado = 1(55, 18, 55) */
		reached[0][18] = 1;
		(trpt+1)->bup.ovals[3] = now.estado;
		now.estado = 1;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 27: // STATE 53 - modelAlarma.pml:77 - [.(goto)] (0:55:0 - 7)
		IfNotBlocked
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 28: // STATE 19 - modelAlarma.pml:47 - [(((boton==1)&&(pulsaciones<codigo[posicion])))] (55:0:5 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!(((now.boton==1)&&(now.pulsaciones<now.codigo[ Index(now.posicion, 3) ]))))
			continue;
		/* merge: pulsaciones = (pulsaciones+1)(55, 20, 55) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = now.pulsaciones;
		now.pulsaciones = (now.pulsaciones+1);
#ifdef VAR_RANGES
		logval("pulsaciones", now.pulsaciones);
#endif
		;
		/* merge: start_t = 1(55, 21, 55) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[1] = now.start_t;
		now.start_t = 1;
#ifdef VAR_RANGES
		logval("start_t", now.start_t);
#endif
		;
		/* merge: boton = 0(55, 22, 55) */
		reached[0][22] = 1;
		(trpt+1)->bup.ovals[2] = now.boton;
		now.boton = 0;
#ifdef VAR_RANGES
		logval("boton", now.boton);
#endif
		;
		/* merge: flag_t = 0(55, 23, 55) */
		reached[0][23] = 1;
		(trpt+1)->bup.ovals[3] = now.flag_t;
		now.flag_t = 0;
#ifdef VAR_RANGES
		logval("flag_t", now.flag_t);
#endif
		;
		/* merge: estado = 1(55, 24, 55) */
		reached[0][24] = 1;
		(trpt+1)->bup.ovals[4] = now.estado;
		now.estado = 1;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 7 */
	case 29: // STATE 25 - modelAlarma.pml:53 - [(((((boton==1)&&(pulsaciones==codigo[posicion]))&&(flag_t==0))||((flag_t==1)&&(pulsaciones<codigo[posicion]))))] (55:0:6 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!(((((now.boton==1)&&(now.pulsaciones==now.codigo[ Index(now.posicion, 3) ]))&&(now.flag_t==0))||((now.flag_t==1)&&(now.pulsaciones<now.codigo[ Index(now.posicion, 3) ])))))
			continue;
		/* merge: posicion = 0(55, 26, 55) */
		reached[0][26] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = now.posicion;
		now.posicion = 0;
#ifdef VAR_RANGES
		logval("posicion", now.posicion);
#endif
		;
		/* merge: pulsaciones = 0(55, 27, 55) */
		reached[0][27] = 1;
		(trpt+1)->bup.ovals[1] = now.pulsaciones;
		now.pulsaciones = 0;
#ifdef VAR_RANGES
		logval("pulsaciones", now.pulsaciones);
#endif
		;
		/* merge: boton = 0(55, 28, 55) */
		reached[0][28] = 1;
		(trpt+1)->bup.ovals[2] = now.boton;
		now.boton = 0;
#ifdef VAR_RANGES
		logval("boton", now.boton);
#endif
		;
		/* merge: flag_t = 0(55, 29, 55) */
		reached[0][29] = 1;
		(trpt+1)->bup.ovals[3] = now.flag_t;
		now.flag_t = 0;
#ifdef VAR_RANGES
		logval("flag_t", now.flag_t);
#endif
		;
		/* merge: codigo_err = 1(55, 30, 55) */
		reached[0][30] = 1;
		(trpt+1)->bup.ovals[4] = now.codigo_err;
		now.codigo_err = 1;
#ifdef VAR_RANGES
		logval("codigo_err", now.codigo_err);
#endif
		;
		/* merge: printf('codigo erroneo \\n')(55, 31, 55) */
		reached[0][31] = 1;
		Printf("codigo erroneo \n");
		/* merge: estado = 0(55, 32, 55) */
		reached[0][32] = 1;
		(trpt+1)->bup.ovals[5] = now.estado;
		now.estado = 0;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 9 */
	case 30: // STATE 33 - modelAlarma.pml:62 - [((((flag_t==1)&&(pulsaciones==codigo[posicion]))&&(posicion==2)))] (55:0:6 - 1)
		IfNotBlocked
		reached[0][33] = 1;
		if (!((((now.flag_t==1)&&(now.pulsaciones==now.codigo[ Index(now.posicion, 3) ]))&&(now.posicion==2))))
			continue;
		/* merge: posicion = 0(55, 34, 55) */
		reached[0][34] = 1;
		(trpt+1)->bup.ovals = grab_ints(6);
		(trpt+1)->bup.ovals[0] = now.posicion;
		now.posicion = 0;
#ifdef VAR_RANGES
		logval("posicion", now.posicion);
#endif
		;
		/* merge: pulsaciones = 0(55, 35, 55) */
		reached[0][35] = 1;
		(trpt+1)->bup.ovals[1] = now.pulsaciones;
		now.pulsaciones = 0;
#ifdef VAR_RANGES
		logval("pulsaciones", now.pulsaciones);
#endif
		;
		/* merge: flag_t = 0(55, 36, 55) */
		reached[0][36] = 1;
		(trpt+1)->bup.ovals[2] = now.flag_t;
		now.flag_t = 0;
#ifdef VAR_RANGES
		logval("flag_t", now.flag_t);
#endif
		;
		/* merge: codigo_ok = 1(55, 37, 55) */
		reached[0][37] = 1;
		(trpt+1)->bup.ovals[3] = now.codigo_ok;
		now.codigo_ok = 1;
#ifdef VAR_RANGES
		logval("codigo_ok", now.codigo_ok);
#endif
		;
		/* merge: boton = 0(55, 38, 55) */
		reached[0][38] = 1;
		(trpt+1)->bup.ovals[4] = now.boton;
		now.boton = 0;
#ifdef VAR_RANGES
		logval("boton", now.boton);
#endif
		;
		/* merge: printf('codigo correcto \\n')(55, 39, 55) */
		reached[0][39] = 1;
		Printf("codigo correcto \n");
		/* merge: estado = 0(55, 40, 55) */
		reached[0][40] = 1;
		(trpt+1)->bup.ovals[5] = now.estado;
		now.estado = 0;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 9 */
	case 31: // STATE 41 - modelAlarma.pml:72 - [(((t==0)&&(start_t==1)))] (55:0:3 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!(((now.t==0)&&(now.start_t==1))))
			continue;
		/* merge: start_t = 0(55, 42, 55) */
		reached[0][42] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.start_t;
		now.start_t = 0;
#ifdef VAR_RANGES
		logval("start_t", now.start_t);
#endif
		;
		/* merge: t = 1(55, 43, 55) */
		reached[0][43] = 1;
		(trpt+1)->bup.ovals[1] = now.t;
		now.t = 1;
#ifdef VAR_RANGES
		logval("t", now.t);
#endif
		;
		/* merge: estado = 1(55, 44, 55) */
		reached[0][44] = 1;
		(trpt+1)->bup.ovals[2] = now.estado;
		now.estado = 1;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 32: // STATE 45 - modelAlarma.pml:73 - [((t==10))] (55:0:3 - 1)
		IfNotBlocked
		reached[0][45] = 1;
		if (!((now.t==10)))
			continue;
		/* merge: flag_t = 1(55, 46, 55) */
		reached[0][46] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.flag_t;
		now.flag_t = 1;
#ifdef VAR_RANGES
		logval("flag_t", now.flag_t);
#endif
		;
		/* merge: t = 0(55, 47, 55) */
		reached[0][47] = 1;
		(trpt+1)->bup.ovals[1] = now.t;
		now.t = 0;
#ifdef VAR_RANGES
		logval("t", now.t);
#endif
		;
		/* merge: estado = 1(55, 48, 55) */
		reached[0][48] = 1;
		(trpt+1)->bup.ovals[2] = now.estado;
		now.estado = 1;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 33: // STATE 49 - modelAlarma.pml:74 - [(((t<10)&&(t>0)))] (55:0:2 - 1)
		IfNotBlocked
		reached[0][49] = 1;
		if (!(((now.t<10)&&(now.t>0))))
			continue;
		/* merge: t = (t+1)(55, 50, 55) */
		reached[0][50] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.t;
		now.t = (now.t+1);
#ifdef VAR_RANGES
		logval("t", now.t);
#endif
		;
		/* merge: estado = 1(55, 51, 55) */
		reached[0][51] = 1;
		(trpt+1)->bup.ovals[1] = now.estado;
		now.estado = 1;
#ifdef VAR_RANGES
		logval("estado", now.estado);
#endif
		;
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 34: // STATE 58 - modelAlarma.pml:80 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][58] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

