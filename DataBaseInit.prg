*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE DataBaseInit()
*-----------------------------------------------------------------------------*

  MEMVAR aDataBase
  MEMVAR nPage

  DECLARE WINDOW win_Main

  aDataBase := {}

  CSV2Memeory( ;
      ALLTRIM( win_Main.txb_Name.Value    ) ;
    , ALLTRIM( win_Main.txb_Address.Value ) ;
    , ALLTRIM( win_Main.txb_Place.Value   ) ;
    )


#IFDEF _HMG_2_

  win_Main.lbl_Counter.Value := STR( LEN( aDataBase ) )
  win_Main.lbl_Date.Value    := GetDateFile()

#ENDIF


#IFDEF _HMG_3_

  Show_TitleBar()
  
#ENDIF


  nPage := 1

  ViewData( nPage )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
