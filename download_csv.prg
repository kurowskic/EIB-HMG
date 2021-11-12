*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE download_csv(xlProgress)
*-----------------------------------------------------------------------------*
* https://www.w3schools.com/xml/ajax_xmlhttprequest_create.asp
*-----------------------------------------------------------------------------*

  LOCAL oHTTPS
  LOCAL cReturn      := ""
  LOCAL cURL         := "https://epuap.gov.pl/LESP/LESP.csv"
  LOCAL nFileHandler
  LOCAL nSuccess
  LOCAL cFile

  DEFAULT xlProgress := TRUE

  DECLARE WINDOW win_Download


  IF xlProgress

    win_Download.prb_1.Value := 10
    DO_Events()

  ENDIF


  cFile := GetTempFolder() + "\lesp.csv"

  oHTTPS := CreateObject("Microsoft.XMLHTTP")

  oHTTPS:Open( "GET" , cURL , .F. )

  oHTTPS:Send()

  cReturn := oHTTPS:responseText


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


  ENDIF


  IF xlProgress

    win_Download.prb_1.Value := 100
    DO_Events()

  ENDIF

 
  hb_IdleSleep(1)

RETURN 
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
