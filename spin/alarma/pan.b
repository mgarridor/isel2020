	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM espec3 */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM espec2 */
;
		;
		;
		;
		
	case 8: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM espec1 */
;
		;
		;
		;
		
	case 11: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC entorno */

	case 12: // STATE 1
		;
		now.boton = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 21: // STATE 16
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC fsmAlarma */

	case 22: // STATE 1
		;
		now.estado = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 24: // STATE 9
		;
		now.estado = trpt->bup.ovals[5];
		now.codigo_ok = trpt->bup.ovals[4];
		now.codigo_err = trpt->bup.ovals[3];
		now.start_t = trpt->bup.ovals[2];
		now.boton = trpt->bup.ovals[1];
		now.pulsaciones = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;
;
		;
		
	case 26: // STATE 18
		;
		now.estado = trpt->bup.ovals[3];
		now.pulsaciones = trpt->bup.ovals[2];
		now.flag_t = trpt->bup.ovals[1];
		now.posicion = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		
	case 27: // STATE 53
		goto R999;

	case 28: // STATE 24
		;
		now.estado = trpt->bup.ovals[4];
		now.flag_t = trpt->bup.ovals[3];
		now.boton = trpt->bup.ovals[2];
		now.start_t = trpt->bup.ovals[1];
		now.pulsaciones = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;

	case 29: // STATE 32
		;
		now.estado = trpt->bup.ovals[5];
		now.codigo_err = trpt->bup.ovals[4];
		now.flag_t = trpt->bup.ovals[3];
		now.boton = trpt->bup.ovals[2];
		now.pulsaciones = trpt->bup.ovals[1];
		now.posicion = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 30: // STATE 40
		;
		now.estado = trpt->bup.ovals[5];
		now.boton = trpt->bup.ovals[4];
		now.codigo_ok = trpt->bup.ovals[3];
		now.flag_t = trpt->bup.ovals[2];
		now.pulsaciones = trpt->bup.ovals[1];
		now.posicion = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 6);
		goto R999;

	case 31: // STATE 44
		;
		now.estado = trpt->bup.ovals[2];
		now.t = trpt->bup.ovals[1];
		now.start_t = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 32: // STATE 48
		;
		now.estado = trpt->bup.ovals[2];
		now.t = trpt->bup.ovals[1];
		now.flag_t = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 33: // STATE 51
		;
		now.estado = trpt->bup.ovals[1];
		now.t = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 34: // STATE 58
		;
		p_restor(II);
		;
		;
		goto R999;
	}

