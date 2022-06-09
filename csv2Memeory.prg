*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE csv2Memeory( xcName , xcAddress , xcPlace )
*-----------------------------------------------------------------------------*

  LOCAL cFile         := ""
  LOCAL cInfo         := ""
  LOCAL aDocumentTXT  := {}
  LOCAL aColumnTXT    := {}
  LOCAL cNazwa        := ""
  LOCAL cREGON        := ""
  LOCAL cAdres        := ""
  LOCAL cKod          := ""
  LOCAL cMiejscowosc  := ""
  LOCAL cUri          := ""
  LOCAL lAdd          := FALSE
  LOCAL nI

  MEMVAR aDataBase

  cFile := GetTempFolder() + "\lesp.csv"

  aDataBase := {}

  IF FILE( cFile )

    cInfo := hb_MemoRead( cFile )

    cInfo := STRTRAN( cInfo , ',,' , ' ')
    cInfo := STRTRAN( cInfo , CHR( 34 ) + CHR( 32 ) + CHR( 34 )  , CHR( 34 ) + CHR( 160 ) + CHR( 34 ) )
    cInfo := STRTRAN( cInfo , CHR( 34 ) + CHR( 34 )  , CHR( 34 ) + CHR( 160 ) + CHR( 34 ) )
    cInfo := STRTRAN( cInfo , CHR( 34 ) + "," + CHR( 34 ) , '|' )
    cInfo := STRTRAN( cInfo , CHR( 34 ) + LF , LF )

    aDocumentTXT := {}

    aDocumentTXT := HB_ATOKENS( cInfo , LF )


    FOR nI := 2 TO LEN( aDocumentTXT )


      IF nI <> LEN( aDocumentTXT )


          IF !EMPTY( ALLTRIM( aDocumentTXT[ nI ] ) )

            aColumnTXT := {}

            aColumnTXT := HB_ATOKENS( aDocumentTXT[ nI ] , "|" )

            cNazwa       := ALLTRIM( aColumnTXT[ 1 ] )
            cREGON       := ALLTRIM( aColumnTXT[ 2 ] )
            cAdres       := ALLTRIM( aColumnTXT[ 3 ] )
            cKod         := ALLTRIM( aColumnTXT[ 4 ] )
            cMiejscowosc := ALLTRIM( aColumnTXT[ 5 ] )
            cUri         := ALLTRIM( aColumnTXT[ 6 ] )


            IF      .NOT. EMPTY( cNazwa ) ;
              .AND. .NOT. EMPTY( cREGON ) ;
              .AND. .NOT. EMPTY( cAdres ) ;
              .AND. .NOT. EMPTY( cKod   ) ;
              .AND. .NOT. EMPTY( cMiejscowosc ) ;
              .AND. .NOT. EMPTY( cUri ) ;


              DO CASE

                // 0 0 0
                CASE       EMPTY( xcName ) .AND.       EMPTY( xcAddress) .AND.       EMPTY( xcPlace )

                   lAdd := TRUE

                // 0 0 1
                CASE       EMPTY( xcName ) .AND.       EMPTY( xcAddress) .AND. .NOT. EMPTY( xcPlace )

                  IF ( UPPER ( ALLTRIM( xcPlace ) ) $ UPPER ( ALLTRIM( cMiejscowosc ) ) )

                    lAdd := TRUE

                  ENDIF

                // 0 1 0
                CASE       EMPTY( xcName ) .AND. .NOT. EMPTY( xcAddress) .AND.       EMPTY( xcPlace )

                  IF ( UPPER ( ALLTRIM( xcAddress ) ) $ UPPER ( ALLTRIM( cAdres ) ) )

                    lAdd := TRUE

                  ENDIF

                // 0 1 1
                CASE       EMPTY( xcName ) .AND. .NOT. EMPTY( xcAddress) .AND. .NOT. EMPTY( xcPlace )

                  IF ( UPPER ( ALLTRIM( xcAddress ) ) $ UPPER ( ALLTRIM( cAdres ) ) ;
                     .AND. ;
                     UPPER ( ALLTRIM( xcPlace ) ) $ UPPER ( ALLTRIM( cMiejscowosc ) );
                     )

                    lAdd := TRUE

                  ENDIF


                // 1 0 0
                CASE .NOT. EMPTY( xcName ) .AND.       EMPTY( xcAddress) .AND.       EMPTY( xcPlace )

                  IF ( UPPER ( ALLTRIM( xcName ) ) $ UPPER ( ALLTRIM( cNazwa ) ) )

                    lAdd := TRUE

                  ENDIF


                // 1 0 1
                CASE .NOT. EMPTY( xcName ) .AND.       EMPTY( xcAddress) .AND. .NOT. EMPTY( xcPlace )

                  IF ( UPPER ( ALLTRIM( xcName ) ) $ UPPER ( ALLTRIM( cNazwa ) ) ;
                     .AND. ;
                     UPPER ( ALLTRIM( xcPlace ) ) $ UPPER ( ALLTRIM( cMiejscowosc ) );
                     )

                    lAdd := TRUE

                  ENDIF


                // 1 1 0
                CASE .NOT. EMPTY( xcName ) .AND. .NOT. EMPTY( xcAddress) .AND.       EMPTY( xcPlace )

                  IF ( UPPER ( ALLTRIM( xcName ) ) $ UPPER ( ALLTRIM( cNazwa ) ) ;
                     .AND. ;
                     UPPER ( ALLTRIM( xcAddress ) ) $ UPPER ( ALLTRIM( cAdres ) );
                     )

                    lAdd := TRUE

                  ENDIF


                // 1 1 1
                CASE .NOT. EMPTY( xcName ) .AND. .NOT. EMPTY( xcAddress) .AND. .NOT. EMPTY( xcPlace )

                  IF ( UPPER ( ALLTRIM( xcName ) ) $ UPPER ( ALLTRIM( cNazwa ) )      ;
                     .AND. ;
                     UPPER ( ALLTRIM( xcAddress ) ) $ UPPER ( ALLTRIM( cAdres ) )     ;
                     .AND. ;
                     UPPER ( ALLTRIM( xcPlace ) ) $ UPPER ( ALLTRIM( cMiejscowosc ) ) ;
                     )

                    lAdd := TRUE

                  ENDIF


              ENDCASE


              IF lAdd == TRUE

                AADD ( aDataBase , { cNazwa , cREGON , cAdres, cKod , cMiejscowosc , cUri, STRZERO( nI , 6 ) } )

              ENDIF


              lAdd := FALSE


            ENDIF


          ENDIF


      ENDIF


    NEXT nI


  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
