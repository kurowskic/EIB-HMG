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


  win_Main.lbl_Counter.Value := STR( LEN( aDataBase ) )
  win_Main.lbl_Date.Value    := GetDateFile()

  nPage := 1

  ViewData( nPage )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*