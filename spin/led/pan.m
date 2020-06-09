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

		 /* CLAIM especLed3 */
	case 3: // STATE 1 - _spin_nvr.tmp:25 - [((!(!((start_temp==1)))&&!(flag_timer_led)))] (0:0:0 - 1)
		
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
		if (!(( !( !((now.start_temp==1)))&& !(now.flag_timer_led))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:30 - [(!(flag_timer_led))] (0:0:0 - 1)
		
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
		if (!( !(now.flag_timer_led)))
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

		 /* CLAIM especLed2 */
	case 6: // STATE 1 - _spin_nvr.tmp:14 - [((!(!((((luz==1)&&(flag_timer_led==1))&&botonLed)))&&!(!(luz))))] (0:0:0 - 1)
		
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
		if (!(( !( !((((now.luz==1)&&(now.flag_timer_led==1))&&now.botonLed)))&& !( !(now.luz)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 8 - _spin_nvr.tmp:19 - [(!(!(luz)))] (0:0:0 - 1)
		
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
		if (!( !( !(now.luz))))
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

		 /* CLAIM especLed1 */
	case 9: // STATE 1 - _spin_nvr.tmp:3 - [((!(!(((botonLed==1)&&(flag_timer_led==0))))&&!(luz)))] (0:0:0 - 1)
		
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
		if (!(( !( !(((now.botonLed==1)&&(now.flag_timer_led==0))))&& !(now.luz))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 8 - _spin_nvr.tmp:8 - [(!(luz))] (0:0:0 - 1)
		
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
		if (!( !(now.luz)))
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
	case 12: // STATE 1 - modelLed.pml:43 - [botonLed = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.botonLed;
		now.botonLed = 1;
#ifdef VAR_RANGES
		logval("botonLed", now.botonLed);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 5 - modelLed.pml:46 - [printf('luz: %d ',luz)] (0:0:0 - 3)
		IfNotBlocked
		reached[1][5] = 1;
		Printf("luz: %d ", now.luz);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 6 - modelLed.pml:47 - [printf('boton: %d ',botonLed)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		Printf("boton: %d ", now.botonLed);
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 7 - modelLed.pml:48 - [printf('start_temp: %d',start_temp)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		Printf("start_temp: %d", now.start_temp);
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 8 - modelLed.pml:49 - [printf('flag_temp: %d',flag_timer_led)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		Printf("flag_temp: %d", now.flag_timer_led);
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 9 - modelLed.pml:50 - [printf('estado: %d',estado)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		Printf("estado: %d", ((int)now.estado));
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 10 - modelLed.pml:51 - [printf('t: %d \\n',t)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		Printf("t: %d \n", now.t);
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 14 - modelLed.pml:56 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fsmLed */
	case 20: // STATE 1 - modelLed.pml:16 - [estado = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.estado);
		now.estado = 0;
#ifdef VAR_RANGES
		logval("estado", ((int)now.estado));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 2 - modelLed.pml:18 - [((estado==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((int)now.estado)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 3 - modelLed.pml:20 - [((botonLed==1))] (26:0:5 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((now.botonLed==1)))
			continue;
		/* merge: estado = 1(26, 4, 26) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(5);
		(trpt+1)->bup.ovals[0] = ((int)now.estado);
		now.estado = 1;
#ifdef VAR_RANGES
		logval("estado", ((int)now.estado));
#endif
		;
		/* merge: start_temp = 1(26, 5, 26) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[1] = now.start_temp;
		now.start_temp = 1;
#ifdef VAR_RANGES
		logval("start_temp", now.start_temp);
#endif
		;
		/* merge: luz = 1(26, 6, 26) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[2] = now.luz;
		now.luz = 1;
#ifdef VAR_RANGES
		logval("luz", now.luz);
#endif
		;
		/* merge: botonLed = 0(26, 7, 26) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[3] = now.botonLed;
		now.botonLed = 0;
#ifdef VAR_RANGES
		logval("botonLed", now.botonLed);
#endif
		;
		/* merge: t = 0(26, 8, 26) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[4] = now.t;
		now.t = 0;
#ifdef VAR_RANGES
		logval("t", now.t);
#endif
		;
		/* merge: .(goto)(26, 10, 26) */
		reached[0][10] = 1;
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[0][27] = 1;
		;
		_m = 3; goto P999; /* 7 */
	case 23: // STATE 12 - modelLed.pml:28 - [((estado==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (!((((int)now.estado)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 13 - modelLed.pml:30 - [((t==3))] (26:0:2 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((now.t==3)))
			continue;
		/* merge: flag_timer_led = 1(26, 14, 26) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.flag_timer_led;
		now.flag_timer_led = 1;
#ifdef VAR_RANGES
		logval("flag_timer_led", now.flag_timer_led);
#endif
		;
		/* merge: t = 0(26, 15, 26) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = now.t;
		now.t = 0;
#ifdef VAR_RANGES
		logval("t", now.t);
#endif
		;
		/* merge: .(goto)(26, 24, 26) */
		reached[0][24] = 1;
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[0][27] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 25: // STATE 24 - modelLed.pml:35 - [.(goto)] (0:26:0 - 3)
		IfNotBlocked
		reached[0][24] = 1;
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[0][27] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 26: // STATE 16 - modelLed.pml:31 - [((t<3))] (26:0:1 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!((now.t<3)))
			continue;
		/* merge: t = (t+1)(26, 17, 26) */
		reached[0][17] = 1;
		(trpt+1)->bup.oval = now.t;
		now.t = (now.t+1);
#ifdef VAR_RANGES
		logval("t", now.t);
#endif
		;
		/* merge: .(goto)(26, 24, 26) */
		reached[0][24] = 1;
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[0][27] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 27: // STATE 18 - modelLed.pml:32 - [((flag_timer_led==1))] (26:0:4 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (!((now.flag_timer_led==1)))
			continue;
		/* merge: flag_timer_led = 0(26, 19, 26) */
		reached[0][19] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.flag_timer_led;
		now.flag_timer_led = 0;
#ifdef VAR_RANGES
		logval("flag_timer_led", now.flag_timer_led);
#endif
		;
		/* merge: luz = 0(26, 20, 26) */
		reached[0][20] = 1;
		(trpt+1)->bup.ovals[1] = now.luz;
		now.luz = 0;
#ifdef VAR_RANGES
		logval("luz", now.luz);
#endif
		;
		/* merge: estado = 0(26, 21, 26) */
		reached[0][21] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.estado);
		now.estado = 0;
#ifdef VAR_RANGES
		logval("estado", ((int)now.estado));
#endif
		;
		/* merge: start_temp = 0(26, 22, 26) */
		reached[0][22] = 1;
		(trpt+1)->bup.ovals[3] = now.start_temp;
		now.start_temp = 0;
#ifdef VAR_RANGES
		logval("start_temp", now.start_temp);
#endif
		;
		/* merge: .(goto)(26, 24, 26) */
		reached[0][24] = 1;
		;
		/* merge: .(goto)(0, 27, 26) */
		reached[0][27] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 28: // STATE 29 - modelLed.pml:37 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][29] = 1;
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

