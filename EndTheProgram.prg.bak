*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE EndTheProgram()
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main
  DECLARE WINDOW win_EndTheProgram


  IF !IsWIndowDefined( win_EndTheProgram )


#IFDEF _HMG_2_

    LOAD WINDOW EndTheProgram2 AS win_EndTheProgram

    win_EndTheProgram.TitleBar := .F.
    win_EndTheProgram.SysMenu  := .T.
    win_EndTheProgram.Sizable  := .F.

#ENDIF


#IFDEF _HMG_3_

    LOAD WINDOW EndTheProgram3 AS win_EndTheProgram

#ENDIF


    SetProperty( "win_EndTheProgram" , "btn_YES" , "Action" , { || win_EndTheProgram_btn_YES() } )
    SetProperty( "win_EndTheProgram" , "btn_NOT" , "Action" , { || win_EndTheProgram_btn_NOT() } )


    ON KEY ALT+F4 OF win_EndTheProgram ACTION { || NIL }


    AADD( aFrm , { "win_EndTheProgram"    , ;
                 win_EndTheProgram.Row  , ;
                 win_EndTheProgram.Col  , ;
               } )


    win_EndTheProgram.img_APPTitle.Picture  := "APP_MAIN"

    win_EndTheProgram.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "EndTheProgram_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
