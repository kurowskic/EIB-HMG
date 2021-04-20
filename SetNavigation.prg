*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE  SetNavigation()
*-----------------------------------------------------------------------------*

  MEMVAR aDataBase
  MEMVAR nPage

  DECLARE WINDOW win_Main

  win_Main.lbl_First.Enabled := TRUE
  win_Main.lbl_Prior.Enabled := TRUE
  win_Main.lbl_Next.Enabled  := TRUE
  win_Main.lbl_Last.Enabled  := TRUE

  IF nPage == 1

    win_Main.lbl_First.Enabled := FALSE
    win_Main.lbl_Prior.Enabled := FALSE

  ENDIF


  IF  ( INT ( LEN( aDataBase ) / 5 ) ) < 2

    IF INT ( LEN( aDataBase ) / 5 ) == ( LEN( aDataBase ) / 5 )

      win_Main.lbl_Next.Enabled  := FALSE
      win_Main.lbl_Last.Enabled  := FALSE

    ENDIF

  ENDIF


  IF nPage == ( INT ( LEN( aDataBase ) / 5 ) ) + 1

    win_Main.lbl_Next.Enabled  := FALSE
    win_Main.lbl_Last.Enabled  := FALSE

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
