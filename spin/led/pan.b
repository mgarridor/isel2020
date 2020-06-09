	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM especLed3 */
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

		 /* CLAIM especLed2 */
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

		 /* CLAIM especLed1 */
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
		now.botonLed = trpt->bup.oval;
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
		
	case 19: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC fsmLed */

	case 20: // STATE 1
		;
		now.estado = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 22: // STATE 8
		;
		now.t = trpt->bup.ovals[4];
		now.botonLed = trpt->bup.ovals[3];
		now.luz = trpt->bup.ovals[2];
		now.start_temp = trpt->bup.ovals[1];
		now.estado = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 5);
		goto R999;
;
		;
		
	case 24: // STATE 15
		;
		now.t = trpt->bup.ovals[1];
		now.flag_timer_led = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		
	case 25: // STATE 24
		goto R999;

	case 26: // STATE 17
		;
		now.t = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 22
		;
		now.start_temp = trpt->bup.ovals[3];
		now.estado = trpt->bup.ovals[2];
		now.luz = trpt->bup.ovals[1];
		now.flag_timer_led = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 28: // STATE 29
		;
		p_restor(II);
		;
		;
		goto R999;
	}

