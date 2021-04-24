*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE About()
*-----------------------------------------------------------------------------*

  MEMVAR lbl_BackGround
  MEMVAR img_APPTitle
  MEMVAR lbl_APPTitle
  MEMVAR btn_ExitPR
  MEMVAR btn_MinPR
  MEMVAR frm_Main
  MEMVAR lbl_0
  MEMVAR lbl_0_
  MEMVAR lbl_1
  MEMVAR lbl_2
  MEMVAR lbl_3
  MEMVAR lbl_4
  MEMVAR lbl_5
  MEMVAR lbl_6
  MEMVAR lbl_7
  MEMVAR btn_OK


  PRIVATE lbl_BackGround
  PRIVATE img_APPTitle
  PRIVATE lbl_APPTitle
  PRIVATE btn_ExitPR
  PRIVATE btn_MinPR
  PRIVATE frm_Main
  PRIVATE lbl_0
  PRIVATE lbl_0_
  PRIVATE lbl_1
  PRIVATE lbl_2
  PRIVATE lbl_3
  PRIVATE lbl_4
  PRIVATE lbl_5
  PRIVATE lbl_6
  PRIVATE lbl_7
  PRIVATE btn_OK


  DECLARE WINDOW win_Main
  DECLARE WINDOW win_About


  IF !IsWIndowDefined( win_About )


#IFDEF _HMG_2_

    LOAD WINDOW about2 AS win_About

    win_About.TitleBar := .F.
    win_About.SysMenu  := .T.
    win_About.Sizable  := .F.

#ENDIF


#IFDEF _HMG_3_

    LOAD WINDOW about3 AS win_About

#ENDIF


    SetProperty( "win_About" , "frm_Main" , "Caption" , ""         )
    SetProperty( "win_About" , "lbl_0"    , "Value"   , WERSJA_PR  )
    SetProperty( "win_About" , "lbl_0_"   , "Value"   , WERSJA_DB  )

    SetProperty( "win_About" , "lbl_1"    , "Value"   , "Christian T. Kurowski"        )
    SetProperty( "win_About" , "lbl_2"    , "Value"   , MiniGUIVersion()               )


    IF "MiniGUI" $ MiniGUIVersion()

      SetProperty( "win_About" , "lbl_3"    , "Value"   , "http://hmgextended.com" )

    ELSE

      SetProperty( "win_About" , "lbl_3"    , "Value"   , "http://www.hmgforum.com/" )

    ENDIF


    SetProperty( "win_About" , "lbl_4"    , "Value"   , HB_Version()                   )
    SetProperty( "win_About" , "lbl_5"    , "Value"   , "http://harbour.github.io"     )
    SetProperty( "win_About" , "lbl_6"    , "Value"   , HB_COMPILER()                  )


    IF "Borland" $ HB_COMPILER()

      SetProperty( "win_About" , "lbl_7"    , "Value"   , "https://www.embarcadero.com/free-tools/ccompiler/free-download" )

    ELSE

      SetProperty( "win_About" , "lbl_7"    , "Value"   , "https://sourceforge.net/projects/mingw-w64/"        )

    ENDIF


    SetProperty( "win_About" , "btn_OK"   , "Caption" , 'OK' )


    ON KEY ALT+F4 OF win_About ACTION { || NIL }


#IFDEF _HMG_2_

    win_About.Row := ( APP_ROW + ( APP_HEIGHT - win_About.Height ) / 2 )
    win_About.Col := ( APP_COL + ( APP_WIDTH  - win_About.Width  ) / 2 )

#ENDIF


    AADD( aFrm, { "win_About" , win_About.Row , win_About.Col } )

    win_About.img_APPTitle.Picture  := "APP_MAIN"

    CTK_DrawBorder( "win_About" )

    win_About.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "About_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*