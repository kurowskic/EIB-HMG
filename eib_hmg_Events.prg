*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnInit()
*-----------------------------------------------------------------------------*

  win_Main.Hide
  
  AutoAdjustControls( "win_Main" )

  CenterMainWindow()

  CTK_DrawBorder( "win_Main" )

  win_Main.Show

  DO_Events()


  DataBaseInit()


#IFDEF __SQLITE__


  IF DataBaseSqliteGetCount() == "0"

    DownloadQuestion( "Brak danych" )

  ENDIF
  
  
#ELSE

  IF LEN( aDataBase ) == 0

    DownloadQuestion( "Brak danych" )

  ENDIF
  
#ENDIF


RETURN
*-----------------------------------------------------------------------------*


#IFDEF _HMG_3_
*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnPaint()
*-----------------------------------------------------------------------------*

  Show_TitleBar()
  DO_Events()

RETURN
*-----------------------------------------------------------------------------*
#ENDIF


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_Center_Action()
*-----------------------------------------------------------------------------*

  LOCAL nApp_Adjust_X
  LOCAL nApp_Adjust_Y  
  
  nApp_Adjust_X :=   APP_ADJUST_X
  nApp_Adjust_Y :=   APP_ADJUST_Y

  
  APP_ROW    :=    0
  APP_COL    :=    0
  APP_HEIGHT :=  824
  APP_WIDTH  := 1536

  APP_ADJUST_X := 1 / nApp_Adjust_X
  APP_ADJUST_Y := 1	/ nApp_Adjust_Y

  win_Main.Hide
  DO_Events() 

  AutoAdjustControls( "win_Main" )
  DO_Events() 

  APP_ADJUST_X := 1
  APP_ADJUST_Y := 1	
 
  SetProperty( 'win_Main' , 'Row'    , APP_ROW    * APP_ADJUST_Y )
  SetProperty( 'win_Main' , 'Col'    , APP_COL    * APP_ADJUST_X )
  SetProperty( 'win_Main' , 'Height' , APP_HEIGHT * APP_ADJUST_Y )
  SetProperty( 'win_Main' , 'Width'  , APP_WIDTH  * APP_ADJUST_X )

  DO_Events()
  
  CenterMainWindow()
  
  win_Main.btn_Max.Show  
  win_Main.Show

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_Max_Action()
*-----------------------------------------------------------------------------*

  IF GetDesktopRealHeight() > GetProperty( "win_Main" , "Height" ) ;
	.AND. ;
	GetDesktopRealWidth() > GetProperty( "win_Main" , "Width" )
		   
    APP_ADJUST_Y :=  GetDesktopRealHeight() / win_Main.Height
	SetProperty( "win_Main" , "Height" , GetProperty( "win_Main" , "Height" ) * APP_ADJUST_Y )
	  
    APP_ADJUST_X := GetDesktopRealWidth() / win_Main.Width
    SetProperty( "win_Main" , "Width" , GetProperty( "win_Main" , "Width" ) * APP_ADJUST_X )
	   
    win_Main.btn_Max.Hide

    win_Main.Hide
	
    DO_Events() 

#IFDEF _HMG_2_
	
    ERASE WINDOW "win_Main"
    DO_Events() 

#ENDIF


#IFDEF _HMG_3_

    ERASE WINDOW win_Main
    DO_Events() 

#ENDIF


    AutoAdjustControls( "win_Main" )
    DO_Events() 
	
    CenterMainWindow()
    DO_Events()
  
    APP_HEIGHT := win_Main.Height
    APP_WIDTH  := win_Main.Width
	
    CTK_DrawBorder( "win_Main" )
  
    win_Main.Show

    DO_Events()

  ENDIF

	
RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_About_Action()
*-----------------------------------------------------------------------------*

  About()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_DownloadCSV_Action()
*-----------------------------------------------------------------------------*


#IFDEF __SQLITE__

  IF DataBaseSqliteGetCount() == "0"
  
    DownloadQuestion( "Brak danych" )

  ELSE

    DownloadQuestion( "Aktualiazja danych" )

  ENDIF  


#ELSE


  IF LEN( aDataBase ) == 0

    DownloadQuestion( "Brak danych" )

  ELSE

    DownloadQuestion( "Aktualiazja danych" )

  ENDIF


#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_ExitPR()
*-----------------------------------------------------------------------------*

  EndOfProgram()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_MinPR()
*-----------------------------------------------------------------------------*

  aFrm := CTK_Minimize( aFrm )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_txb_Name_OnChange()
*-----------------------------------------------------------------------------*

  ClearRecords()
  SetNavigation()
  win_Main_lbl_Find_Action()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_txb_Address_OnChange()
*-----------------------------------------------------------------------------*

  ClearRecords()
  SetNavigation()
  win_Main_lbl_Find_Action()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_txb_Place_OnChange()
*-----------------------------------------------------------------------------*

  ClearRecords()
  SetNavigation()
  win_Main_lbl_Find_Action()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Name_Action()
*-----------------------------------------------------------------------------*

  MEMVAR nPage

  win_Main.txb_Name.Value := ""

  do_events()
  win_Main.lbl_BackGround.Setfocus()


#IFDEF __SQLITE__

  DataBaseSqliteViewData( nPage )

#ELSE

  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Name_OnMouseHover()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Name.Backcolor := { 000 , 170 , 000 }
  win_Main.lbl_Name.FontColor := { 255 , 255 , 255 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Name_Leave()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Name.Backcolor := { 255 , 255 , 255 }
  win_Main.lbl_Name.FontColor := { 000 , 170 , 000 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Address_Action()
*-----------------------------------------------------------------------------*

  MEMVAR nPage

  win_Main.txb_Address.Value := ""

  do_events()
  win_Main.lbl_BackGround.Setfocus()


#IFDEF __SQLITE__

  DataBaseSqliteViewData( nPage )

#ELSE

  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Address_OnMouseHover()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Address.Backcolor := { 000 , 170 , 000 }
  win_Main.lbl_Address.FontColor := { 255 , 255 , 255 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Address_Leave()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Address.Backcolor := { 255 , 255 , 255 }
  win_Main.lbl_Address.FontColor := { 000 , 170 , 000 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Place_Action()
*-----------------------------------------------------------------------------*

  MEMVAR nPage

  win_Main.txb_Place.Value := ""

  do_events()
  win_Main.lbl_BackGround.Setfocus()


#IFDEF __SQLITE__

  DataBaseSqliteViewData( nPage )

#ELSE

  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Place_OnMouseHover()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Place.Backcolor := { 000 , 170 , 000 }
  win_Main.lbl_Place.FontColor := { 255 , 255 , 255 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Place_Leave()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Place.Backcolor := { 255 , 255 , 255 }
  win_Main.lbl_Place.FontColor := { 000 , 170 , 000 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Find_Action()
*-----------------------------------------------------------------------------*

  MEMVAR aDataBase
  MEMVAR nPage

  aDataBase := {}

  CSV2Memeory( ;
      ALLTRIM( win_Main.txb_Name.Value    ) ;
    , ALLTRIM( win_Main.txb_Address.Value ) ;
    , ALLTRIM( win_Main.txb_Place.Value   ) ;
    )

  nPage := 1


#IFDEF __SQLITE__

  DataBaseSqliteViewData( nPage )

#ELSE

  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_First_Action()
*-----------------------------------------------------------------------------*

  MEMVAR nPage

  win_Main.lbl_BackGround.Setfocus()

  nPage := 1


#IFDEF __SQLITE__

  DataBaseSqliteViewData( nPage )

#ELSE

  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_First_OnMouseHover()
*-----------------------------------------------------------------------------*

  win_Main.lbl_First.Backcolor := { 000 , 170 , 000 }
  win_Main.lbl_First.FontColor := { 255 , 255 , 255 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_First_Leave()
*-----------------------------------------------------------------------------*

  win_Main.lbl_First.Backcolor := { 255 , 255 , 255 }
  win_Main.lbl_First.FontColor := { 000 , 170 , 000 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Prior_Action()
*-----------------------------------------------------------------------------*

  MEMVAR nPage

  win_Main.lbl_BackGround.Setfocus()


  IF nPage - 1 > 0

    nPage--

  ENDIF


#IFDEF __SQLITE__

  DataBaseSqliteViewData( nPage )

#ELSE

  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Prior_OnMouseHover()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Prior.Backcolor := { 000 , 170 , 000 }
  win_Main.lbl_Prior.FontColor := { 255 , 255 , 255 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Prior_Leave()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Prior.Backcolor := { 255 , 255 , 255 }
  win_Main.lbl_Prior.FontColor := { 000 , 170 , 000 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Next_Action()
*-----------------------------------------------------------------------------*

  MEMVAR aDataBase
  MEMVAR nPage

  win_Main.lbl_BackGround.Setfocus()





#IFDEF __SQLITE__

   nRecords := DataBaseSqliteGetCountRecords( win_Main.txb_Name.Value , win_Main.txb_Address.Value , win_Main.txb_Place.Value )
   
   
   IF nPage + 1 < ( ( INT ( nRecords / 5 ) ) + 1 ) + 1

    nPage++

  ENDIF 
 
 
  DataBaseSqliteViewData( nPage )

#ELSE


  IF nPage + 1 < ( ( INT ( LEN( aDataBase ) / 5 ) ) + 1 ) + 1

    nPage++

  ENDIF
  
  
  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Next_OnMouseHover()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Next.Backcolor := { 000 , 170 , 000 }
  win_Main.lbl_Next.FontColor := { 255 , 255 , 255 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Next_Leave()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Next.Backcolor := { 255 , 255 , 255 }
  win_Main.lbl_Next.FontColor := { 000 , 170 , 000 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Last_Action()
*-----------------------------------------------------------------------------*

  MEMVAR aDataBase
  MEMVAR nPage

  win_Main.lbl_BackGround.Setfocus()

#IFDEF __SQLITE__

  nRecords := DataBaseSqliteGetCountRecords( win_Main.txb_Name.Value , win_Main.txb_Address.Value , win_Main.txb_Place.Value )

  IF INT ( nRecords / 5 ) == ( nRecords / 5 )

    nPage := ( ( INT ( nRecords / 5 ) )     )

  ELSE

    nPage := ( ( INT ( nRecords / 5 ) ) + 1 )

  ENDIF
  
  
  DataBaseSqliteViewData( nPage )

#ELSE

  IF INT ( LEN( aDataBase ) / 5 ) == ( LEN( aDataBase ) / 5 )

    nPage := ( ( INT ( LEN( aDataBase ) / 5 ) )     )

  ELSE

    nPage := ( ( INT ( LEN( aDataBase ) / 5 ) ) + 1 )

  ENDIF


  ViewData( nPage )

#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Last_OnMouseHover()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Last.Backcolor := { 000 , 170 , 000 }
  win_Main.lbl_Last.FontColor := { 255 , 255 , 255 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_Last_Leave()
*-----------------------------------------------------------------------------*

  win_Main.lbl_Last.Backcolor := { 255 , 255 , 255 }
  win_Main.lbl_Last.FontColor := { 000 , 170 , 000 }

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_EPUAP_Action()
*-----------------------------------------------------------------------------*

  ShellExecute ( 0 , "open" , "http://epuap.gov.pl" , , , 1 )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_csv_Action()
*-----------------------------------------------------------------------------*

  ShellExecute ( 0 , "open" , "https://epuap.gov.pl/LESP/LESP.csv" , , , 1 )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_xml_Action()
*-----------------------------------------------------------------------------*

  ShellExecute ( 0 , "open" , "https://epuap.gov.pl/LESP/LESP.xml" , , , 1 )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
