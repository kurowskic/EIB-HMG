*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE download_csv()
*-----------------------------------------------------------------------------*
* https://www.w3schools.com/xml/ajax_xmlhttprequest_create.asp
*-----------------------------------------------------------------------------*

  LOCAL oHTTPS
  LOCAL cReturn      := ""
  LOCAL cURL         := "https://epuap.gov.pl/LESP/LESP.csv"
  LOCAL nFileHandler
  LOCAL nSuccess
  LOCAL cFile

  DECLARE WINDOW win_Download

  win_Download.prb_1.Value := 10


  cFile := GetTempFolder() + "\lesp.csv"

  oHTTPS := CreateObject("Microsoft.XMLHTTP")

  oHTTPS:Open( "GET" , cURL , .F. )

  oHTTPS:Send()

  cReturn := oHTTPS:responseText


  win_Download.prb_1.Value := 75


  IF LEN( cReturn ) > 0

    nFileHandler := FCreate( cFile )

    nSuccess := FWrite( nFileHandler , cReturn )


    IF nSuccess <> LEN( cReturn )

      cReturn := ""

    ELSE

      FClose( nFileHandler )

    ENDIF


  ENDIF


  win_Download.prb_1.Value := 100
  hb_IdleSleep(1)

RETURN 
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
