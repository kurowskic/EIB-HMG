*-----------------------------------------------------------------------------*
* EIB-HMG | About.prg
*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE About()
*-----------------------------------------------------------------------------*

  LOCAL aControls

  PRIVATE aFrmControls
  PRIVATE aFormProperty

  DECLARE WINDOW win_Main
  DECLARE WINDOW win_About

  aControls := {}
  aFrmControls := {}
  aFormProperty := {}


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


    SetProperty( "win_About" , "frm_Main" , "Caption" , ""        )
    SetProperty( "win_About" , "lbl_0"    , "Value"   , WERSJA_PR )
    SetProperty( "win_About" , "lbl_0_"   , "Value"   , WERSJA_DB )

    SetProperty( "win_About" , "lbl_1"    , "Value"   , "Christian T. Kurowski" )
    SetProperty( "win_About" , "lbl_2"    , "Value"   , MiniGUIVersion()        )


    IF "MiniGUI" $ MiniGUIVersion()

      SetProperty( "win_About" , "lbl_3"  , "Value"   , "http://hmgextended.com"   )

    ELSE

      SetProperty( "win_About" , "lbl_3"  , "Value"   , "http://www.hmgforum.com/" )

    ENDIF


    SetProperty( "win_About" , "lbl_4"    , "Value"   , HB_Version()               )
    SetProperty( "win_About" , "lbl_5"    , "Value"   , "http://harbour.github.io" )
    SetProperty( "win_About" , "lbl_6"    , "Value"   , HB_COMPILER()              )


    IF "Borland" $ HB_COMPILER()

      SetProperty( "win_About" , "lbl_7"  , "Value"   , "https://www.embarcadero.com/free-tools/ccompiler/free-download" )

    ELSE

      SetProperty( "win_About" , "lbl_7"  , "Value"   , "https://sourceforge.net/projects/mingw-w64/" )

    ENDIF


    ON KEY ALT + F4 OF win_About ACTION { || Nil }

    AADD( aFrm, { "win_About" , win_About.Row , win_About.Col } )


#IFDEF _HMG_2_

    aControls := _GetAllControlsInForm( "win_About" )

#ENDIF


#IFDEF _HMG_3_

    aControls := _GetArrayOfAllControlsForForm( "win_About" )

#ENDIF


    FOR nI := 1 TO LEN( aControls )

      AADD( aFrmControls ,;
      { "win_About" ,;
        aControls[ nI ] ,;
        GetProperty( "win_About" , aControls[ nI ] , "Row"      ) ,;
        GetProperty( "win_About" , aControls[ nI ] , "Col"      ) ,;
        GetProperty( "win_About" , aControls[ nI ] , "Width"    ) ,;
        GetProperty( "win_About" , aControls[ nI ] , "Height"   ) ,;
        GetProperty( "win_About" , aControls[ nI ] , "FontSize" )  ;
      } )

    NEXT nI


    AADD( aFormProperty ,;
    { "win_About" ,;
      GetProperty( "win_About" , "Row"    ) ,;
      GetProperty( "win_About" , "Col"    ) ,;
      GetProperty( "win_About" , "Width"  ) ,;
      GetProperty( "win_About" , "Height" )  ;
    } )

    win_About.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "About_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
