*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*

*-----------------------------------------------------------------------------*
PROCEDURE ClearRecords()
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main

  win_Main.edb_Record1.Value := ""
  win_Main.edb_Record2.Value := ""
  win_Main.edb_Record3.Value := ""
  win_Main.edb_Record4.Value := ""
  win_Main.edb_Record5.Value := ""

  win_Main.lbl_First.Value := "||<< 1 <<"
  win_Main.lbl_Prior.Value := "<< 1 <<"
  win_Main.lbl_Next.Value  := ">> 1 >>"
  win_Main.lbl_Last.Value  := ">> 1 >>||"

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
