*-----------------------------------------------------------------------------*
#include "eib_ver.ch"
*-----------------------------------------------------------------------------*

#DEFINE  _PRG1_      '2022'
#DEFINE  _PRG2_      '164'
#DEFINE  _PRG3_      '1'

#DEFINE  _DB1_       '2022'
#DEFINE  _DB2_       '164'
#DEFINE  _DB3_       '1'


#DEFINE  _OLD_PRG1_  ''
#DEFINE  _OLD_PRG2_  ''
#DEFINE  _OLD_PRG3_  ''

#DEFINE  _OLD_DB1_   ''
#DEFINE  _OLD_DB2_   ''
#DEFINE  _OLD_DB3_   ''


#DEFINE NAZWA_PR     "Elektroniczne Skrzynki Podawcze"

#DEFINE WERSJA_PR    _PRG1_+"."+_PRG2_+"."+_PRG3_
#DEFINE WERSJA_DB    _DB1_+"."+_DB2_+"."+_DB3_


#DEFINE MsgNoYes(c)  MsgYesNo( c , NAZWA_PR , .t. , 0 ,  .F. , .F. )


#INCLUDE "Dbstruct.ch"
#INCLUDE "common.ch"
#INCLUDE "fileio.ch"
#INCLUDE "Directry.ch"


#IFDEF __SQLITE__

  #IFDEF  _HMG_2_
    #INCLUDE "hbsqlit3.ch"
  #ENDIF

#ENDIF


#IFDEF _HMG_2_

  #INCLUDE  "minigui.ch"

  #INCLUDE  "miniprint.ch"
  #INCLUDE  "i_winuser.ch"

  #include "i_UsrInit.ch"
  #include "i_UsrSOOP.ch"

  #include "hbinkey.ch"

#ENDIF


#IFDEF _HMG_3_

  #INCLUDE  "hmg.ch"

#ENDIF


#IFDEF _HMG_2_

  #DEFINE  FALSE .F.
  #DEFINE  TRUE  .T.

#ENDIF


#define CRLF CHR( 13 ) + CHR( 10 )
#define CR CHR( 13 )
#define LF CHR( 10 )


#IFDEF _HMG_2_

  #define HTCAPTION             2
  #define WM_NCLBUTTONDOWN    161

  #define EM_SETCUEBANNER  0x1501

#ENDIF

#DEFINE VIEW_RECORDS 5

#ifndef __XHARBOUR__

   #xcommand TRY                => bError := errorBlock( {|oError| break( oError ) } ) ;;
                                   BEGIN SEQUENCE
   #xcommand CATCH [<!oError!>] => errorBlock( bError ) ;;
                                   RECOVER [USING <oError>] <-oError-> ;;
                                   errorBlock( bError )
#endif


MEMVAR APP_ROW
MEMVAR APP_COL
MEMVAR APP_HEIGHT
MEMVAR APP_WIDTH
MEMVAR aFrm

*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
