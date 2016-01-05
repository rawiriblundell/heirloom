/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License, Version 1.0 only
 * (the "License").  You may not use this file except in compliance
 * with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
/*	Copyright (c) 1984, 1986, 1987, 1988, 1989 AT&T	*/
/*	  All Rights Reserved  	*/


/*
 * Copyright (c) 1999, by Sun Microsystems, Inc.
 * All rights reserved.
 */

/* This is a private header file.				*/

#ifndef _LIBMAIL_H
#define _LIBMAIL_H

/*	from OpenSolaris "libmail.h	1.6	05/06/08 SMI" 	 SVr4.0 1.4		*/

/*
 * Portions Copyright (c) 2005 Gunnar Ritter, Freiburg i. Br., Germany
 *
 * Sccsid @(#)libmail.h	1.4 (gritter) 6/18/05
 */

#include <stdio.h>
#include "maillock.h"
#include "s_string.h"

#ifndef	MFMODE
#define	MFMODE		0660		/* create mode for `/var/mail' files */
#endif
#ifdef	FILENAME_MAX
#define	MAXFILENAME	FILENAME_MAX	/* max length of a filename */
#else
#define	MAXFILENAME	512		/* max length of a filename */
#endif

#include <sys/types.h>

extern	string *abspath(char *path, char *dot, string *to);
extern	int casncmp(char *s1, char *s2, ssize_t n);
extern	int copystream(FILE *infp, FILE *outfp);
extern	int delempty(mode_t m, char *mailname);
extern	char *maildomain(void);
extern	void notify(char *user, char *msg, int check_mesg_y, char *etcdir);
extern	int pclosevp(FILE *fp);
extern	FILE *popenvp(char *file, char **argv, char *mode, int resetid);
extern	char **setup_exec(char *s);
extern	char *skipspace(char *p);
extern	int substr(char *string1, char *string2);
extern	void strmove(char *from, char *to);
extern	pid_t systemvp(char *file, char **argv, int resetid);
extern	void trimnl(char *s);
extern	char *Xgetenv(char *env);
extern	char *xgetenv(char *env);
extern	int xsetenv(char *file);

#endif /* _LIBMAIL_H */
