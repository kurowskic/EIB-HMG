*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE DataBaseSqliteCreate()
*-----------------------------------------------------------------------------*

  LOCAL db_eib
  LOCAL cTableData
  LOCAL cTableInfo
  
  LOCAL aStructData
  LOCAL aStructInfo
  
  LOCAL oSQL

  db_eib     := "db_lesp.db"
  cTableData := "lesp_current"  
  cTableInfo := "lesp_current_info"
  
  aStructData := {}
  aStructInfo := {}

  AADD( aStructData , { "Name"         , "C" , 250,0 } )
  AADD( aStructData , { "Regon"        , "C" ,  20,0 } )
  AADD( aStructData , { "Address"      , "C" , 250,0 } )  
  AADD( aStructData , { "Zip"          , "C" ,   6,0 } )
  AADD( aStructData , { "Place"        , "C" , 250,0 } )
  AAdd( aStructData , { "URI"          , "C" , 250,0 } )	
  
  AADD( aStructInfo , { "Count"        , "C" ,   6,0 } )
  AADD( aStructInfo , { "Date"         , "C" ,  30,0 } )

  oSQL := SQLiteFacade():New( db_eib ) 

  oSQL:Open()

  
  IF oSQL:ExistsTable( cTableData )  

    oSQL:DeleteTable( cTableData )

  ENDIF

  IF oSQL:ExistsTable( cTableInfo )  

    oSQL:DeleteTable( cTableInfo )

  ENDIF


  oSQL:Close()
  
  
  oSQL:Open()
  oSQL:CreateTable( cTableData , aStructData )
  oSQL:CreateTable( cTableInfo , aStructInfo )
  oSQL:Close()

RETURN 
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE DataBaseSqliteImportDataBase()
*-----------------------------------------------------------------------------*

  LOCAL oSQL

  LOCAL db_eib
  LOCAL cTableData
  LOCAL cTableInfo
  
  LOCAL sqlData
  LOCAL sqlInfo

  LOCAL nI

  LOCAL cName
  LOCAL cRegon
  LOCAL cAddress
  LOCAL cZip
  LOCAL cPlace
  LOCAL cURI

  db_eib     := "db_lesp.db"
  cTableData := "lesp_current"  
  cTableInfo := "lesp_current_info"
  
  oSQL := SQLiteFacade():New( db_eib )

  oSQL:Open()
  
  sqlData := oSQL:Prepare("INSERT INTO " + cTableData + " (Name,Regon,Address,Zip,Place,URI) VALUES(:Name,:Regon,:Address,:Zip,:Place,:URI);")
  sqlInfo := oSQL:Prepare("INSERT INTO " + cTableInfo + " (Count,Date) VALUES(:Count,:Date);")

  oSQL:BeginTransaction()

  sqlInfo:SetString( ":Count" , STR( LEN( aDataBase ) ) )
  sqlInfo:SetString( ":Date"  , GetDateFile() )
  sqlInfo:ExecuteUpdate()
  
  sqlInfo:Close()


  FOR nI := 1 TO LEN( aDataBase )

    cName    := ""
    cRegon   := ""
    cAddress := ""
    cZip     := ""
    cPlace   := ""
    cURI     := ""

    cName    := ALLTRIM( DeleteQuote( aDataBase[ nI, 1 ] ) )
    cRegon   := ALLTRIM( DeleteQuote( aDataBase[ nI, 2 ] ) )
    cAddress := ALLTRIM( DeleteQuote( aDataBase[ nI, 3 ] ) )
    cZip     := ALLTRIM( DeleteQuote( aDataBase[ nI, 4 ] ) )
    cPlace   := ALLTRIM( DeleteQuote( aDataBase[ nI, 5 ] ) )
    cURI     := ALLTRIM( DeleteQuote( aDataBase[ nI, 6 ] ) )

    sqlData:SetString( ":Name"        , cName        )
    sqlData:SetString( ":Regon"       , cRegon       )
    sqlData:SetString( ":Address"     , cAddress     )
    sqlData:SetString( ":Zip"         , cZip         )
    sqlData:SetString( ":Place"       , cPlace       )
    sqlData:SetString( ":URI"         , cURI         )
    sqlData:ExecuteUpdate()

    sqlData:reuse():clear()

  NEXT nI


  oSQL:CommitTransaction()
  
  sqlData:Close()
  oSQL:Close()

RETURN 
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION DataBaseSqliteGetCount()
*-----------------------------------------------------------------------------*

  LOCAL oSQL
  LOCAL oResponse

  LOCAL db_eib
  LOCAL cTableInfo
  LOCAL cCount

  db_eib     := "db_lesp.db"
  
  cTableInfo := "lesp_current_info"

  oSQL := SQLiteFacade():New( db_eib )

  oSQL:Open()

  cSelectSQL := "SELECT Count FROM " + cTableInfo +";"

  sqlData := oSQL:Prepare( cSelectSQL )
  oResponse := sqlData:executeQuery()

  cCount    := oResponse:getString( "Count" )  
    
  oResponse:Close()
  sqlData:Close()
  oSQL:Close()
  
RETURN cCount
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION DataBaseSqliteGetDate()
*-----------------------------------------------------------------------------*

  LOCAL oSQL
  LOCAL oResponse
  
  LOCAL db_eib
  LOCAL cTableInfo
  LOCAL cDate
  
  db_eib     := "db_lesp.db"
  
  cTableInfo := "lesp_current_info"

  oSQL := SQLiteFacade():New( db_eib )

  oSQL:Open()

  cSelectSQL := "SELECT Date FROM " + cTableInfo +";"

  sqlData := oSQL:Prepare( cSelectSQL )
  oResponse := sqlData:executeQuery()

  cDate    := oResponse:getString( "Date" )  
  
  oResponse:Close()
  sqlData:Close()
  oSQL:Close()

RETURN cDate
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION DataBaseSqliteGet5Records( xnPage , xcName , xcAddress , xcPlace )
*-----------------------------------------------------------------------------*

  LOCAL oSQL
  LOCAL oResponse
  
  LOCAL db_eib
  LOCAL cTableData
  LOCAL cSelectSQL
  LOCAL cSelectSQL_Where

  LOCAL aRecords := {}
  
  LOCAL nI

  DEFAULT xnPage    := 1 - 1
  DEFAULT xcName    := ""
  DEFAULT xcAddress := ""
  DEFAULT xcPlace   := ""

  xnPage := xnPage - 1
  
  db_eib     := "db_lesp.db"
  
  cTableData := "lesp_current"


  FOR nI := 1 TO VIEW_RECORDS
  
    AADD( aRecords , { "", "" , "" , "" , "", "" } )

  NEXT nI


  oSQL := SQLiteFacade():New( db_eib )

  oSQL:Open()
  
  cSelectSQL_Where := ;
    IIF( (.NOT. EMPTY( xcName ) .OR. .NOT. EMPTY( xcAddress ) .OR. .NOT. EMPTY( xcPlace) ) ,;
      + " WHERE ";
      + IF( (.NOT. EMPTY( xcName ) ), "Name LIKE '%" + xcName + "%'", "" );
      + IF( (.NOT. EMPTY( xcName ) .AND. .NOT. EMPTY( xcAddress ) ) , " AND " , "") ;
      + IF( (.NOT. EMPTY( xcAddress ) ), "Address LIKE '%" + xcAddress + "%'", "" );
      + IF( ( ( .NOT. EMPTY( xcName ) .OR. .NOT. EMPTY( xcAddress ) ) .AND. .NOT. EMPTY( xcPlace) ) , " AND " , "") ;
      + IF( (.NOT. EMPTY( xcPlace ) ), "Place LIKE '%" + xcPlace + "%'", "" );
      , "" ) ;

  cSelectSQL := "SELECT ";
              + "lesp_current.Name,";
              + "lesp_current.Regon,";
              + "lesp_current.Address,";
              + "lesp_current.Zip,";
              + "lesp_current.Place,";
              + "lesp_current.URI";					   
              + " FROM ";
              + ALLTRIM( cTableData );
              + cSelectSQL_Where;			  
              + " LIMIT " + ALLTRIM( STR (VIEW_RECORDS ) );
              + " OFFSET " + ALLTRIM( STR ( VIEW_RECORDS ) );
              + "*" + ALLTRIM( STR ( xnPage ) );
              + " ;"



  sqlData   := oSQL:Prepare( cSelectSQL )
  oResponse := sqlData:executeQuery()

  nRecord := 0


  WHILE ( oResponse:next() )
  
    nRecord++

    aRecords[ nRecord , 1 ] := oResponse:getString( "Name" ) 
    aRecords[ nRecord , 2 ] := oResponse:getString( "Regon" )
    aRecords[ nRecord , 3 ] := oResponse:getString( "Address" )
    aRecords[ nRecord , 4 ] := oResponse:getString( "Zip" )
    aRecords[ nRecord , 5 ] := oResponse:getString( "Place" )
    aRecords[ nRecord , 6 ] := oResponse:getString( "URI" )

  END


  oResponse:Close()
  sqlData:Close()
  oSQL:Close()

RETURN aRecords
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
FUNCTION DataBaseSqliteGetCountRecords( xcName , xcAddress , xcPlace )
*-----------------------------------------------------------------------------*

  LOCAL oSQL
  LOCAL oResponse
  
  LOCAL db_eib
  LOCAL cTableData
  LOCAL cSelectSQL
  LOCAL cSelectSQL_Where
  
  LOCAL nCount

  DEFAULT xcName    := ""
  DEFAULT xcAddress := ""
  DEFAULT xcPlace   := ""

  
  db_eib     := "db_lesp.db"
  
  cTableData := "lesp_current"

  oSQL := SQLiteFacade():New( db_eib )

  oSQL:Open()
  
  cSelectSQL_Where := ;
    IIF( (.NOT. EMPTY( xcName ) .OR. .NOT. EMPTY( xcAddress ) .OR. .NOT. EMPTY( xcPlace) ) ,;
      + " WHERE ";
      + IF( (.NOT. EMPTY( xcName ) ), "Name LIKE '%" + xcName + "%'", "" );
      + IF( (.NOT. EMPTY( xcName ) .AND. .NOT. EMPTY( xcAddress ) ) , " AND " , "") ;
      + IF( (.NOT. EMPTY( xcAddress ) ), "Address LIKE '%" + xcAddress + "%'", "" );
      + IF( ( ( .NOT. EMPTY( xcName ) .OR. .NOT. EMPTY( xcAddress ) ) .AND. .NOT. EMPTY( xcPlace) ) , " AND " , "") ;
      + IF( (.NOT. EMPTY( xcPlace ) ), "Place LIKE '%" + xcPlace + "%'", "" );
      , "" )

  cSelectSQL := "SELECT Count() ";				   
              + " FROM ";
              + ALLTRIM( cTableData );
              + cSelectSQL_Where;			  
              + " ;"


  sqlData   := oSQL:Prepare( cSelectSQL )
  oResponse := sqlData:executeQuery()

  nCount    := oResponse:getInteger( "Count()" ) 

  oResponse:Close()
  sqlData:Close()
  oSQL:Close()

RETURN nCount
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE DataBaseSqliteViewData( xnPage )
*-----------------------------------------------------------------------------*

  LOCAL nPage
  LOCAL nRecord1
  LOCAL nRecord2
  LOCAL nRecord3
  LOCAL nRecord4
  LOCAL nRecord5
  
  LOCAL nRecords

  LOCAL aDataBase := {}

  DECLARE WINDOW win_Main

  DEFAULT xnPage := 1

  nPage := xnPage * 5

  nRecord1 := 1
  nRecord2 := 2
  nRecord3 := 3
  nRecord4 := 4
  nRecord5 := 5

  ClearRecords()


  aDataBase := DataBaseSqliteGet5Records( xnPage , win_Main.txb_Name.Value , win_Main.txb_Address.Value, win_Main.txb_Place.Value ) 
  nRecords := DataBaseSqliteGetCountRecords( win_Main.txb_Name.Value , win_Main.txb_Address.Value, win_Main.txb_Place.Value )


  win_Main.lbl_First.Value := "||<< 1 <<"


  IF xnPage > 1

    win_Main.lbl_Prior.Value := "<< " + ALLTRIM( STR( xnPage - 1 ) ) + " <<"
 
  ELSE

    win_Main.lbl_Prior.Value := "<< " + ALLTRIM( STR( xnPage ) ) + " <<" 

  ENDIF


  IF xnPage < ( INT ( nRecords ) / 5 )

    win_Main.lbl_Next.Value := ">> " + ALLTRIM( STR( xnPage + 1 ) ) + " >>"

  ELSE

    win_Main.lbl_Next.Value := ">> " + ALLTRIM( STR( xnPage ) ) + " >>"

  ENDIF


  IF INT ( nRecords / 5 ) == ( nRecords / 5 )


    IF nRecords > 0

      win_Main.lbl_Last.Value := ">> " + ALLTRIM( STR( ( INT ( nRecords / 5 ) )     ) ) + " >>||"

    ELSE

      win_Main.lbl_Last.Value := ">> 1 >>||"

    ENDIF


  ELSE

    win_Main.lbl_Last.Value := ">> " + ALLTRIM( STR( ( INT ( nRecords / 5 ) ) + 1 ) ) + " >>||"

  ENDIF
 

  win_Main.edb_Record1.Value := ;
      aDataBase[ nRecord1 , 1 ] ;
    + CRLF ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord1 , 2 ] ) , "Regon: " , "" );
    + aDataBase[ nRecord1 , 2 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord1 , 3 ] ) , " , adres: " , "" );
    + aDataBase [ nRecord1 , 3 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord1 , 4 ] ) , " , adres: " , "" );
    + aDataBase[ nRecord1 , 4 ] ;
    + " " ;
    + aDataBase[ nRecord1 , 5 ] ;
    + CRLF ;
    + aDataBase[ nRecord1 , 6 ]

  win_Main.edb_Record2.Value := ;
      aDataBase[ nRecord2 , 1 ] ;
    + CRLF ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord2 , 2 ] ) , "Regon: " , "" );
    + aDataBase[ nRecord2 , 2 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord2 , 3 ] ) , " , adres: " , "" );
    + aDataBase [ nRecord2 , 3 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord2 , 4 ] ) , " , adres: " , "" );
    + aDataBase[ nRecord2 , 4 ] ;
    + " " ;
    + aDataBase[ nRecord2 , 5 ] ;
    + CRLF ;
    + aDataBase[ nRecord2 , 6 ]

  win_Main.edb_Record3.Value := ;
      aDataBase[ nRecord3 , 1 ] ;
    + CRLF ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord3 , 2 ] ) , "Regon: " , "" );
    + aDataBase[ nRecord3 , 2 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord3 , 3 ] ) , " , adres: " , "" );
    + aDataBase [ nRecord3 , 3 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord3 , 4 ] ) , " , adres: " , "" );
    + aDataBase[ nRecord3 , 4 ] ;
    + " " ;
    + aDataBase[ nRecord3 , 5 ] ;
    + CRLF ;
    + aDataBase[ nRecord3 , 6 ]

  win_Main.edb_Record4.Value := ;
      aDataBase[ nRecord4 , 1 ] ;
    + CRLF ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord4 , 2 ] ) , "Regon: " , "" );
    + aDataBase[ nRecord4 , 2 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord4 , 3 ] ) , " , adres: " , "" );
    + aDataBase [ nRecord4 , 3 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord4 , 4 ] ) , " , adres: " , "" );
    + aDataBase[ nRecord4 , 4 ] ;
    + " " ;
    + aDataBase[ nRecord4 , 5 ] ;
    + CRLF ;
    + aDataBase[ nRecord4 , 6 ]

  win_Main.edb_Record5.Value := ;
      aDataBase[ nRecord5 , 1 ] ;
    + CRLF ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord5 , 2 ] ) , "Regon: " , "" );
    + aDataBase[ nRecord5 , 2 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord5 , 3 ] ) , " , adres: " , "" );
    + aDataBase [ nRecord5 , 3 ] ;
    + IIF( .NOT. EMPTY( aDataBase[ nRecord5 , 4 ] ) , " , adres: " , "" );
    + aDataBase[ nRecord5 , 4 ] ;
    + " " ;
    + aDataBase[ nRecord5 , 5 ] ;
    + CRLF ;
    + aDataBase[ nRecord5 , 6 ]

  SetNavigation()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
