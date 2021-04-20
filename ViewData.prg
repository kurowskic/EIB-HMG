*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE ViewData( xnPage )
*-----------------------------------------------------------------------------*

  LOCAL nPage
  LOCAL nRecord1
  LOCAL nRecord2
  LOCAL nRecord3
  LOCAL nRecord4
  LOCAL nRecord5 

  MEMVAR aDataBase

  DECLARE WINDOW win_Main

  DEFAULT xnPage := 1

  nPage := xnPage * 5

  nRecord1 := ( nPage - 4 )
  nRecord2 := ( nPage - 3 )
  nRecord3 := ( nPage - 2 )
  nRecord4 := ( nPage - 1 )
  nRecord5 := ( nPage - 0 )

  ClearRecords()

  win_Main.lbl_First.Value := "||<< 1 <<"


  IF xnPage > 1

    win_Main.lbl_Prior.Value := "<< " + ALLTRIM( STR( xnPage - 1 ) ) + " <<"
 
  ELSE

    win_Main.lbl_Prior.Value := "<< " + ALLTRIM( STR( xnPage ) ) + " <<" 

  ENDIF


  IF xnPage < ( INT ( LEN( aDataBase ) ) / 5 )

    win_Main.lbl_Next.Value := ">> " + ALLTRIM( STR( xnPage + 1 ) ) + " >>"

  ELSE

    win_Main.lbl_Next.Value := ">> " + ALLTRIM( STR( xnPage ) ) + " >>"

  ENDIF


  IF INT ( LEN( aDataBase ) / 5 ) == ( LEN( aDataBase ) / 5 )


    IF LEN( aDataBase ) > 0

      win_Main.lbl_Last.Value := ">> " + ALLTRIM( STR( ( INT ( LEN( aDataBase ) / 5 ) )     ) ) + " >>||"

    ELSE

      win_Main.lbl_Last.Value := ">> 1 >>||"

    ENDIF


  ELSE

    win_Main.lbl_Last.Value := ">> " + ALLTRIM( STR( ( INT ( LEN( aDataBase ) / 5 ) ) + 1 ) ) + " >>||"

  ENDIF


  IF LEN ( aDataBase ) > 0


     IF LEN ( aDataBase ) > ( xnPage * 5 ) - 5

       win_Main.edb_Record1.Value := ;
           DeleteQuote( aDataBase [ nRecord1  , 1 ] ) ;
         + CRLF ;
         + DeleteQuote( "Regon: " + aDataBase [ nRecord1 , 2 ] + " , adres: " + aDataBase [ nRecord1 , 3 ] + " , " + aDataBase [ nRecord1 , 4 ] + " " + aDataBase [ nRecord1 , 5 ] ) ;
         + CRLF ;
         + DeleteQuote( aDataBase [ nRecord1 , 6 ] )

     ENDIF


     IF LEN ( aDataBase ) > ( xnPage * 5 ) - 4

       win_Main.edb_Record2.Value := ;
           DeleteQuote( aDataBase [ nRecord2  , 1 ] ) ;
         + CRLF ;
         + DeleteQuote( "Regon: " + aDataBase [ nRecord2 , 2 ] + " , adres: " + aDataBase [ nRecord2 , 3 ] + " , " + aDataBase [ nRecord2 , 4 ] + " " + aDataBase [ nRecord2 , 5 ] ) ;
         + CRLF ;
         + DeleteQuote( aDataBase [ nRecord2 , 6 ] )

     ENDIF


     IF LEN ( aDataBase ) > ( xnPage * 5 ) - 3

       win_Main.edb_Record3.Value := ;
           DeleteQuote( aDataBase [ nRecord3  , 1 ] ) ;
         + CRLF ;
         + DeleteQuote( "Regon: " + aDataBase [ nRecord3 , 2 ] + " , adres: " + aDataBase [ nRecord3 , 3 ] + " , " + aDataBase [ nRecord3 , 4 ] + " " + aDataBase [ nRecord3 , 5 ] ) ;
         + CRLF ;
         + DeleteQuote( aDataBase [ nRecord3 , 6 ] )

     ENDIF


     IF LEN ( aDataBase ) > ( xnPage * 5 ) - 2

       win_Main.edb_Record4.Value := ;
           DeleteQuote( aDataBase [ nRecord4  , 1 ] ) ;
         + CRLF ;
         + DeleteQuote( "Regon: " + aDataBase [ nRecord4 , 2 ] + " , adres: " + aDataBase [ nRecord4 , 3 ] + " , " + aDataBase [ nRecord4 , 4 ] + " " + aDataBase [ nRecord4 , 5 ] ) ;
         + CRLF ;
         + DeleteQuote( aDataBase [ nRecord4 , 6 ] )

     ENDIF


     IF LEN ( aDataBase ) > ( xnPage * 5 ) - 1

       win_Main.edb_Record5.Value := ;
           DeleteQuote( aDataBase [ nRecord5  , 1 ] ) ;
         + CRLF ;
         + DeleteQuote( "Regon: " + aDataBase [ nRecord5 , 2 ] + " , adres: " + aDataBase [ nRecord5 , 3 ] + " , " + aDataBase [ nRecord5 , 4 ] + " " + aDataBase [ nRecord5 , 5 ] ) ;
         + CRLF ;
         + DeleteQuote( aDataBase [ nRecord5 , 6 ] )

     ENDIF


  ENDIF


  SetNavigation()


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
