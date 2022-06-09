*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION download_csv( xlProgress )
*-----------------------------------------------------------------------------*
* https://www.w3schools.com/xml/ajax_xmlhttprequest_create.asp
*-----------------------------------------------------------------------------*
// -> 0: OK
// -> 1: NoInternetAccess

  LOCAL oHTTPS
  LOCAL cReturn      := ""
  LOCAL cURL         := "https://epuap.gov.pl/LESP/LESP.csv"
  LOCAL nFileHandler
  LOCAL nSuccess
  LOCAL cFile
  LOCAL nLevel := 1
  LOCAL isInternetAccess := TRUE
  

  DEFAULT xlProgress := TRUE

  DECLARE WINDOW win_Download


  IF xlProgress

    win_Download.prb_1.Value := 10
    DO_Events()

  ENDIF


  cFile := GetTempFolder() + "\lesp.csv"

  oHTTPS := CreateObject("Microsoft.XMLHTTP")


  IF .NOT. EMPTY( oHTTPS:Open( "GET" , cURL , .F. ) )

    oHTTPS:Send()

    cReturn := oHTTPS:responseText

  ELSE

    isInternetAccess := FALSE

  ENDIF


  IF xlProgress

    win_Download.prb_1.Value := 75
    DO_Events()

  ENDIF


  IF LEN( cReturn ) > 0

    nFileHandler := FCreate( cFile )

    nSuccess := FWrite( nFileHandler , cReturn )


    IF nSuccess <> LEN( cReturn )

      cReturn := ""

    ELSE

      FClose( nFileHandler )

    ENDIF

  ELSE

    nLevel := 2

  ENDIF


  IF xlProgress

    win_Download.prb_1.Value := 100
    DO_Events()

  ENDIF


  hb_IdleSleep( 1 )

  IF isInternetAccess == FALSE

    nLevel := 1

  ENDIF


RETURN nLevel
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
