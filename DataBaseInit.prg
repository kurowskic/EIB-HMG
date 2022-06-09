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


#IFDEF __SQLITE__


  IF !FILE("db_lesp.db")

    DataBaseSqliteCreate()
    DataBaseInfo()

  ELSE

    IF DataBaseSqliteGetCount() == "NIL"

      DataBaseInfo()

    ELSE

      IF ( DataBaseSqliteGetCountRecords() == 0.00 )

        DataBaseInfo()

      ENDIF

    ENDIF

  ENDIF


#ELSE


  CSV2Memeory( ;
      ALLTRIM( win_Main.txb_Name.Value    ) ;
    , ALLTRIM( win_Main.txb_Address.Value ) ;
    , ALLTRIM( win_Main.txb_Place.Value   ) ;
    )

  DataBaseInfo()


#ENDIF


  DataBaseInfo()


RETURN
*-----------------------------------------------------------------------------*


#IFDEF __SQLITE__

*-----------------------------------------------------------------------------*
PROCEDURE DataBaseImport()
*-----------------------------------------------------------------------------*

  download_csv(FALSE)

  CSV2Memeory( ;
      ALLTRIM( win_Main.txb_Name.Value    ) ;
    , ALLTRIM( win_Main.txb_Address.Value ) ;
    , ALLTRIM( win_Main.txb_Place.Value   ) ;
    )

  DataBaseSqliteCreate()

  DataBaseSqliteImportDataBase()
  aDataBase := {}

  DELETEFILE ( GetTempFolder() + "\lesp.csv" )

  DataBaseInfo()

RETURN
*-----------------------------------------------------------------------------*


#ELSE


*-----------------------------------------------------------------------------*
PROCEDURE DataBaseImport()
*-----------------------------------------------------------------------------*

  download_csv(FALSE)

  CSV2Memeory( ;
      ALLTRIM( win_Main.txb_Name.Value    ) ;
    , ALLTRIM( win_Main.txb_Address.Value ) ;
    , ALLTRIM( win_Main.txb_Place.Value   ) ;
    )

  DataBaseInfo()

RETURN
*-----------------------------------------------------------------------------*

#ENDIF


*-----------------------------------------------------------------------------*
PROCEDURE DataBaseInfo()
*-----------------------------------------------------------------------------*

#IFDEF _HMG_2_

#IFDEF __SQLITE__

  IF DataBaseSqliteGetCountRecords() > 0

    win_Main.lbl_Counter.Value := DataBaseSqliteGetCount()
    win_Main.lbl_Date.Value    := DataBaseSqliteGetDate()

  ELSE

    win_Main.lbl_Counter.Value := ""
    win_Main.lbl_Date.Value    := "Brak danych. Pobierz dane --->>>"

  ENDIF


#ELSE


  IF LEN( aDataBase ) > 0

    win_Main.lbl_Counter.Value := STR( LEN( aDataBase ) )
    win_Main.lbl_Date.Value    := GetDateFile()

  ELSE

    win_Main.lbl_Counter.Value := ""
    win_Main.lbl_Date.Value    := "Brak danych. Pobierz dane --->>>"

  ENDIF


#ENDIF


#ENDIF


#IFDEF _HMG_3_

  Show_TitleBar()
  win_Main.Hide
  win_Main.Show

#ENDIF


#IFDEF __SQLITE__

  nPage := 1
  DataBaseSqliteViewData( nPage )

#ELSE

  nPage := 1
  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
