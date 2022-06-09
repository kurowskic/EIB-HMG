*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE Import()
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main
  DECLARE WINDOW win_Download


  IF !IsWIndowDefined( "win_Import" )


#IFDEF _HMG_2_

    LOAD WINDOW import2 AS win_Import

    win_Import.TitleBar := .F.
    win_Import.SysMenu  := .T.
    win_Import.Sizable  := .F.

#ENDIF


#IFDEF _HMG_3_

    LOAD WINDOW import3 AS win_Import

#ENDIF


    SetProperty( "win_Import", "frm_Main" ,"Caption" ,"" )
    SetProperty( "win_Import", "lbl_0"    ,"Value"   ,"" )

    SetProperty( "win_Import", "lbl_1"    ,"Value"   , "Importowanie danych..." )


    ON KEY ALT+F4 OF win_Import ACTION { || NIL }


    AADD( aFrm , { "win_Import" , win_Import.Row, win_Import.Col } )

    win_Import.img_APPTitle.Picture  := "APP_MAIN"

    win_Import.Activate()

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "Import_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
