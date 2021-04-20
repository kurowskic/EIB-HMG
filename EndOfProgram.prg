*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE EndOfProgram()
*-----------------------------------------------------------------------------*

  MEMVAR lbl_BackGround
  MEMVAR img_APPTitle
  MEMVAR lbl_APPTitle
  MEMVAR frm_Main
  MEMVAR lbl_0
  MEMVAR lbl_1
  MEMVAR btn_YES
  MEMVAR btn_NOT

  PRIVATE lbl_BackGround
  PRIVATE img_APPTitle
  PRIVATE lbl_APPTitle
  PRIVATE frm_Main
  PRIVATE lbl_0
  PRIVATE lbl_1
  PRIVATE btn_YES
  PRIVATE btn_NOT


  DECLARE WINDOW win_Main

  DECLARE WINDOW win_EndOfProgram


  IF !IsWIndowDefined( win_EndOfProgram )


#IFDEF _HMG_2_

    LOAD WINDOW EndOfProgram2 AS win_EndOfProgram

    win_EndOfProgram.TitleBar := .F.
    win_EndOfProgram.SysMenu  := .T.
    win_EndOfProgram.Sizable  := .F.

    SetProperty( "win_EndOfProgram" , "btn_YES" , "Action" , { || EndOfProgram_btn_YES() } )
    SetProperty( "win_EndOfProgram" , "btn_NOT" , "Action" , { || EndOfProgram_btn_NOT() } )

#ENDIF


#IFDEF _HMG_3_

    LOAD WINDOW EndOfProgram3 AS win_EndOfProgram

#ENDIF


  AADD( aFrm , { "win_EndOfProgram"    , ;
                 win_EndOfProgram.Row  , ;
                 win_EndOfProgram.Col  , ;
               } )

  ON KEY ALT+F4 OF win_EndOfProgram ACTION { || NIL }

  CTK_DrawBorder( "win_EndOfProgram" )

  win_EndOfProgram.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "EndOfProgram_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
