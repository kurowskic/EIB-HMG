*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION GetDateFile()
*-----------------------------------------------------------------------------*

  LOCAL cDateFile
  LOCAL cFile
  LOCAL aFileInfo

  cDateFile := ""
  cFile     := ""
  aFileInfo := {}


  cFile := GetCurrentFolder() + "\lesp.csv"


  IF FILE ( cFile )

    aFileInfo := Directory ( cFile )

    cDateFile := DtoC( aFileInfo[ 1 , F_DATE ] ) + " " + aFileInfo[ 1 , F_TIME ]	 

    cDateFile := STRTRAN( cDateFile , "/01/" , " stycznia " )
    cDateFile := STRTRAN( cDateFile , "/02/" , " lutego " )
    cDateFile := STRTRAN( cDateFile , "/03/" , " marca " )
    cDateFile := STRTRAN( cDateFile , "/04/" , " kwietnia " )
    cDateFile := STRTRAN( cDateFile , "/05/" , " maja " )
    cDateFile := STRTRAN( cDateFile , "/06/" , " czerwca " )
    cDateFile := STRTRAN( cDateFile , "/07/" , " lipca " )
    cDateFile := STRTRAN( cDateFile , "/08/" , " sierpnia " )
    cDateFile := STRTRAN( cDateFile , "/09/" , " wrzeúnia " )
    cDateFile := STRTRAN( cDateFile , "/10/" , " paüdziernika " )
    cDateFile := STRTRAN( cDateFile , "/11/" , " listopada " )
    cDateFile := STRTRAN( cDateFile , "/12/" , " grudnia " )

  ENDIF


RETURN cDateFile
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
