/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/griseous/Documents/csse232/Milestone5/ALU_Control.v";
static int ng1[] = {0, 0};
static const char *ng2 = "add";
static unsigned int ng3[] = {1U, 0U};
static const char *ng4 = "sub";
static unsigned int ng5[] = {2U, 0U};
static const char *ng6 = "or";
static unsigned int ng7[] = {3U, 0U};
static const char *ng8 = "and";
static unsigned int ng9[] = {4U, 0U};
static const char *ng10 = "sl";
static unsigned int ng11[] = {5U, 0U};
static const char *ng12 = "srl";
static unsigned int ng13[] = {6U, 0U};
static const char *ng14 = "sra";
static unsigned int ng15[] = {7U, 0U};
static const char *ng16 = "slt";
static int ng17[] = {2, 0};
static int ng18[] = {3, 0};
static int ng19[] = {4, 0};
static int ng20[] = {5, 0};
static int ng21[] = {6, 0};
static int ng22[] = {7, 0};



static void Always_36_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 3608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 3928);
    *((int *)t2) = 1;
    t3 = (t0 + 3640);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);

LAB5:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 2136U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng20)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng22)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 32);
    if (t6 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(40, ng0);

LAB24:    xsi_set_current_line(41, ng0);
    t7 = (t0 + 2296U);
    t8 = *((char **)t7);

LAB25:    t7 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 3, t7, 32);
    if (t9 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 3, t2, 32);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 3, t2, 32);
    if (t6 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 3, t2, 32);
    if (t6 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 3, t2, 32);
    if (t6 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 3, t2, 32);
    if (t6 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 3, t2, 32);
    if (t6 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 3, t2, 32);
    if (t6 == 1)
        goto LAB40;

LAB41:
LAB42:    goto LAB23;

LAB9:    xsi_set_current_line(85, ng0);

LAB51:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 2296U);
    t4 = *((char **)t3);

LAB52:    t3 = ((char*)((ng9)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 3, t3, 3);
    if (t9 == 1)
        goto LAB53;

LAB54:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t6 == 1)
        goto LAB55;

LAB56:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t6 == 1)
        goto LAB57;

LAB58:
LAB59:    goto LAB23;

LAB11:    xsi_set_current_line(104, ng0);
    t3 = (t0 + 744);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    goto LAB23;

LAB13:    xsi_set_current_line(105, ng0);
    t3 = (t0 + 880);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    goto LAB23;

LAB15:    xsi_set_current_line(106, ng0);
    t3 = (t0 + 1016);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    goto LAB23;

LAB17:    xsi_set_current_line(107, ng0);
    t3 = (t0 + 1152);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    goto LAB23;

LAB19:    xsi_set_current_line(108, ng0);
    t3 = (t0 + 1288);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    goto LAB23;

LAB21:    xsi_set_current_line(109, ng0);
    t3 = (t0 + 1424);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    goto LAB23;

LAB26:    xsi_set_current_line(43, ng0);

LAB43:    xsi_set_current_line(44, ng0);
    t10 = (t0 + 744);
    t11 = *((char **)t10);
    t10 = (t0 + 2696);
    xsi_vlogvar_assign_value(t10, t11, 0, 0, 3);
    xsi_set_current_line(45, ng0);
    xsi_vlogfile_write(1, 0, 0, ng2, 1, t0);
    goto LAB42;

LAB28:    xsi_set_current_line(48, ng0);

LAB44:    xsi_set_current_line(49, ng0);
    t3 = (t0 + 880);
    t4 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(50, ng0);
    xsi_vlogfile_write(1, 0, 0, ng4, 1, t0);
    goto LAB42;

LAB30:    xsi_set_current_line(53, ng0);

LAB45:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 608);
    t4 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(55, ng0);
    xsi_vlogfile_write(1, 0, 0, ng6, 1, t0);
    goto LAB42;

LAB32:    xsi_set_current_line(58, ng0);

LAB46:    xsi_set_current_line(59, ng0);
    t3 = (t0 + 472);
    t4 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(60, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    goto LAB42;

LAB34:    xsi_set_current_line(63, ng0);

LAB47:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1016);
    t4 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(65, ng0);
    xsi_vlogfile_write(1, 0, 0, ng10, 1, t0);
    goto LAB42;

LAB36:    xsi_set_current_line(68, ng0);

LAB48:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1152);
    t4 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(70, ng0);
    xsi_vlogfile_write(1, 0, 0, ng12, 1, t0);
    goto LAB42;

LAB38:    xsi_set_current_line(73, ng0);

LAB49:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 1288);
    t4 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(75, ng0);
    xsi_vlogfile_write(1, 0, 0, ng14, 1, t0);
    goto LAB42;

LAB40:    xsi_set_current_line(78, ng0);

LAB50:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 1424);
    t4 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 3);
    xsi_set_current_line(80, ng0);
    xsi_vlogfile_write(1, 0, 0, ng16, 1, t0);
    goto LAB42;

LAB53:    xsi_set_current_line(88, ng0);

LAB60:    xsi_set_current_line(89, ng0);
    t7 = (t0 + 1016);
    t10 = *((char **)t7);
    t7 = (t0 + 2696);
    xsi_vlogvar_assign_value(t7, t10, 0, 0, 3);
    xsi_set_current_line(90, ng0);
    xsi_vlogfile_write(1, 0, 0, ng10, 1, t0);
    goto LAB59;

LAB55:    xsi_set_current_line(93, ng0);

LAB61:    xsi_set_current_line(94, ng0);
    t3 = (t0 + 1152);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    xsi_set_current_line(95, ng0);
    xsi_vlogfile_write(1, 0, 0, ng12, 1, t0);
    goto LAB59;

LAB57:    xsi_set_current_line(98, ng0);

LAB62:    xsi_set_current_line(99, ng0);
    t3 = (t0 + 1288);
    t7 = *((char **)t3);
    t3 = (t0 + 2696);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 3);
    xsi_set_current_line(100, ng0);
    xsi_vlogfile_write(1, 0, 0, ng14, 1, t0);
    goto LAB59;

}


extern void work_m_03761491249994435487_3148384703_init()
{
	static char *pe[] = {(void *)Always_36_0};
	xsi_register_didat("work_m_03761491249994435487_3148384703", "isim/test_ALUControl_isim_beh.exe.sim/work/m_03761491249994435487_3148384703.didat");
	xsi_register_executes(pe);
}
